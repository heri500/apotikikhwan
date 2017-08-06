<?php

function delete_pembelian($idpembelian){
	if ($idpembelian > 0){
		$no_nota = db_result(db_query("SELECT nonota FROM pembelian WHERE idpembelian=%d",$idpembelian));
		$tglpembelian = db_result(db_query("SELECT tglpembelian FROM pembelian WHERE idpembelian=%d",$idpembelian));
		$detailpembelian_rs = db_query("SELECT idproduct, jumlah FROM detailpembelian WHERE idpembelian=%d",$idpembelian);
		while($detailpembelian_dt = db_fetch_object($detailpembelian_rs)){
			$idproduk = $detailpembelian_dt->idproduct;
			$jumlah = $detailpembelian_dt->jumlah;
			$stoksebelum = db_result(db_query("SELECT stok FROM product WHERE idproduct=%d",$idproduk));
			$stoksesudah = $stoksebelum - $jumlah;
			$keterangan = 'Menghapus pembelian '.$no_nota.' tanggal: '.$tglpembelian;
			db_query("UPDATE product SET stok=stok-%d WHERE idproduct=%d",$jumlah,$idproduk);
			db_query("INSERT INTO transaksistock (idproduk, idpembelian, stocksebelum, keluar, stocksetelah, keterangan) VALUES 
			('%d', '%d', '%f', '%f', '%f', '%s')",$idproduk,$idpembelian,$stoksebelum,$jumlah,$stoksesudah,$keterangan);
		}
		db_query("DELETE FROM detailpembelian WHERE idpembelian='%d'", $idpembelian);
		$nilaihutang = db_result(db_query("SELECT kembali FROM pembelian WHERE idpembelian='%d'",$idpembelian));
		if ($nilaihutang < 0){
			$idsupplier = db_result(db_query("SELECT idsupplier FROM detailhutang WHERE idpembelian=%d", $idpembelian));
			$nilaihutang = abs($nilaihutang);
			$besarhutangterakhir = db_result(db_query("SELECT SUM(besarhutang) FROM hutang WHERE idsupplier=%d GROUP BY idsupplier", $idsupplier));
			$variables['idsupplier'] = $idsupplier;
			$variables['pembayaran'] = $nilaihutang;
			$variables['hutang'] = $besarhutangterakhir;
			$variables['tglbayar'] = date('Y-m-d');
			$variables['keterangan'] = 'Data pembelian nota: '.$no_nota.' tanggal: '.$tglpembelian.' dihapus';
			$variables['simpanpembayaran'] = false;
			$newvariables = do_pembayaran_hutang($variables);
		}
		db_query("DELETE FROM detailhutang WHERE idpembelian='%d'", $idpembelian);
		db_query("DELETE FROM pembelian WHERE idpembelian='%d'", $idpembelian);
	}
	header('Location: '.base_path().$_GET['destination']);
}