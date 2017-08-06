<?php

function update_penjualan(){
	if (isset($_POST['id'])){
		if (isset($_POST['tanggaljual'])){
			$idpenjualan = explode('-', $_POST['id']);
			$jampenjualan = $_POST['jampenjualan'];
			$tgljualbaru = date('Y-m-d',strtotime($_POST['tanggaljual'])).' '.$jampenjualan;
			db_query("UPDATE penjualan SET tglpenjualan='%s', uploaded=0, changed=1 WHERE idpenjualan=%d", $tgljualbaru, $idpenjualan[1]);
			if ($_POST['ubah'] == 'tanggal'){
				print $_POST['tanggaljual'];
			}else{
				print $jampenjualan;
			}
		}
	}else{
		$updateddata = new stdClass();
		$updateddata->error = 'ID Penjualan Empty';
		print $updateddata->error;
	}
	exit();	
}
function update_laundry(){
	if (isset($_POST['id'])){
		if (isset($_POST['tanggaljual'])){
			$idtitipanlaundry = explode('-', $_POST['id']);
			$jampenjualan = $_POST['jampenjualan'];
			$tgljualbaru = date('Y-m-d',strtotime($_POST['tanggaljual'])).' '.$jampenjualan;
			db_query("UPDATE titipanlaundry SET tglpenjualan='%s' WHERE idtitipanlaundry=%d", $tgljualbaru, $idtitipanlaundry[1]);
			if ($_POST['ubah'] == 'tanggal'){
				print $_POST['tanggaljual'];
			}else{
				print $jampenjualan;
			}
		}
	}else{
		$updateddata = new stdClass();
		$updateddata->error = 'ID titipanlaundry Empty';
		print $updateddata->error;
	}
	exit();	
}
function update_detail_penjualan(){
	if (isset($_POST['id'])){
		if (isset($_POST['qty'])){
			/* Update Detail Penjualan */
			$iddetailpenjualan = explode('-', $_POST['id']);
			$strSQL = 'SELECT jumlah FROM detailpenjualan WHERE iddetail=%d';
			$qtyLama = db_result(db_query($strSQL, $iddetailpenjualan[1]));
			$selisih = $qtyLama - $_POST['qty'];
			$strSQL = 'SELECT idpenjualan FROM detailpenjualan WHERE iddetail=%d';
			$idPenjualan = db_result(db_query($strSQL, $iddetailpenjualan[1]));
			$strSQL = 'UPDATE detailpenjualan SET jumlah=\'%f\' ';
			$strSQL .= 'WHERE iddetail=%d';
			db_query($strSQL,$_POST['qty'],$iddetailpenjualan[1]);
			/* End Update Detail Penjualan */
			/* Update Penjualan */
			$strSQL = 'SELECT SUM(hargajual*jumlah) AS total_jual FROM detailpenjualan WHERE idpenjualan=%d';
			$totalOrder = db_result(db_query($strSQL,$idPenjualan));
			$strSQL = 'SELECT SUM(hargapokok*jumlah) AS total_modal FROM detailpenjualan WHERE idpenjualan=%d';
			$totalModal = db_result(db_query($strSQL,$idPenjualan));
			$strSQL = 'UPDATE penjualan SET total=\'%f\', totalmodal=\'%f\', uploaded=0, changed=1 WHERE idpenjualan=%d';
			db_query($strSQL,$totalOrder,$totalModal,$idPenjualan);
			/* End Update Penjualan */
			/* Update Stok Product */
			$idproduct = db_result(db_query('SELECT idproduct FROM detailpenjualan WHERE iddetail=%d', $iddetailpenjualan[1]));
			$stokproduct = db_result(db_query('SELECT stok FROM product WHERE idproduct=%d',$idproduct));
			$stoksekarang = $stockproduct + $selisih;
			if (!empty($idproduct)){
				db_query("UPDATE product SET stok = stok + '%f', uploaded=0, changed=1 WHERE idproduct='%d'",$selisih,$idproduct);
				$keterangan = 'Revisi Penjualan';
				db_query("INSERT INTO transaksistock (idproduk, idpenjualan, stocksebelum, keluar, stocksetelah, keterangan) VALUES
				('%d', '%d', '%f', '%f', '%f', '%s')",$idproduct,$idPenjualan,$stokproduct,$selisih,$stoksekarang,$keterangan);
			}
			/* End Update Stok Product */
			/* Update Hutang Penjualan */
			$caraJual = db_result(db_query('SELECT carabayar FROM penjualan WHERE idpenjualan=%d',$idPenjualan));
			$kembali = db_result(db_query('SELECT kembali FROM penjualan WHERE idpenjualan=%d',$idPenjualan));
			$idPelanggan = db_result(db_query('SELECT idpelanggan FROM penjualan WHERE idpenjualan=%d',$idPenjualan));
			$bayar = db_result(db_query('SELECT bayar FROM penjualan WHERE idpenjualan=%d',$idPenjualan));
			if (!empty($idPelanggan) && ($caraJual == 'HUTANG' || $kembali < 0)){
				$besarHutang = $totalOrder - $bayar;
				$sqlUpdatePiutang = 'UPDATE detailpiutang SET besarhutang=\'%f\' ';
				$sqlUpdatePiutang .= 'WHERE idpelanggan=%d AND idpenjualan=%d';
				db_query($sqlUpdatePiutang, $besarHutang, $idPelanggan, $idPenjualan);
				syncHutangPelanggan($idPelanggan);
			}
			/* End Update Hutang Penjualan */
			$kembali = $bayar - $totalOrder;
			db_query('UPDATE penjualan SET kembali=\'%f\', uploaded=0, changed=1 WHERE idpenjualan=%d',$kembali,$idPenjualan);
			print $_POST['qty'];
		}
	}
	exit();
}
function insert_detail_penjualan(){
	$executedSQL = array();
	if (isset($_POST['idpenjualan']) && isset($_POST['idproduk']) && isset($_POST['hargajual']) && isset($_POST['qty'])){
		if ($_POST['idpenjualan'] > 0 && $_POST['idproduk'] > 0 && $_POST['hargajual'] > 0 && $_POST['qty'] > 0){
			$strSQL = 'SELECT iddetail FROM detailpenjualan WHERE idproduct=%d AND idpenjualan=%d LIMIT 1';
			$idDetailExist = db_result(db_query($strSQL, $_POST['idproduk'],$_POST['idpenjualan']));
			if ($idDetailExist > 0){
				$strSQL = 'UPDATE detailpenjualan SET jumlah = jumlah + \'%f\', hargajual=\'%f\', ';
				$strSQL .= 'hargapokok=\'%f\', ';
				$strSQL .= 'diskon=\'%f\' WHERE iddetail=%d';
				$executedSQL[] = $strSQL;
				db_query(
					$strSQL,$_POST['qty'],$_POST['hargajual'],$_POST['hargapokok'],
					$_POST['diskon'],$idDetailExist
				);
			}else{
				$strSQL = 'INSERT INTO detailpenjualan (idpenjualan, idproduct, jumlah, ';
				$strSQL .= 'hargapokok, hargajual, diskon) VALUES ';
				$strSQL .= '(%d, %d, \'%f\', \'%f\', \'%f\', \'%f\')';
				$executedSQL[] = $strSQL;
				db_query(
					$strSQL,$_POST['idpenjualan'],$_POST['idproduk'],$_POST['qty'],
					$_POST['hargapokok'],$_POST['hargajual'],$_POST['diskon']
				);
			}
			$strSQL = 'SELECT SUM(hargajual*jumlah) AS total_order FROM detailpenjualan WHERE idpenjualan=%d';
			$totalOrder = db_result(db_query($strSQL,$_POST['idpenjualan']));
			$strSQL = 'SELECT SUM(hargapokok*jumlah) AS total_modal FROM detailpenjualan WHERE idpenjualan=%d';
			$totalModal = db_result(db_query($strSQL,$_POST['idpenjualan']));
			$strSQL = 'UPDATE penjualan SET total=\'%f\', totalmodal=\'%f\', uploaded=0, changed=1 WHERE idpenjualan=%d';
			db_query($strSQL,$totalOrder,$totalModal,$_POST['idpenjualan']);
			$stokproduct = db_result(db_query('SELECT stok FROM product WHERE idproduct=%d',$_POST['idproduk']));
			$stoksekarang = $stockproduct - $_POST['qty'];
			if (!empty($idproduct)){
				db_query("UPDATE product SET stok = stok - '%f', uploaded=0, changed=1 WHERE idproduct='%d'",$_POST['qty'],$_POST['idproduk']);
				$keterangan = 'Revisi Penjualan - Tambah Detail Penjualan';
				db_query("INSERT INTO transaksistock (idproduk, idpenjualan, stocksebelum, keluar, stocksetelah, keterangan) VALUES
				('%d', '%d', '%f', '%f', '%f', '%s')",$_POST['idproduk'],$_POST['idpenjualan'],
						 $stokproduct,$_POST['qty'],$stoksekarang,$keterangan
				);
			}
			/* Update Hutang Penjualan */
			$caraJual = db_result(db_query('SELECT carabayar FROM penjualan WHERE idpenjualan=%d',$_POST['idpenjualan']));
			$kembali = db_result(db_query('SELECT kembali FROM penjualan WHERE idpenjualan=%d',$_POST['idpenjualan']));
			$idPelanggan = db_result(db_query('SELECT idpelanggan FROM penjualan WHERE idpenjualan=%d',$_POST['idpenjualan']));
			$bayar = db_result(db_query('SELECT bayar FROM penjualan WHERE idpenjualan=%d',$_POST['idpenjualan']));
			if (!empty($idPelanggan) && ($caraJual == 'HUTANG' || $kembali < 0)){
				$besarHutang = $totalOrder + $bayar;
				$sqlUpdatePiutang = 'UPDATE detailpiutang SET besarhutang=\'%f\' ';
				$sqlUpdatePiutang .= 'WHERE idpelanggan=%d AND idpenjualan=%d';
				db_query($sqlUpdatePiutang, $besarHutang, $idPelanggan, $_POST['idpenjualan']);
				syncHutangPelanggan($idPelanggan);
			}
			/* End Update Hutang Penjualan */
			$kembali = $bayar - $totalOrder;
			db_query('UPDATE penjualan SET kembali=\'%f\', uploaded=0, changed=1 WHERE idpenjualan=%d',$kembali,$_POST['idpenjualan']);
		}
		print json_encode($executedSQL);
	}
	exit();
}