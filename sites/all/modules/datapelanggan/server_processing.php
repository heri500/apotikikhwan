<?php

/*
 * DataTables example server-side processing script.
 *
 * Please note that this script is intentionally extremely simply to show how
 * server-side processing can be implemented, and probably shouldn't be used as
 * the basis for a large complex system. It is suitable for simple use cases as
 * for learning.
 *
 * See http://datatables.net/usage/server-side for full details on the server-
 * side processing requirements of DataTables.
 *
 * @license MIT - http://datatables.net/license_mit
 */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Easy set variables
 */
$drupal_root_dir = '../../../../';

# make your drupal directory php's current directory
chdir($drupal_root_dir);

# not shown in the book, i had to set this constant
define('DRUPAL_ROOT', $drupal_root_dir);

# bootstrap drupal up to the point the database is loaded
include_once('./includes/bootstrap.inc');
drupal_bootstrap(DRUPAL_BOOTSTRAP_DATABASE);
$baseDirectory = '';
if (!file_exists('/misc/media/images/forward_enabled.ico')){
	$baseDirectory = '..';
}


function serverSidePelanggan($request){
	global $baseDirectory;
	$pageStart = $_GET['start'];
	$pageLength = $_GET['length'];
	$searchArray = $_REQUEST['search'];
	$searchQuery = $searchArray['value'];
	$arrayColumn = array(
		'','','','plg.kodepelanggan','plg.namapelanggan','plg.telp', 'plg.alamat',
		'plg.email','ptg.besarhutang','ptg.pembayaranterakhir','bayarterakhir'
	);
	$orderColumnArray = $_REQUEST['order'];
	$orderColumn = $arrayColumn[$orderColumnArray[0]['column']].' '.$orderColumnArray[0]['dir'];
	if (is_null($pageStart)){
		$pageStart = 0;
	}
	if (is_null($pageLength)){
		$pageLength = 25;
	}
	$firstRecord = $pageStart;
	$lastRecord = $pageStart + $pageLength;
	$strSQL = "SELECT plg.idpelanggan,plg.kodepelanggan,plg.namapelanggan,plg.telp,plg.alamat,plg.email,";
	$strSQLFilteredTotal = "SELECT COUNT(plg.idpelanggan) ";
	$strSQL .= "ptg.besarhutang, ptg.pembayaranterakhir, SUBSTR(ptg.last_update,1,10) AS bayarterakhir ";
	$strSQL .= "FROM pelanggan AS plg ";
	$strSQLFilteredTotal .= "FROM pelanggan AS plg ";
	$strSQL .= "LEFT JOIN piutang AS ptg ON ptg.idpelanggan = plg.idpelanggan WHERE 1=1 ";
	$strSQLFilteredTotal .= "LEFT JOIN piutang AS ptg ON ptg.idpelanggan = plg.idpelanggan WHERE 1=1 ";
	$strCriteria = "";
	if (!empty($searchQuery)){
		$strCriteria .= "AND (plg.kodepelanggan LIKE '%%%s%%' OR plg.namapelanggan LIKE '%%%s%%' ";
		$strCriteria .= "OR plg.alamat LIKE '%%%s%%' OR plg.email LIKE '%%%s%%')";
	}
	$strSQL .= $strCriteria." ORDER BY $orderColumn LIMIT %d, %d";
	$strSQLFilteredTotal .= $strCriteria;
	if (!empty($searchQuery)){
		$result = db_query($strSQL,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal,$searchQuery,$searchQuery,$searchQuery,$searchQuery));
	}else{
		$result = db_query($strSQL,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal));
	}
	$output = array();
	while ($data = db_fetch_object($result)){
		$rowData = array();
		$lihathutang = "<img title=\"Klik untuk melihat detail hutang\" src=\"$baseDirectory/misc/media/images/forward_enabled.ico\" onclick=\"view_detail_hutang(".$data->idpelanggan.",'".$data->namapelanggan."','".round($data->besarhutang)."');\">";
		$bayarhutang = "<img title=\"Klik untuk mengisi form pembayaran\" src=\"$baseDirectory/misc/media/images/money2_24.png\" onclick=\"pembayaran(".$data->idpelanggan.",'".$data->namapelanggan."','".$data->besarhutang."','".$data->besarhutang."');\">";
		$lihatdiskon = "<img title=\"Klik untuk melihat dan menambah diskon pelanggan\" src=\"$baseDirectory/misc/media/images/diskon.png\" onclick=\"tabeldiskon(".$data->idpelanggan.",'".$data->namapelanggan."')\">";
		$rowData[] = $lihathutang;
		$rowData[] = $bayarhutang;
		$rowData[] = $lihatdiskon;
		$rowData[] = $data->kodepelanggan;
		$rowData[] = $data->namapelanggan;
		$rowData[] = $data->telp;
		$rowData[] = $data->alamat;
		$rowData[] = $data->email;
		$rowData[] = number_format($data->besarhutang,0,",",".");
		$rowData[] = number_format($data->pembayaranterakhir,0,",",".");
		$rowData[] = $data->bayarterakhir;
        $rowData[] = $data->idpelanggan;
		$output[] = $rowData;
	}
	$recordsTotal = db_result(db_query("SELECT COUNT(idpelanggan) FROM pelanggan"));
	return array(
			"draw"            => isset ( $request['draw'] ) ?
				intval( $request['draw'] ) :
				0,
			"recordsTotal"    => intval( $recordsTotal ),
			"recordsFiltered" => intval( $recordsFiltered ),
			"data"            => $output
		);
}
function serverSideProduk($request){
	global $baseDirectory;
	$pageStart = $_GET['start'];
	$pageLength = $_GET['length'];
	$searchArray = $_REQUEST['search'];
	$searchQuery = $searchArray['value'];
	$arrayColumn = array(
		'prod.idproduct','kat.kategori','subkat.subkategori','supp.namasupplier', 'prod.barcode',
		'prod.alt_code','prod.namaproduct','prod.hargapokok','prod.hargajual','prod.margin'
		,'prod.minstok','prod.maxstok','prod.stok','prod.stok','prod.satuan','prod.keterangan','prod.stok*prod.hargajual'
	);
	$orderColumnArray = $_REQUEST['order'];
	$orderColumn = $arrayColumn[$orderColumnArray[0]['column']].' '.$orderColumnArray[0]['dir'];
	if (is_null($pageStart)){
		$pageStart = 0;
	}
	if (is_null($pageLength)){
		$pageLength = 25;
	}
	$firstRecord = $pageStart;
	$lastRecord = $pageStart + $pageLength;
	$strSQL = "SELECT prod.idproduct,prod.idsupplier,prod.idkategori,prod.idsubkategori,prod.barcode,prod.alt_code,";
	$strSQL .= "prod.namaproduct,prod.hargapokok,prod.hargajual,prod.margin,prod.minstok,prod.maxstok,";
	$strSQL .= "prod.stok,prod.satuan,prod.berat,prod.keterangan ,";
	$strSQLFilteredTotal = "SELECT COUNT(prod.idproduct) ";
	$strSQL .= "kat.kategori, subkat.subkategori, supp.namasupplier, prod.stok*prod.hargajual AS total_nilai  ";
	$strSQL .= "FROM product AS prod ";
	$strSQLFilteredTotal .= "FROM product AS prod ";
	$strSQL .= "LEFT JOIN kategori AS kat ON kat.idkategori = prod.idkategori ";
	$strSQL .= "LEFT JOIN subkategori AS subkat ON subkat.idsubkategori = prod.idsubkategori ";
	$strSQL .= "LEFT JOIN supplier AS supp ON supp.idsupplier = prod.idsupplier ";
	$strSQL .= "WHERE 1=1 ";
	$strSQLFilteredTotal .= "LEFT JOIN kategori AS kat ON kat.idkategori = prod.idkategori ";
	$strSQLFilteredTotal .= "LEFT JOIN subkategori AS subkat ON subkat.idsubkategori = prod.idsubkategori ";
	$strSQLFilteredTotal .= "LEFT JOIN supplier AS supp ON supp.idsupplier = prod.idsupplier ";
	$strSQLFilteredTotal .= "WHERE 1=1 ";
	$strCriteria = "";
	if (!empty($searchQuery)){
		$strCriteria .= "AND (prod.alt_code LIKE '%%%s%%' OR prod.barcode LIKE '%%%s%%' ";
		$strCriteria .= "OR prod.namaproduct LIKE '%%%s%%' OR kat.kategori LIKE '%%%s%%' ";
		$strCriteria .= "OR kat.kodekategori LIKE '%%%s%%' OR subkat.subkategori LIKE '%%%s%%' ";
		$strCriteria .= "OR subkat.kodesubkategori LIKE '%%%s%%' OR supp.namasupplier LIKE '%%%s%%' ";
		$strCriteria .= "OR supp.kodesupplier LIKE '%%%s%%' ";
		$strCriteria .= ") ";
	}
	if (isset($_REQUEST['statusstok']) && $_REQUEST['statusstok'] != '0'){
		if ($_REQUEST['statusstok'] == 'aman'){
			$strCriteria .= "AND (stok >= prod.minstok AND stok <= prod.maxstok && prod.minstok != prod.maxstok) ";
		}else if($_REQUEST['statusstok'] == 'maksimum'){
			$strCriteria .= "AND (stok > prod.maxstok) ";
		}else if($_REQUEST['statusstok'] == 'minimum'){
			$strCriteria .= "AND (stok < prod.minstok) ";
		}
	}
	if (isset($_REQUEST['status_product'])){
		$strCriteria .= "AND (status_product = ".$_REQUEST['status_product'].") ";
	}else{
		$strCriteria .= "AND (status_product = 1) ";
	}
	if ($pageLength != '-1'){
		$strSQL .= $strCriteria." ORDER BY $orderColumn LIMIT %d, %d";
	}else{
		$strSQL .= $strCriteria." ORDER BY $orderColumn";
	}
	$strSQLFilteredTotal .= $strCriteria;
	if (!empty($searchQuery)){
		$result = db_query($strSQL,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery));
	}else{
		$result = db_query($strSQL,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal));
	}
	$output = array();
	$totalNilaiBarang = 0;
	while ($data = db_fetch_object($result)){
		$rowData = array();
		$imgEdit = "<img title=\"Edit Produk ".$data->namaproduct."\" src=\"$baseDirectory/misc/media/images/edit.ico\" onclick=\"editproduk(".$data->idproduct.")\">";
		$rowData[] = $imgEdit;
		$rowData[] = $data->kategori;
		$rowData[] = $data->subkategori;
		$rowData[] = $data->namasupplier;
		$rowData[] = $data->barcode;
		$rowData[] = $data->alt_code;
		$rowData[] = $data->namaproduct;
		$rowData[] = number_format($data->hargapokok,0,",",".");
		$rowData[] = number_format($data->hargajual,0,",",".");
		$rowData[] = number_format($data->margin,0,",",".");
		$rowData[] = $data->minstok;
    $rowData[] = $data->maxstok;
    $rowData[] = number_format($data->stok,2,",",".");
    if ($data->stok < $data->minstok){
			$rowData[] = "<img title=\"Stok dibawah minimum\" src=\"$baseDirectory/misc/media/images/statusmerah.png\">";
		}elseif ($data->stok > $data->maxstok){
			$rowData[] = "<img title=\"Stok berlebihan/diatas maksimum stok\" src=\"$baseDirectory/misc/media/images/statuskuning.png\">";
		}elseif ($data->stok <= $data->maxstok AND $data->stok >= $data->minstok AND $data->stok > 0){
			$rowData[] = "<img title=\"Stok aman\" src=\"$baseDirectory/misc/media/images/statushijau.png\">";
		}elseif ($data->stok <= 0){
			$rowData[] = "<img title=\"Stok Kosong\" src=\"$baseDirectory/misc/media/images/statusmerah.png\">";
		}
		$rowData[] = $data->satuan;
		$rowData[] = $data->keterangan;
		$rowData[] = number_format($data->total_nilai,0,",",".");
		$rowData[] = '<input type="text" id="print-'.$data->idproduct.'" name="print-'.$data->idproduct.'" class="total-print" value="'.$data->stok.'" size="2">';
		$rowData[] = '<input class="barcode-select" type="checkbox" id="check-'.$data->idproduct.'" name="check-'.$data->idproduct.'" value="'.$data->idproduct.'">';
		$totalNilaiBarang = $totalNilaiBarang + $data->total_nilai;
		$rowData[] = $data->idproduct;
		$output[] = $rowData;
	}
	$recordsTotal = db_result(db_query("SELECT COUNT(idproduct) FROM product"));
	return array(
			"draw"            => isset ( $request['draw'] ) ?
				intval( $request['draw'] ) :
				0,
			"recordsTotal"    => intval( $recordsTotal ),
			"recordsFiltered" => intval( $recordsFiltered ),
			"data"            => $output,
			"sql" 			  => $strSQL,
		);
}

function serverSidePenjualan($request){
	global $baseDirectory;
	$pageStart = $_GET['start'];
	$pageLength = $_GET['length'];
	$searchArray = $_REQUEST['search'];
	$tglAwal = $_REQUEST['tglawal'].' 00:00';
	$tglAkhir = $_REQUEST['tglakhir'].' 23:59';
	$idpelanggan = $_REQUEST['idpelanggan'];
	$searchQuery = $searchArray['value'];
	$arrayColumn = array(
		'penj.idpenjualan','penj.nonota','penj.tglpenjualan','penj.tglpenjualan',
		'penj.total','penj.totalmodal','(penj.total - penj.totalmodal)','penj.carabayar',
		'penj.bayar','penj.kembali','user.name','plg.namapelanggan'
	);
	$orderColumnArray = $_REQUEST['order'];
	$orderColumn = $arrayColumn[$orderColumnArray[0]['column']].' '.$orderColumnArray[0]['dir'];
	if (is_null($pageStart)){
		$pageStart = 0;
	}
	if (is_null($pageLength)){
		$pageLength = 100;
	}
	$firstRecord = $pageStart;
	$lastRecord = $pageStart + $pageLength;
	$strSQL = "SELECT penj.idpenjualan,penj.nonota,SUBSTR(penj.tglpenjualan,1,10) AS tanggal,";
	$strSQL .= "SUBSTR(penj.tglpenjualan,11,9) AS waktu, penj.idpemakai,penj.total,penj.totalmodal,";
	$strSQL .= "(penj.total-penj.totalmodal) AS laba, penj.carabayar,penj.bayar,penj.kembali,";
	$strSQL .= "penj.nokartu,penj.keterangan,penj.insert_date, user.name, plg.namapelanggan ";
	$strSQLFilteredTotal = "SELECT COUNT(penj.idpenjualan) ";
	$strSQL .= "FROM penjualan AS penj ";
	$strSQLFilteredTotal .= "FROM penjualan AS penj ";
	$strSQL .= "LEFT JOIN cms_users AS user ON user.uid = penj.idpemakai ";
	$strSQL .= "LEFT JOIN pelanggan AS plg ON plg.idpelanggan = penj.idpelanggan ";
	if (empty($idpelanggan)){
		$strSQL .= "WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' ";
	}else{
		$strSQL .= "WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' AND penj.idpelanggan=%d ";
	}
	$strSQLFilteredTotal .= "LEFT JOIN cms_users AS user ON user.uid = penj.idpemakai ";
	$strSQLFilteredTotal .= "LEFT JOIN pelanggan AS plg ON plg.idpelanggan = penj.idpelanggan ";
	if (empty($idpelanggan)){
		$strSQLFilteredTotal .= "WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' ";
	}else{
		$strSQLFilteredTotal .= "WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' AND penj.idpelanggan=%d ";
	}
	$strCriteria = "";
	if (!empty($searchQuery)){
		$strCriteria .= "AND (penj.nonota LIKE '%%%s%%' OR SUBSTR(penj.tglpenjualan,1,10) LIKE '%%%s%%' ";
		$strCriteria .= "OR SUBSTR(penj.tglpenjualan,11,9) LIKE '%%%s%%' OR user.name LIKE '%%%s%%' ";
		$strCriteria .= "OR plg.namapelanggan LIKE '%%%s%%' OR penj.carabayar LIKE '%%%s%%' ";
		$strCriteria .= ")";
	}
	if ($pageLength == -1){
		$strSQL .= $strCriteria." ORDER BY $orderColumn";
	}else{
		$strSQL .= $strCriteria." ORDER BY $orderColumn LIMIT %d, %d";
	}
	$strSQLFilteredTotal .= $strCriteria;
	if (!empty($searchQuery)){
		if (empty($idpelanggan)) {
			if ($pageLength == -1) {
				$result = db_query(
					$strSQL,
					$tglAwal,
					$tglAkhir,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery
				);
				$recordsFiltered = db_result(
					db_query(
						$strSQLFilteredTotal,
						$tglAwal,
						$tglAkhir,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery
					)
				);
			}else{
				if ($pageLength == -1) {
					$result = db_query(
						$strSQL,
						$tglAwal,
						$tglAkhir,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery
					);
				}else{
					$result = db_query(
						$strSQL,
						$tglAwal,
						$tglAkhir,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$firstRecord,
						$lastRecord
					);
				}
				$recordsFiltered = db_result(
					db_query(
						$strSQLFilteredTotal,
						$tglAwal,
						$tglAkhir,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery,
						$searchQuery
					)
				);
			}
		}else{
			if ($pageLength == -1) {
				$result = db_query(
					$strSQL,
					$tglAwal,
					$tglAkhir,
					$idpelanggan,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery
				);
			}else{
				$result = db_query(
					$strSQL,
					$tglAwal,
					$tglAkhir,
					$idpelanggan,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$firstRecord,
					$lastRecord
				);
			}
			$recordsFiltered = db_result(
				db_query(
					$strSQLFilteredTotal,
					$tglAwal,
					$tglAkhir,
					$idpelanggan,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery,
					$searchQuery
				)
			);
		}
	}else{
		if (empty($idpelanggan)) {
			$result = db_query($strSQL, $tglAwal, $tglAkhir, $firstRecord, $lastRecord);
			$recordsFiltered = db_result(db_query($strSQLFilteredTotal, $tglAwal, $tglAkhir));
		}else{
			$result = db_query($strSQL, $tglAwal, $tglAkhir, $idpelanggan, $firstRecord, $lastRecord);
			$recordsFiltered = db_result(db_query($strSQLFilteredTotal, $tglAwal, $tglAkhir, $idpelanggan));
		}
	}
	$output = array();
	while ($data = db_fetch_object($result)){
		$rowData = array();
		$imgDetail = "<img title=\"Klik untuk melihat detail penjualan\" onclick=\"view_detail(".$data->idpenjualan.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/forward_enabled.ico\">";
		$rowData[] = $imgDetail;
		$rowData[] = $data->nonota;
		$rowData[] = $data->tanggal;
		$rowData[] = $data->waktu;
		$rowData[] = number_format($data->total,0,",",".");
		$rowData[] = number_format($data->totalmodal,0,",",".");
		$rowData[] = number_format($data->laba,0,",",".");
		$rowData[] = $data->carabayar;
		$rowData[] = number_format($data->bayar,0,",",".");
		$rowData[] = number_format($data->kembali,0,",",".");
		$rowData[] = $data->name;
		$rowData[] = $data->namapelanggan;
		$tombolprint = "<img title=\"Klik untuk mencetak nota penjualan\" onclick=\"print_penjualan(".$data->idpenjualan.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/print.png\" width=\"22\">";
		$rowData[] = $tombolprint;
		$tombolprint2 = "<img title=\"Klik untuk mencetak faktur penjualan\" onclick=\"print_faktur(".$data->idpenjualan.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/printer2.png\" width=\"22\">";
		$rowData[] = $tombolprint2;
		$rowData[] = $data->idpenjualan;
		$output[] = $rowData;
	}
	if (empty($idpelanggan)) {
		$recordsTotal = db_result(
			db_query(
				"SELECT COUNT(idpenjualan) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND '%s'",
				$tglAwal,
				$tglAkhir
			)
		);
	}else{
		$recordsTotal = db_result(
			db_query(
				"SELECT COUNT(idpenjualan) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND '%s' AND idpelanggan=%d",
				$tglAwal,
				$tglAkhir,
				$idpelanggan
			)
		);
	}
	return array(
			"draw"            => isset ( $request['draw'] ) ?
				intval( $request['draw'] ) :
				0,
			"recordsTotal"    => intval( $recordsTotal ),
			"recordsFiltered" => intval( $recordsFiltered ),
			"data"            => $output,
			"sql"			  => $strSQL,
			"tglawal"		  => $tglAwal,
			"tglakhir"		  => $tglAkhir,
		);
}

function serverSidePenjualan2($request){
	$pageStart = $_GET['start'];
	$pageLength = $_GET['length'];
	$searchArray = $_REQUEST['search'];
	$tglAwal = $_REQUEST['tglawal'].' 00:00';
	$tglAkhir = $_REQUEST['tglakhir'].' 23:59';
	$idSupplier = $_REQUEST['idsupplier'];
	$searchQuery = $searchArray['value'];
	$arrayColumn = array(
		'prod.barcode','prod.namaproduct','supp.namasupplier', 
		'totalqty','minhargapokok','maxhargapokok','minhargajual','maxhargajual',
		'subtotal','totalmodal','laba'
	);
	$orderColumnArray = $_REQUEST['order'];
	$orderColumn = $arrayColumn[$orderColumnArray[0]['column']].' '.$orderColumnArray[0]['dir'];
	if (is_null($pageStart)){
		$pageStart = 0;
	}
	if (is_null($pageLength)){
		$pageLength = 100;
	}
	$firstRecord = $pageStart;
	$lastRecord = $pageStart + $pageLength;
	$strSQL = "SELECT detail.idproduct,prod.barcode,prod.namaproduct,";
	$strSQL .= "supp.namasupplier, SUM(detail.jumlah) AS totalqty,";
	$strSQL .= "MIN(detail.hargapokok) AS minhargapokok,MAX(detail.hargapokok) AS maxhargapokok,";
	$strSQL .= "MIN(detail.hargajual) AS minhargajual, MAX(detail.hargajual) AS maxhargajual, ";
	$strSQL .= "SUM(detail.hargapokok*detail.jumlah) AS totalmodal, SUM(detail.hargajual*detail.jumlah) AS subtotal,";
	$strSQL .= "SUM((detail.hargajual-detail.hargapokok)*detail.jumlah) AS laba ";
	$strSQLFilteredTotal = "SELECT COUNT(detail.idproduct) ";
	$strSQL .= "FROM detailpenjualan AS detail ";
	$strSQLFilteredTotal .= "FROM detailpenjualan AS detail ";
	$strSQL .= "LEFT JOIN penjualan AS penj ON detail.idpenjualan = penj.idpenjualan ";
	$strSQL .= "LEFT JOIN product AS prod ON detail.idproduct = prod.idproduct ";
	$strSQL .= "LEFT JOIN supplier AS supp ON prod.idsupplier = supp.idsupplier ";
	if (!empty($idSupplier)){
		$strSQL .= "WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' AND prod.idsupplier = %d ";
	}else{
		$strSQL .= "WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' ";
	}
	$strSQLFilteredTotal .= "LEFT JOIN penjualan AS penj ON detail.idpenjualan = penj.idpenjualan ";
	$strSQLFilteredTotal .= "LEFT JOIN product AS prod ON detail.idproduct = prod.idproduct ";
	$strSQLFilteredTotal .= "LEFT JOIN supplier AS supp ON prod.idsupplier = supp.idsupplier ";
	if (!empty($idSupplier)){
		$strSQLFilteredTotal .= "WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' AND prod.idsupplier = %d ";
	}else {
		$strSQLFilteredTotal .= "WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' ";
	}
	$strCriteria = "";
	if (!empty($searchQuery)){
		$strCriteria .= "AND (prod.barcode LIKE '%%%s%%' OR prod.namaproduct LIKE '%%%s%%' ";
		$strCriteria .= "OR supp.namasupplier LIKE '%%%s%%' ";
		$strCriteria .= ")";
	}
	$strSQL .= $strCriteria." GROUP BY detail.idproduct ORDER BY $orderColumn LIMIT %d, %d";
	$strSQLFilteredTotal .= $strCriteria." GROUP BY detail.idproduct";
	if (!empty($searchQuery)){
		if (!empty($idSupplier)){
			$result = db_query(
				$strSQL,
				$tglAwal,
				$tglAkhir,
				$idSupplier,
				$searchQuery,
				$searchQuery,
				$searchQuery,
				$firstRecord,
				$lastRecord
			);
			$recordsFiltered = db_result(
				db_query($strSQLFilteredTotal, $tglAwal, $tglAkhir, $idSupplier, $searchQuery, $searchQuery, $searchQuery)
			);
		}else {
			$result = db_query(
				$strSQL,
				$tglAwal,
				$tglAkhir,
				$searchQuery,
				$searchQuery,
				$searchQuery,
				$firstRecord,
				$lastRecord
			);
			$recordsFiltered = db_result(
				db_query($strSQLFilteredTotal, $tglAwal, $tglAkhir, $searchQuery, $searchQuery, $searchQuery)
			);
		}
	}else{
		if (!empty($idSupplier)) {
			$result = db_query($strSQL, $tglAwal, $tglAkhir, $idSupplier, $firstRecord, $lastRecord);
			$recordsFiltered = db_result(db_query($strSQLFilteredTotal, $tglAwal, $tglAkhir, $idSupplier));
		}else{
			$result = db_query($strSQL, $tglAwal, $tglAkhir, $firstRecord, $lastRecord);
			$recordsFiltered = db_result(db_query($strSQLFilteredTotal, $tglAwal, $tglAkhir));
		}
	}
	$output = array();
	while ($data = db_fetch_object($result)){
		$rowData = array();
		$rowData[] = $data->barcode;
		$rowData[] = $data->namaproduct;
		$rowData[] = $data->namasupplier;
		$rowData[] = number_format($data->totalqty,0,",",".");
		$rowData[] = number_format($data->minhargapokok,0,",",".");
		$rowData[] = number_format($data->maxhargapokok,0,",",".");
		$rowData[] = number_format($data->minhargajual,0,",",".");
		$rowData[] = number_format($data->maxhargajual,0,",",".");
		$rowData[] = number_format($data->subtotal,0,",",".");
		$rowData[] = number_format($data->totalmodal,0,",",".");
		$rowData[] = number_format($data->laba,0,",",".");
		$rowData[] = $data->idproduct;
		$output[] = $rowData;
	}
	$recordsTotal = db_result(db_query("SELECT COUNT(idproduct) FROM detailpenjualan AS detail LEFT JOIN penjualan AS penj ON detail.idpenjualan=penj.idpenjualan WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' GROUP BY detail.idproduct",$tglAwal,$tglAkhir));
	return array(
			"draw"            => isset ( $request['draw'] ) ?
				intval( $request['draw'] ) :
				0,
			"recordsTotal"    => intval( $recordsTotal ),
			"recordsFiltered" => intval( $recordsFiltered ),
			"data"            => $output
		);
}

function serverSideLaundry($request){
	$pageStart = $_GET['start'];
	$pageLength = $_GET['length'];
	$searchArray = $_REQUEST['search'];
	$tglAwal = $_REQUEST['tglawal'].' 00:00';
	$tglAkhir = $_REQUEST['tglakhir'].' 23:59';
	$searchQuery = $searchArray['value'];
	$arrayColumn = array(
		'laundry.nonota','tanggal','totallaundry','laundry.carabayar','laundry.bayar',
		'plg.namapelanggan','laundry.status_laundry','perkiraan_ambil','laundry.keterangan'
	);
	$orderColumnArray = $_REQUEST['order'];
	$orderColumn = $arrayColumn[$orderColumnArray[0]['column']].' '.$orderColumnArray[0]['dir'];
	if (is_null($pageStart)){
		$pageStart = 0;
	}
	if (is_null($pageLength)){
		$pageLength = 100;
	}
	$firstRecord = $pageStart;
	$lastRecord = $pageStart + $pageLength;
	$strSQL = "SELECT laundry.idtitipanlaundry,laundry.nonota,SUBSTR(laundry.tglpenjualan,1,10) AS tanggal,";
	$strSQL .= "SUBSTR(laundry.tglpenjualan,11,9) AS waktu, laundry.idpemakai,";
	$strSQL .= "(SELECT SUM(hargajual*jumlah) FROM detaillaundry WHERE ";
	$strSQL .= "idtitipanlaundry = laundry.idtitipanlaundry) AS totallaundry,";
	$strSQL .= "(SELECT MAX(perkiraan_ambil) FROM detaillaundry WHERE ";
	$strSQL .= "idtitipanlaundry = laundry.idtitipanlaundry) AS perkiraan_ambil,";
	$strSQL .= "laundry.carabayar, laundry.bayar, laundry.status_laundry, ";
	$strSQL .= "plg.namapelanggan, laundry.keterangan, user.name ";
	$strSQL .= "FROM titipanlaundry AS laundry ";
	$strSQL .= "LEFT JOIN cms_users AS user ON user.uid = laundry.idpemakai ";
	$strSQL .= "LEFT JOIN pelanggan AS plg ON plg.idpelanggan = laundry.idpelanggan ";
	$strSQL .= "WHERE laundry.tglpenjualan BETWEEN '%s' AND '%s' ";
	$strSQLFilteredTotal = "SELECT COUNT(laundry.idtitipanlaundry) ";
	$strSQLFilteredTotal .= "FROM titipanlaundry AS laundry ";
	$strSQLFilteredTotal .= "LEFT JOIN cms_users AS user ON user.uid = laundry.idpemakai ";
	$strSQLFilteredTotal .= "LEFT JOIN pelanggan AS plg ON plg.idpelanggan = laundry.idpelanggan ";
	$strSQLFilteredTotal .= "WHERE laundry.tglpenjualan BETWEEN '%s' AND '%s' ";
	$strCriteria = "";
	if (!empty($searchQuery)){
		$strCriteria .= "AND (laundry.nonota LIKE '%%%s%%' OR SUBSTR(laundry.tglpenjualan,1,10) LIKE '%%%s%%' ";
		$strCriteria .= "OR SUBSTR(laundry.tglpenjualan,11,9) LIKE '%%%s%%' OR user.name LIKE '%%%s%%' ";
		$strCriteria .= "OR plg.namapelanggan LIKE '%%%s%%' OR laundry.carabayar LIKE '%%%s%%' ";
		$strCriteria .= ")";
	}
	$strSQL .= $strCriteria." ORDER BY $orderColumn LIMIT %d, %d";
	$strSQLFilteredTotal .= $strCriteria;
	if (!empty($searchQuery)){
		$result = db_query($strSQL,$tglAwal,$tglAkhir,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal,$tglAwal,$tglAkhir,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery));
	}else{
		$result = db_query($strSQL,$tglAwal,$tglAkhir,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal,$tglAwal,$tglAkhir));
	}
    $arrayhari = arrayHariSS();
	$output = array();
	while ($data = db_fetch_object($result)){
		$rowData = array();
		$tomboldetail = "<img title=\"Klik untuk melihat detail laundry\" onclick=\"view_detail(".$data->idtitipanlaundry.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/forward_enabled.ico\" width=\"22\">";
		$tombolambil = "<img title=\"Klik untuk mengisi form pengambilan laundry\" onclick=\"pickup_laundry(".$data->idtitipanlaundry.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/update.ico\" width=\"22\">";
		$tombolhapus = "<img title=\"Klik untuk menghapus laundry\" onclick=\"delete_laundry(".$data->idtitipanlaundry.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/del.ico\" width=\"22\">";
		$tombolprint = "<img title=\"Klik untuk mencetak titipan laundry\" onclick=\"print_laundry(".$data->idtitipanlaundry.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/print.png\" width=\"22\">";
		$tombolselesai = "<img title=\"Laundry sudah diambil\" src=\"$baseDirectory/misc/media/images/checks.png\" width=\"22\">";
		$rowData[] = $tomboldetail;
		if ($data->status_laundry == 0 || $data->status_laundry == 1){
			$rowData[] = $tombolambil;
		}else{
			$rowData[] = $tombolselesai;
		}
		$rowData[] = $tombolprint;
		$rowData[] = $tombolhapus;
		$rowData[] = $data->nonota;
        $indexhari = date('w', strtotime($data->tanggal));
        $rowData[] = $arrayhari[$indexhari];
		$rowData[] = date('d-m-Y', strtotime($data->tanggal));
		$rowData[] = $data->waktu;
		$rowData[] = number_format($data->totallaundry,0,",",".");
        $rowData[] = $data->carabayar;
        $rowData[] = number_format($data->bayar,0,",",".");
        $sisaPembayaran = $data->totallaundry - $data->bayar;
        $rowData[] = number_format($sisaPembayaran,0,",",".");
        $rowData[] = $data->name;
        $rowData[] = $data->namapelanggan;
        if ($data->status_laundry == 0){
            $rowData[] = 'BELUM DIAMBIL';
        }else if ($data->status_laundry == 1){
            $rowData[] = 'DIAMBIL SEBAGIAN';
        }else if ($data->status_laundry == 2){
            $rowData[] = 'SUDAH DIAMBIL';
        }
        $rowData[] = date('d-m-Y H:i', $data->perkiraan_ambil);
        $rowData[] = $data->keterangan;
        $rowData[] = $data->idtitipanlaundry;
		$output[] = $rowData;
	}
	$recordsTotal = db_result(db_query("SELECT COUNT(idtitipanlaundry) FROM titipanlaundry WHERE tglpenjualan BETWEEN '%s' AND '%s'",$tglAwal,$tglAkhir));
	return array(
			"draw"            => isset ( $request['draw'] ) ?
				intval( $request['draw'] ) :
				0,
			"recordsTotal"    => intval( $recordsTotal ),
			"recordsFiltered" => intval( $recordsFiltered ),
			"data"            => $output,
            "order"           => $orderColumn
		);
}
function serverSideCustomerOrder($request){
	global $baseDirectory;
	$pageStart = $_GET['start'];
	$pageLength = $_GET['length'];
	$searchArray = $_REQUEST['search'];
	$tglAwal = $_REQUEST['tglawal'].' 00:00';
	$tglAkhir = $_REQUEST['tglakhir'].' 23:59';
	$searchQuery = $searchArray['value'];
	$arrayColumn = array(
		5 => 'customerorder.nonota',
		7 => 'tanggal',
		9 => 'total',
		10 => 'customerorder.carabayar',
		11 => 'customerorder.bayar',
		14 => 'plg.namapelanggan',
		15 => 'customerorder.status_order',
		16 => 'perkiraan_ambil',
		17 => 'customerorder.keterangan',
	);
	$orderColumnArray = $_REQUEST['order'];
	$orderColumn = $arrayColumn[$orderColumnArray[0]['column']].' '.$orderColumnArray[0]['dir'];
	if (is_null($pageStart)){
		$pageStart = 0;
	}
	if (is_null($pageLength)){
		$pageLength = 100;
	}
	$firstRecord = $pageStart;
	$lastRecord = $pageStart + $pageLength;
	$strSQL = "SELECT customerorder.id,customerorder.nonota,SUBSTR(customerorder.tglorder,1,10) AS tanggal,";
	$strSQL .= "SUBSTR(customerorder.tglorder,11,9) AS waktu, customerorder.idpemakai,";
	$strSQL .= "customerorder.total,";
	$strSQL .= "(SELECT MAX(perkiraan_ambil) FROM detailcustomerorder WHERE ";
	$strSQL .= "idcustomerorder = customerorder.id) AS perkiraan_ambil,";
	$strSQL .= "customerorder.carabayar, customerorder.bayar, customerorder.status_order, ";
	$strSQL .= "plg.namapelanggan, customerorder.keterangan, user.name ";
	$strSQL .= "FROM customer_order AS customerorder ";
	$strSQL .= "LEFT JOIN cms_users AS user ON user.uid = customerorder.idpemakai ";
	$strSQL .= "LEFT JOIN pelanggan AS plg ON plg.idpelanggan = customerorder.idpelanggan ";
	$strSQL .= "WHERE customerorder.tglorder BETWEEN '%s' AND '%s' ";
	$strSQLFilteredTotal = "SELECT COUNT(customerorder.id) ";
	$strSQLFilteredTotal .= "FROM customer_order AS customerorder ";
	$strSQLFilteredTotal .= "LEFT JOIN cms_users AS user ON user.uid = customerorder.idpemakai ";
	$strSQLFilteredTotal .= "LEFT JOIN pelanggan AS plg ON plg.idpelanggan = customerorder.idpelanggan ";
	$strSQLFilteredTotal .= "WHERE customerorder.tglorder BETWEEN '%s' AND '%s' ";
	$strCriteria = "";
	if (!empty($searchQuery)){
		$strCriteria .= "AND (customerorder.nonota LIKE '%%%s%%' OR SUBSTR(customerorder.tglorder,1,10) LIKE '%%%s%%' ";
		$strCriteria .= "OR SUBSTR(customerorder.tglorder,11,9) LIKE '%%%s%%' OR user.name LIKE '%%%s%%' ";
		$strCriteria .= "OR plg.namapelanggan LIKE '%%%s%%' OR customerorder.carabayar LIKE '%%%s%%' ";
		$strCriteria .= ")";
	}
	$strSQL .= $strCriteria." ORDER BY $orderColumn LIMIT %d, %d";
	$strSQLFilteredTotal .= $strCriteria;
	if (!empty($searchQuery)){
		$result = db_query($strSQL,$tglAwal,$tglAkhir,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal,$tglAwal,$tglAkhir,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery));
	}else{
		$result = db_query($strSQL,$tglAwal,$tglAkhir,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal,$tglAwal,$tglAkhir));
	}
	$arrayhari = arrayHariSS();
	$output = array();
	while ($data = db_fetch_object($result)){
		$rowData = array();
		$tomboldetail = "<img title=\"Klik untuk melihat detail customer order\" onclick=\"view_detail(".$data->id.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/forward_enabled.ico\" width=\"22\">";
		$tombolambil = "<img title=\"Klik untuk mengisi form pengambilan customer order\" onclick=\"pickup_customerorder(".$data->id.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/update.ico\" width=\"22\">";
		$tombolhapus = "<img title=\"Klik untuk menghapus customer order\" onclick=\"delete_customerorder(".$data->id.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/del.ico\" width=\"22\">";
		$tombolprint = "<img title=\"Klik untuk mencetak customer order\" onclick=\"print_customerorder(".$data->id.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/print.png\" width=\"22\">";
		$tombolselesai = "<img title=\"Customer order sudah diambil\" src=\"$baseDirectory/misc/media/images/checks.png\" width=\"22\">";
		$tombolprintproduksi = "<img title=\"Klik untuk mencetak keperluan produksi\" onclick=\"print_production(".$data->id.",'".$data->nonota."');\" src=\"$baseDirectory/misc/media/images/print-production.png\" width=\"22\">";
		$rowData[] = $tomboldetail;
		if ($data->status_order == 0 || $data->status_order == 1){
			$rowData[] = $tombolambil;
		}else{
			$rowData[] = $tombolselesai;
		}
		$rowData[] = $tombolprint;
		$rowData[] = $tombolhapus;
		$rowData[] = '<div id="'.$data->nonota.'" class="barcode-place"></div>';
		$rowData[] = $data->nonota;
		$indexhari = date('w', strtotime($data->tanggal));
		$rowData[] = $arrayhari[$indexhari];
		$rowData[] = date('d-m-Y', strtotime($data->tanggal));
		$rowData[] = $data->waktu;
		$rowData[] = number_format($data->total,0,",",".");
		$rowData[] = $data->carabayar;
		$rowData[] = number_format($data->bayar,0,",",".");
		$sisaPembayaran = $data->total - $data->bayar;
		$rowData[] = number_format($sisaPembayaran,0,",",".");
		$rowData[] = $data->name;
		$rowData[] = $data->namapelanggan;
		if ($data->status_order == 0){
			$rowData[] = 'BELUM DIAMBIL';
		}else if ($data->status_order == 1){
			$rowData[] = 'DIAMBIL SEBAGIAN';
		}else if ($data->status_order == 2){
			$rowData[] = 'SUDAH DIAMBIL';
		}
		$rowData[] = date('d-m-Y H:i', $data->perkiraan_ambil);
		$rowData[] = $data->keterangan;
		$rowData[] = $tombolprintproduksi;
		$rowData[] = $data->id;
		$output[] = $rowData;
	}
	$recordsTotal = db_result(db_query("SELECT COUNT(id) FROM customer_order WHERE tglorder BETWEEN '%s' AND '%s'",$tglAwal,$tglAkhir));
	return array(
		"draw"            => isset ( $request['draw'] ) ?
			intval( $request['draw'] ) :
			0,
		"recordsTotal"    => intval( $recordsTotal ),
		"recordsFiltered" => intval( $recordsFiltered ),
		"data"            => $output,
		"order"           => $orderColumn,
	);
}
function arrayHariSS(){
    $hari_array = array('Minggu','Senin','Selasa','Rabu','Kamis','Jumat','Sabtu');
    return $hari_array;
}
function kategoriPengeluaran($request){
	global $baseDirectory;
	$pageStart = $_GET['start'];
	$pageLength = $_GET['length'];
	$searchArray = $_REQUEST['search'];
	$searchQuery = $searchArray['value'];
	$arrayColumn = array(
		'id','kategori','jeniskategori','keterangan'
	);
	$orderColumnArray = $_REQUEST['order'];
	$orderColumn = $arrayColumn[$orderColumnArray[0]['column']].' '.$orderColumnArray[0]['dir'];
	if (is_null($pageStart)){
		$pageStart = 0;
	}
	if (is_null($pageLength)){
		$pageLength = 25;
	}
	$firstRecord = $pageStart;
	$lastRecord = $pageStart + $pageLength;
	$strSQL = "SELECT id, kategori, jeniskategori, keterangan, created, changed, uid ";
	$strSQLFilteredTotal = "SELECT COUNT(id) ";
	$strSQL .= "FROM cms_kategoripengeluaran ";
	$strSQLFilteredTotal .= "FROM cms_kategoripengeluaran ";
	$strSQL .= "WHERE 1=1 ";
	$strSQLFilteredTotal .= "WHERE 1=1 ";
	$strCriteria = "";
	if (!empty($searchQuery)){
		$strCriteria .= "AND (kategori LIKE '%%%s%%' OR keterangan LIKE '%%%s%%' )";
	}
	$strSQL .= $strCriteria." ORDER BY $orderColumn LIMIT %d, %d";
	$strSQLFilteredTotal .= $strCriteria;
	if (!empty($searchQuery)){
		$result = db_query($strSQL,$searchQuery,$searchQuery,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal,$searchQuery,$searchQuery));
	}else{
		$result = db_query($strSQL,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal));
	}
	$output = array();
	$jenisKategori = array('Pengeluaran', 'Pemasukan');
	while ($data = db_fetch_object($result)){
		$rowData = array();
		$editbutton = '<img title="Klik untuk mengubah kategori pengeluaran" onclick="edit_kategori('.$data->id.', this.parentNode.parentNode);" src="'.$baseDirectory.'/misc/media/images/edit.ico" width="22">';
		$rowData[] = $editbutton;
		$rowData[] = $data->kategori;
		$rowData[] = $jenisKategori[$data->jeniskategori];
		$rowData[] = $data->keterangan;
		$rowData[] = $data->jeniskategori;
		$rowData[] = $data->id;
		$output[] = $rowData;
	}
	$recordsTotal = db_result(db_query("SELECT COUNT(id) FROM cms_kategoripengeluaran"));
	return array(
		"draw"            => isset ( $request['draw'] ) ?
			intval( $request['draw'] ) :
			0,
		"recordsTotal"    => intval( $recordsTotal ),
		"recordsFiltered" => intval( $recordsFiltered ),
		"data"            => $output
	);
}
function pengeluaran($request){
	global $baseDirectory;
	$pageStart = $_GET['start'];
	$pageLength = $_GET['length'];
	$searchArray = $_REQUEST['search'];
	$searchQuery = $searchArray['value'];
	$arrayColumn = array(
		3 => 'pengeluaran.tglpengeluaran',
		4 => 'pengeluaran.kategori',
		5 => 'pengeluaran.keterangan',
		6 => 'pengeluaran.nilai'
	);
	$orderColumnArray = $_REQUEST['order'];
	$orderColumn = $arrayColumn[$orderColumnArray[0]['column']].' '.$orderColumnArray[0]['dir'];
	if (is_null($pageStart)){
		$pageStart = 0;
	}
	if (is_null($pageLength)){
		$pageLength = 25;
	}
	$firstRecord = $pageStart;
	$lastRecord = $pageStart + $pageLength;
	$strSQL = "SELECT pengeluaran.id, pengeluaran.keterangan, pengeluaran.kategori, ";
	$strSQL .= "pengeluaran.nilai, pengeluaran.tglpengeluaran, pengeluaran.created, ";
	$strSQL .= "pengeluaran.changed, pengeluaran.uid, ";
	$strSQL .= "katpengeluaran.kategori AS kategori_title ";
	$strSQLFilteredTotal = "SELECT COUNT(pengeluaran.id) ";
	$strSQL .= "FROM cms_pengeluaran AS pengeluaran ";
	$strSQL .= "LEFT JOIN cms_kategoripengeluaran AS katpengeluaran ";
	$strSQL .= "ON pengeluaran.kategori=katpengeluaran.id ";
	$strSQLFilteredTotal .= "FROM cms_pengeluaran AS pengeluaran ";
	$strSQLFilteredTotal .= "LEFT JOIN cms_kategoripengeluaran AS katpengeluaran ";
	$strSQLFilteredTotal .= "ON pengeluaran.kategori=katpengeluaran.id ";
	$strSQLFilteredTotal .= "WHERE 1=1 ";
	$strCriteria = "";
	if (!empty($searchQuery)){
		$strCriteria .= "AND (katpengeluaran.kategori LIKE '%%%s%%' OR ";
		$strCriteria .= "katpengeluaran.keterangan LIKE '%%%s%%' OR ";
		$strCriteria .= "pengeluaran.keterangan LIKE '%%%s%%' OR ";
		$strCriteria .= "SUBSTR(pengeluaran.tglpengeluaran,1,10) LIKE '%%%s%%'  OR ";
		$strCriteria .= "pengeluaran.nilai LIKE '%%%s%%'";
		$strCriteria .= ")";
	}
	$strSQL .= $strCriteria." ORDER BY $orderColumn LIMIT %d, %d";
	$strSQLFilteredTotal .= $strCriteria;
	if (!empty($searchQuery)){
		$result = db_query($strSQL,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery));
	}else{
		$result = db_query($strSQL,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal));
	}
	$output = array();
	$arrayhari = arrayHariSS();
	while ($data = db_fetch_object($result)){
		$rowData = array();
		$editbutton = '<img title="Klik untuk mengubah pengeluaran" onclick="edit_pengeluaran('.$data->id.', this.parentNode.parentNode);" src="'.$baseDirectory.'/misc/media/images/edit.ico" width="22">';
		$deletebutton = '<img title="Klik untuk menghapus pengeluaran" onclick="hapus_pengeluaran('.$data->id.');" src="'.$baseDirectory.'/misc/media/images/del.ico" width="22">';
		$rowData[] = $editbutton;
		$rowData[] = $deletebutton;
		$index_hari = date('w', $data->tglpengeluaran);
		$tglpengeluaran = date('Y-m-d', $data->tglpengeluaran);
		$rowData[] = $arrayhari[$index_hari];
		$rowData[] = $tglpengeluaran;
		$rowData[] = $data->kategori_title;
		$rowData[] = $data->keterangan;
		$rowData[] = number_format($data->nilai,0,',','.');
		$rowData[] = $data->kategori;
		$output[] = $rowData;
	}
	$recordsTotal = db_result(db_query("SELECT COUNT(id) FROM cms_pengeluaran"));
	return array(
		"draw"            => isset ( $request['draw'] ) ?
			intval( $request['draw'] ) :
			0,
		"recordsTotal"    => intval( $recordsTotal ),
		"recordsFiltered" => intval( $recordsFiltered ),
		"data"            => $output
	);
}
function pemasukan($request){
	global $baseDirectory;
	$pageStart = $_GET['start'];
	$pageLength = $_GET['length'];
	$searchArray = $_REQUEST['search'];
	$searchQuery = $searchArray['value'];
	$arrayColumn = array(
		3 => 'pemasukan.tglpemasukan',
		4 => 'pemasukan.kategori',
		5 => 'pemasukan.keterangan',
		6 => 'pemasukan.nilai'
	);
	$orderColumnArray = $_REQUEST['order'];
	$orderColumn = $arrayColumn[$orderColumnArray[0]['column']].' '.$orderColumnArray[0]['dir'];
	if (is_null($pageStart)){
		$pageStart = 0;
	}
	if (is_null($pageLength)){
		$pageLength = 25;
	}
	$firstRecord = $pageStart;
	$lastRecord = $pageStart + $pageLength;
	$strSQL = "SELECT pemasukan.id, pemasukan.keterangan, pemasukan.kategori, ";
	$strSQL .= "pemasukan.nilai, pemasukan.tglpemasukan, pemasukan.created, ";
	$strSQL .= "pemasukan.changed, pemasukan.uid, ";
	$strSQL .= "katpemasukan.kategori AS kategori_title ";
	$strSQLFilteredTotal = "SELECT COUNT(pemasukan.id) ";
	$strSQL .= "FROM cms_pemasukan AS pemasukan ";
	$strSQL .= "LEFT JOIN cms_kategoripengeluaran AS katpemasukan ";
	$strSQL .= "ON pemasukan.kategori=katpemasukan.id ";
	$strSQLFilteredTotal .= "FROM cms_pemasukan AS pemasukan ";
	$strSQLFilteredTotal .= "LEFT JOIN cms_kategoripengeluaran AS katpemasukan ";
	$strSQLFilteredTotal .= "ON pemasukan.kategori=katpemasukan.id ";
	$strSQLFilteredTotal .= "WHERE 1=1 ";
	$strCriteria = "";
	if (!empty($searchQuery)){
		$strCriteria .= "AND (katpemasukan.kategori LIKE '%%%s%%' OR ";
		$strCriteria .= "katpemasukan.keterangan LIKE '%%%s%%' OR ";
		$strCriteria .= "pemasukan.keterangan LIKE '%%%s%%' OR ";
		$strCriteria .= "SUBSTR(pemasukan.tglpemasukan,1,10) LIKE '%%%s%%'  OR ";
		$strCriteria .= "pemasukan.nilai LIKE '%%%s%%'";
		$strCriteria .= ")";
	}
	$strSQL .= $strCriteria." ORDER BY $orderColumn LIMIT %d, %d";
	$strSQLFilteredTotal .= $strCriteria;
	if (!empty($searchQuery)){
		$result = db_query($strSQL,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal,$searchQuery,$searchQuery,$searchQuery,$searchQuery,$searchQuery));
	}else{
		$result = db_query($strSQL,$firstRecord,$lastRecord);
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal));
	}
	$output = array();
	$arrayhari = arrayHariSS();
	while ($data = db_fetch_object($result)){
		$rowData = array();
		$editbutton = '<img title="Klik untuk mengubah pemasukan" onclick="edit_pemasukan('.$data->id.', this.parentNode.parentNode);" src="'.$baseDirectory.'/misc/media/images/edit.ico" width="22">';
		$deletebutton = '<img title="Klik untuk menghapus pemasukan" onclick="hapus_pemasukan('.$data->id.');" src="'.$baseDirectory.'/misc/media/images/del.ico" width="22">';
		$rowData[] = $editbutton;
		$rowData[] = $deletebutton;
		$index_hari = date('w', $data->tglpemasukan);
		$tglpemasukan = date('Y-m-d', $data->tglpemasukan);
		$rowData[] = $arrayhari[$index_hari];
		$rowData[] = $tglpemasukan;
		$rowData[] = $data->kategori_title;
		$rowData[] = $data->keterangan;
		$rowData[] = number_format($data->nilai,0,',','.');
		$rowData[] = $data->kategori;
		$output[] = $rowData;
	}
	$recordsTotal = db_result(db_query("SELECT COUNT(id) FROM cms_pemasukan"));
	return array(
		"draw"            => isset ( $request['draw'] ) ?
			intval( $request['draw'] ) :
			0,
		"recordsTotal"    => intval( $recordsTotal ),
		"recordsFiltered" => intval( $recordsFiltered ),
		"data"            => $output
	);
}
function serverSideGetProduct($request){
	$items = array();
	if ($_GET["term"]){
		$KATACARI = '%'.$_GET["term"].'%';
		$result = db_query("SELECT idproduct,barcode, alt_code, namaproduct, stok, hargajual,hargapokok,idkategori FROM product WHERE alt_code LIKE '%s' OR barcode LIKE '%s' OR UPPER(namaproduct) LIKE '%s' LIMIT 50",$KATACARI,$KATACARI,$KATACARI);
		$items = array();
		while ($data = db_fetch_object($result)) {
			$diskon = 0;
			if ($data->idproduct) {
				$idpelanggan = 0;
				if (isset($_GET["idpelanggan"])){
					$idpelanggan = $_GET["idpelanggan"];
				}
				$result2 = db_query(
					"SELECT besardiskon FROM diskonkategori WHERE idpelanggan='%d' AND idkategori='%d'",
					$idpelanggan,
					$data->idkategori
				);
				$datadiskon = db_fetch_object($result2);
				if (!empty($datadiskon) && $datadiskon->besardiskon >= 0) {
					$diskon = $datadiskon->besardiskon;
				}
			}
			$items[] = array(
				'value' => $data->namaproduct,
				'barcode'   => $data->barcode,
				'alt_code'  => $data->alt_code,
				'hargajual' => $data->hargajual,
				'hargapokok' => $data->hargapokok,
				'diskon' => $diskon,
				'id' => $data->idproduct,
			);
		}
	}
	return $items;
}
function serverSideGetOneProduct($request){
	$items = array();
	if ($_GET["term"]){
		$KATACARI = '%'.$_GET["term"].'%';
		$result = db_query("SELECT idproduct,barcode, alt_code, namaproduct, stok, hargajual,hargapokok FROM product WHERE alt_code LIKE '%s' OR barcode LIKE '%s' OR UPPER(namaproduct) LIKE '%s' LIMIT 1",$KATACARI,$KATACARI,$KATACARI);
		$items = array();
		while ($data = db_fetch_object($result)) {
			$diskon = 0;
			if ($data->idproduct) {
				$idpelanggan = 0;
				if (isset($_GET["idpelanggan"])){
					$idpelanggan = $_GET["idpelanggan"];
				}
				$result2 = db_query(
					"SELECT besardiskon FROM diskonkategori WHERE idpelanggan='%d' AND idkategori='%d'",
					$idpelanggan,
					$data->idkategori
				);
				$datadiskon = db_fetch_object($result2);
				if ($datadiskon->besardiskon >= 0) {
					$diskon = $datadiskon->besardiskon;
				}
			}
			$items[] = array(
				'value' => $data->namaproduct,
				'barcode'   => $data->barcode,
				'alt_code'  => $data->alt_code,
				'hargajual' => $data->hargajual,
				'hargapokok' => $data->hargapokok,
				'diskon' => $diskon,
				'id' => $data->idproduct,
			);
		}
	}
	return $items;
}
function serverSideDetailPenjualan($request){
	global $baseDirectory;
	$pageStart = $_GET['start'];
	if (isset($_GET['asal']) && $_GET['asal'] == 'penjualan'){
		$pageLength = -1;
	}else {
		$pageLength = $_GET['length'];
	}
	$searchArray = $_REQUEST['search'];
	$idPenjualan = $_REQUEST['idpenjualan'];
	$searchQuery = $searchArray['value'];
	$arrayColumn = array(
		1 => 'product.barcode',
		2 => 'product.namaproduct',
		3 => 'detail.jumlah',
		4 => 'detail.hargajual',
		5 => 'detail.hargapokok',
		6 => '(detail.jumlah*detail.hargajual)',
		7 => '(detail.jumlah*detail.hargapokok)',
		8 => '(detail.jumlah*(detail.hargajual - detail.hargapokok))',
	);
	$orderColumnArray = isset($_REQUEST['order']) && !empty($_REQUEST['order']) ? $_REQUEST['order'] : array( 0 => array('column' => 1, 'dir' => 'ASC'));
	$orderColumn = $arrayColumn[$orderColumnArray[0]['column']].' '.$orderColumnArray[0]['dir'];
	if (is_null($pageStart)){
		$pageStart = 0;
	}
	if (is_null($pageLength)){
		$pageLength = 25;
	}

	$firstRecord = $pageStart;
	$lastRecord = $pageStart + $pageLength;
	$strSQL = 'SELECT detail.iddetail,product.barcode, product.namaproduct, detail.jumlah,';
	$strSQL .= 'detail.hargapokok,detail.hargajual,(detail.hargajual*detail.jumlah) AS subtotal,';
	$strSQL .= '(detail.hargapokok*detail.jumlah) AS modal,';
	$strSQL .= '((detail.hargajual-detail.hargapokok)*detail.jumlah) AS laba ';
	$strSQL .= 'FROM detailpenjualan detail LEFT JOIN product product ';
	$strSQL .= 'ON detail.idproduct=product.idproduct ';
	$strSQL .= 'LEFT JOIN supplier supp ON product.idsupplier=supp.idsupplier ';
	$strSQL .= 'WHERE detail.idpenjualan=%d ';
	$strSQLFilteredTotal = 'SELECT COUNT(detail.iddetail) FROM ';
	$strSQLFilteredTotal .= 'detailpenjualan detail LEFT JOIN product product ';
	$strSQLFilteredTotal .= 'ON detail.idproduct=product.idproduct ';
	$strSQLFilteredTotal .= 'LEFT JOIN supplier supp ON product.idsupplier=supp.idsupplier ';
	$strSQLFilteredTotal .= 'WHERE detail.idpenjualan=%d ';
	$strCriteria = "";
	if (!empty($searchQuery)){
		$strCriteria .= "AND (product.barcode LIKE '%%%s%%' OR ";
		$strCriteria .= "product.namaproduct LIKE '%%%s%%'";
		$strCriteria .= ")";
	}
	if ($pageLength == -1){
		$strSQL .= $strCriteria . " ORDER BY $orderColumn";
	}else {
		$strSQL .= $strCriteria . " ORDER BY $orderColumn LIMIT %d, %d";
	}
	$strSQLFilteredTotal .= $strCriteria;
	if (!empty($searchQuery)) {
		if ($pageLength == -1){
			$result = db_query($strSQL, $idPenjualan, $searchQuery, $searchQuery);
		}else {
			$result = db_query($strSQL, $idPenjualan, $searchQuery, $searchQuery, $firstRecord, $lastRecord);
		}
		$recordsFiltered = db_result(
			db_query($strSQLFilteredTotal, $idPenjualan, $searchQuery, $searchQuery)
		);
	}else{
		if ($pageLength == -1) {
			$result = db_query($strSQL, $idPenjualan);
		}else {
			$result = db_query($strSQL, $idPenjualan, $firstRecord, $lastRecord);
		}
		$recordsFiltered = db_result(db_query($strSQLFilteredTotal,$idPenjualan));
	}
	$output = array();
	while($data = db_fetch_object($result)){
		$rowData = array();
		$deletebutton = '<img title="Klik untuk menghapus detail penjualan" onclick="hapus_detail('.$data->iddetail.',\''.$data->namaproduct.'\');" src="'.$baseDirectory.'/misc/media/images/del.ico" width="22">';
		$rowData[] = $deletebutton;
		$rowData[] = $data->barcode;
		$rowData[] = $data->namaproduct;
		$rowData[] = $data->jumlah;
		$rowData[] = number_format($data->hargajual,0,',','.');
		$rowData[] = number_format($data->hargapokok,0,',','.');
		$rowData[] = number_format($data->subtotal,0,',','.');
		$rowData[] = number_format($data->modal,0,',','.');
		$rowData[] = number_format($data->laba,0,',','.');
		$rowData[] = $data->iddetail;
		$output[] = $rowData;
	}
	$recordsTotal = db_result(db_query("SELECT COUNT(iddetail) FROM detailpenjualan"));
	return array(
		"draw"            => isset ( $request['draw'] ) ?
			intval( $request['draw'] ) :
			0,
		"recordsTotal"    => intval( $recordsTotal ),
		"recordsFiltered" => intval( $recordsFiltered ),
		"data"            => $output
	);
}
function serverSideArrayKategori($request){
	$strSQL = 'SELECT idkategori, kodekategori, kategori FROM kategori';
	$result = db_query($strSQL);
	$output = array();
	while($data = db_fetch_object($result)){
		$output[$data->idkategori] = $data->kodekategori.' => '.$data->kategori;
	}
	$strSQL = 'SELECT idkategori FROM product WHERE idproduct=%d';
	$idKategori = db_result(db_query($strSQL, $request['idproduk']));
	$output['selected'] =  $idKategori;
	return $output;
}
function serverSideArraySubKategori($request){
	$strSQL = 'SELECT idkategori FROM product WHERE idproduct=%d';
	$idKategori = db_result(db_query($strSQL, $request['idproduk']));
	$strSQL = 'SELECT idsubkategori, kodesubkategori, subkategori FROM subkategori WHERE idkategori=%d';
	$result = db_query($strSQL,$idKategori);
	$output = array();
	while($data = db_fetch_object($result)){
		$output[$data->idsubkategori] = $data->kodesubkategori.' => '.$data->subkategori;
	}
	$strSQL = 'SELECT idsubkategori FROM product WHERE idproduct=%d';
	$idSubKategori = db_result(db_query($strSQL, $request['idproduk']));
	$output['selected'] =  $idSubKategori;
	return $output;
}
function serverSideArraySatuan($request){
	$strSQL = 'SELECT satuan FROM satuan ORDER BY satuan';
	$result = db_query($strSQL);
	$output = array();
	while($data = db_fetch_object($result)){
		$output[$data->satuan] = $data->satuan;
	}
	$strSQL = 'SELECT satuan FROM product WHERE idproduct=%d';
	$satuan = db_result(db_query($strSQL, $request['idproduk']));
	$output['selected'] =  $satuan;
	return $output;
}
function serverSideGetAllProduct($request){
	$result = db_query("SELECT idproduct,barcode, alt_code, namaproduct, stok, hargajual,hargapokok,idkategori FROM product");
	$items = array();
	while ($data = db_fetch_object($result)) {
		$data->diskon = 0;
		if ($data->idproduct) {
			$idpelanggan = 0;
			if (isset($request["idpelanggan"])){
				$idpelanggan = $request["idpelanggan"];
			}
			$result2 = db_query(
				"SELECT besardiskon FROM diskonkategori WHERE idpelanggan='%d' AND idkategori='%d'",
				$idpelanggan,
				$data->idkategori
			);
			$datadiskon = db_fetch_object($result2);
			if (!empty($datadiskon) && $datadiskon->besardiskon >= 0) {
				$data->diskon = $datadiskon->besardiskon;
			}
		}
		$items[] = $data;
	}
	return $items;
}
function serverSidePostSales($request){
	header('Access-Control-Allow-Origin: *');
	$postData = $request;
	$savedData = array();
	if (count($postData)){
		$newData = array();
		foreach ($postData as $key => $dataVal){
			if ($key != 'request_data'){
				$splitKey = explode('__', $key);
				$newData[$splitKey[1]][$splitKey[0]] = $dataVal;
			}
		}
		$savedData = saveSalesAndroid($newData);
	}
	return $savedData;
}

function saveSalesAndroid($postData = null){
	if (!empty($postData) && count($postData)){
		$savedData = array();
		$username = $postData['']['userkonter'];
		$password = $postData['']['passkonter'];
		$savedData['username'] = $username;
		$savedData['password'] = $password;
		$userID = db_result(db_query("SELECT uid FROM cms_users WHERE name='%s' AND pass='%s'", $username, md5($password)));
		$savedData['user_id'] = $userID;
		if (!empty($userID) && count($postData) && isset($postData[0])) {
			$userTimeZone = db_result(db_query("SELECT timezone_name FROM cms_users WHERE uid=%d", $userID));
			date_default_timezone_set($userTimeZone);
			$savedData['user_timezone'] = $userTimeZone;
			$totalBelanja = 0;
			$totalModal = 0;
			for ($i = 0; $i < count($postData); $i++) {
				$totalBelanja = $totalBelanja + ($postData[$i]['hargajual'] * $postData[$i]['jumlah']);
				$totalModal = $totalModal + ($postData[$i]['hargamodal'] * $postData[$i]['jumlah']);
			}
			$result = db_query("SELECT idpenjualan FROM penjualan ORDER BY idpenjualan DESC LIMIT 1");
			$data = db_fetch_object($result);
			if ($data->idpenjualan > 0) {
				$next_id = $data->idpenjualan + 1;
			} else {
				$next_id = 1;
			}
			$no_nota = buat_nota_server_side($next_id);
			$carabayar = 'TUNAI';
			$bayar = $totalBelanja;
			$nokartu = '';
			$waktujual = date("Y-m-d H:i:s");
			$savedData['penjualan']['nonota'] = $no_nota;
			$savedData['penjualan']['idpemakai'] = $userID;
			$savedData['penjualan']['total'] = $totalBelanja;
			$savedData['penjualan']['carabayar'] = $carabayar;
			$savedData['penjualan']['bayar'] = $bayar;
			$savedData['penjualan']['nokartu'] = $nokartu;
			$savedData['penjualan']['tglpenjualan'] = $waktujual;
			$savedData['penjualan']['idpelanggan'] = 0;
			$savedData['penjualan']['totalmodal'] = $totalModal;
			db_query("INSERT INTO penjualan (nonota, idpemakai, total, carabayar, bayar, nokartu, 
			tglpenjualan, idpelanggan, keterangan, totalmodal, android_order)
			VALUES ('%s', '%d', '%f', '%s', '%f', '%s', '%s', '%d', '%s','%f','%d')",
			$no_nota, $userID, $totalBelanja, $carabayar, $bayar, $nokartu, $waktujual, 0, 'Penjualan Via Android', $totalModal, 1);
			$idSales = db_result(db_query("SELECT idpenjualan FROM penjualan WHERE nonota='%s'", $no_nota));
			$savedData['penjualan']['id'] = $idSales;
			for ($i = 0; $i < count($postData); $i++) {
				$detailData = array();
				$idProduct = $postData[$i]['idproduct'];
				$detailData['idproduk'] = $idProduct;
				$qtyProduct = $postData[$i]['jumlah'];
				$detailData['qty'] = $qtyProduct;
				$hargaJual = $postData[$i]['hargajual'];
				$detailData['hargajual'] = $hargaJual;
				$diskon = 0;
				$detailData['diskon'] = $diskon;
				$hargaPokok = $postData[$i]['hargamodal'];
				$detailData['hargapokok'] = $hargaPokok;
				if (!empty($idProduct) && !empty($qtyProduct)) {
					db_query("INSERT INTO detailpenjualan(idpenjualan, idproduct, jumlah,
					hargapokok, hargajual, diskon) VALUES ('%d', '%d', '%f', '%f', '%f', '%f')",
					$idSales, $idProduct, $qtyProduct, $hargaPokok, $hargaJual, $diskon);
					$savedData['detailpenjualan'][] = $detailData;
					$result = db_query("SELECT type_product, hargapokok,stok FROM product WHERE idproduct='%d'",$idProduct);
					$data = db_fetch_object($result);
					$stokSebelum = $data->stok;
					if ($data->type_product == 0){
						$stokSekarang = $stokSebelum - $qtyProduct;
						db_query("UPDATE product SET stok='%f' WHERE idproduct='%d'",$stokSekarang,$idProduct);
						$keterangan = 'Penjualan';
						db_query("INSERT INTO transaksistock (idproduk, idpenjualan, stocksebelum, keluar, stocksetelah, keterangan) VALUES 	
						('%d', '%d', '%f', '%f', '%f', '%s')",$idProduct,$idSales,$stokSebelum,$qtyProduct,$stokSekarang,$keterangan);
					}
				}
			}
            do_upload_premisdata_server_side();
		}
	}
	return $savedData;
}
function buat_nota_server_side($idpenjualan){
	if ($idpenjualan > 0 AND $idpenjualan < 10){
		$no_nota = "N000000".$idpenjualan;
	}elseif ($idpenjualan >= 10 AND $idpenjualan < 100){
		$no_nota = "N00000".$idpenjualan;
	}elseif ($idpenjualan >= 100 AND $idpenjualan < 1000){
		$no_nota = "N0000".$idpenjualan;
	}elseif ($idpenjualan >= 1000 AND $idpenjualan < 10000){
		$no_nota = "N000".$idpenjualan;
	}elseif ($idpenjualan >= 10000 AND $idpenjualan < 100000){
		$no_nota = "N00".$idpenjualan;
	}elseif ($idpenjualan >= 100000 AND $idpenjualan < 1000000){
		$no_nota = "N0".$idpenjualan;
	}elseif ($idpenjualan >= 1000000){
		$no_nota = "N".$idpenjualan;
	}
	return $no_nota;
}
function serverSidePenjualanAndroid($request){
	header('Access-Control-Allow-Origin: *');
	$tglAwal = $_REQUEST['tglawal'].' 00:00';
	$tglAkhir = $_REQUEST['tglakhir'].' 23:59';
	$strSQL = "SELECT penj.idpenjualan,penj.nonota,SUBSTR(penj.tglpenjualan,1,10) AS tanggal,";
	$strSQL .= "SUBSTR(penj.tglpenjualan,11,9) AS waktu, penj.idpemakai,penj.total,penj.totalmodal,";
	$strSQL .= "(penj.total-penj.totalmodal) AS laba, penj.carabayar,penj.bayar,penj.kembali,";
	$strSQL .= "penj.nokartu,penj.keterangan,penj.insert_date, user.name, plg.namapelanggan ";
	$strSQL .= "FROM penjualan AS penj ";
	$strSQL .= "LEFT JOIN cms_users AS user ON user.uid = penj.idpemakai ";
	$strSQL .= "LEFT JOIN pelanggan AS plg ON plg.idpelanggan = penj.idpelanggan ";
	$strSQL .= "WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' ";
	$strSQL .= "ORDER BY tglpenjualan";
	$result = db_query($strSQL,$tglAwal,$tglAkhir);
	$output = array();
	while ($data = db_fetch_object($result)){
		$output[] = $data;
	}
	return $output;
}
function serverSidePerubahanHargaAndroid($request){
	$returnData = json_decode($request);
	for ($i = 0;$i < count($returnData);$i++){
		$sql_update = "UPDATE product SET hargajual='%f',uploaded=0, changed=1 WHERE idproduct='%d'";
		db_query($sql_update, $returnData[$i]->hargajualbaru,$returnData[$i]->idproduct);
		db_query("INSERT INTO historyhargajual (hargasebelum, hargasesudah, uid) VALUES('%f','%f','%d')",
			$returnData[$i]->hargajual,$returnData[$i]->hargajualbaru,1);
	}
	return $returnData;
}
function serverSideGetOmset($request){
	header('Access-Control-Allow-Origin: *');
	$output = array();
	if (isset($request['tglawal']) && isset($request['tglakhir'])) {
		$namaBulan = namaBulan();
		$tglAwal = $request['tglawal'];
		$tglAkhir = $request['tglakhir'];
		$username = $request['userkonter'];
		$password = $request['passkonter'];
		$dateRange = create_date_range_array($username, $password, $tglAwal, $tglAkhir);
		$strSQL = "SELECT tanggal, omset FROM laporan_omset WHERE tanggal BETWEEN '%s' AND '%s' ORDER BY tanggal";
		$result = db_query($strSQL, $tglAwal, $tglAkhir);
		$dateExist = array();
		while ($data = db_fetch_object($result)) {
			$dateExist[] = $data->tanggal;
			$dataOmset = new stdClass();
			$dataOmset->tanggal = $data->tanggal;
			$splitTanggal = explode('-', $data->tanggal);
			$dataOmset->rawdate = mktime(7, 0, 0, $splitTanggal[1], $splitTanggal[2], $splitTanggal[0]);
			$dataOmset->tanggaltampil = date('d', $dataOmset->rawdate).' '.$namaBulan[((int)$splitTanggal[1] - 1)].' '.$splitTanggal[0];
			$dataOmset->omset = $data->omset;
			$output[$data->tanggal] = $dataOmset;
		}
		for ($i = 0; $i < count($dateRange); $i++) {
			if (!count($dateExist) || !in_array($dateRange[$i], $dateExist)) {
				$dataOmset = new stdClass();
				$dataOmset->tanggal = $dateRange[$i];
				$dataOmset->omset = 0;
				$splitTanggal = explode('-', $dateRange[$i]);
				$dataOmset->rawdate = mktime(7, 0, 0, $splitTanggal[1], $splitTanggal[2], $splitTanggal[0]);
				$dataOmset->tanggaltampil = date('d', $dataOmset->rawdate).' '.$namaBulan[((int)$splitTanggal[1] - 1)].' '.$splitTanggal[0];
				$output[$dataOmset->tanggal] = $dataOmset;
			}
		}
		ksort($output);
		$outputRet = array();
		foreach($output as $dataOmset){
			$outputRet[] = $dataOmset;
		}
		$output = $outputRet;
	}else{
		$output = $request;
	}
	return $output;
}
function serverSidePostOmset($request, $username, $password){
	$returnData = json_decode($request);
	$userID = db_result(db_query("SELECT uid FROM cms_users WHERE name='%s' AND pass='%s'", $username, md5($password)));
	if ($userID > 0) {
		$savedData['user_id'] = $userID;
		$userTimeZone = db_result(db_query("SELECT timezone_name FROM cms_users WHERE uid=%d", $userID));
		date_default_timezone_set($userTimeZone);
		for ($i = 0; $i < count($returnData); $i++) {
			$omsetExists = db_result(db_query("SELECT COUNT(*) FROM laporan_omset WHERE tanggal = '%s'", $returnData[$i]->tanggal));
			$changed = time();
			if ($omsetExists > 0) {
				$sql_update = "UPDATE laporan_omset SET omset='%f',changed = '%d', uid='%d', uploaded=0 WHERE tanggal='%s'";
				db_query($sql_update, $returnData[$i]->omset, $changed, $userID, $returnData[$i]->tanggal);
			} else {
				$sql_insert = "INSERT INTO laporan_omset(tanggal, omset, created, uid) VALUES ('%s','%f','%d','%d')";
				db_query($sql_insert, $returnData[$i]->tanggal, $returnData[$i]->omset, $changed, $userID);
			}
		}
		do_upload_omset_server_side($username, $password);
	}
	return $returnData;
}
function namaBulan(){
	return array(
		"Januari", "Februari", "Maret",
		"April", "Mei", "Juni", "Juli",
		"Agustus", "September", "Oktober",
		"November", "Desember"
	);
}
function create_date_range_array($username = null, $password = null, $strDateFrom, $strDateTo, $dateFormat = 'Y-m-d')
{
	set_default_time_zone($username, $password);
	$aryRange = array();
	$iDateFrom = mktime(0, 0, 0, substr($strDateFrom, 5, 2), substr($strDateFrom, 8, 2), substr($strDateFrom, 0, 4));
	$iDateTo = mktime(0, 0, 0, substr($strDateTo, 5, 2), substr($strDateTo, 8, 2), substr($strDateTo, 0, 4));

	if ($iDateTo >= $iDateFrom) {
		if ($dateFormat == 'UNIX') {
			array_push($aryRange, $iDateFrom); // first entry
		} else {
			array_push($aryRange, date($dateFormat, $iDateFrom)); // first entry
		}
		while ($iDateFrom < $iDateTo) {
			$iDateFrom += 86400; // add 24 hours
			if ($dateFormat == 'UNIX') {
				array_push($aryRange, $iDateFrom);
			} else {
				array_push($aryRange, date($dateFormat, $iDateFrom));
			}
		}
	}
	return $aryRange;
}
function set_default_time_zone($username = null, $password = null){
	$userTimeZone = db_result(db_query("SELECT timezone_name FROM cms_users WHERE name='%s' AND pass='%s'", $username, md5($password)));
	$defaultTimeZone = date_default_timezone_get();
	if (!empty($userTimeZone)) {
		if ($defaultTimeZone != $userTimeZone){
			date_default_timezone_set($userTimeZone);
		}
	}else{
		if ($defaultTimeZone != 'Asia/Jakarta') {
			date_default_timezone_set('Asia/Jakarta');
		}
	}
}

function get_data_premis_server_side(){
	$strSQL = 'SELECT id, zone, nama, alamat, telepon, whatsapp, bbm, telegram, email, ';
    $strSQL .= 'website, created, changed, uid FROM cms_datapremis LIMIT 1';
    $result = db_query($strSQL);
    $arrayData = db_fetch_array($result);
    return $arrayData;
}

function get_updated_penjualan_server_side(){
    $strSQL = 'SELECT idpenjualan, nonota, idtitipanlaundry, idcustomerorder, tglpenjualan, idpemakai, ';
    $strSQL .= 'idpelanggan, total, totalmodal, carabayar, bayar, kembali, perlakuankembalian, ';
    $strSQL .= 'nokartu, keterangan, insert_date ';
    $strSQL .= 'FROM penjualan WHERE uploaded=0';
    $result = db_query($strSQL);
    $dataPenjualan = array();
    while ($data = db_fetch_array($result)){
        $dataPenjualan[] = $data;
    }
    return $dataPenjualan;
}
function get_updated_product_server_side(){
    $strSQL = 'SELECT idproduct, idsupplier, idkategori, idsubkategori, barcode, ';
    $strSQL .= 'alt_code, namaproduct, type_product, hargapokok, hargajual, margin, minstok, ';
    $strSQL .= 'maxstok, stok, satuan, berat, keterangan, lead_time, aturan_jam_kerja, ';
    $strSQL .= 'berlaku_sebelum_zuhur, status_product, uploaded, changed ';
    $strSQL .= 'FROM product WHERE uploaded=0';
    $result = db_query($strSQL);
    $dataProduct = array();
    while ($data = db_fetch_array($result)){
        $dataProduct[] = $data;
    }
    return $dataProduct;
}
function do_upload_premisdata_server_side(){
    $resultview = '';
    if (is_connected_server_side()) {
        //copy premis data();
        $url = 'http://report.ikhwanit.com/importdatapremis';
        /* Process Upload Product Data */
        $totalRecord = db_result(db_query("SELECT COUNT(*) AS total_record FROM product WHERE uploaded = 0"));
        $totalUploadProcess = floor($totalRecord / 40) + 1;
        if ($totalUploadProcess > 40) {
            $totalUploadProcess = 40;
        }
        $dataPremis = get_data_premis_server_side();
        $dataProduct = get_updated_product_server_side();
        $uploadproses = 1;
        for ($i = 0; $i < $totalUploadProcess; $i++) {
            $startJ = ($i * 40);
            $endRecord = ($i * 40) + 40;
            if ($endRecord > $totalRecord) {
                $endRecord = $totalRecord;
            }
            $postproduct = array();
            for ($j = $startJ; $j < $endRecord; $j++) {
                if (isset($dataProduct[$j])) {
                    $postproduct[] = $dataProduct[$j];
                }
            }
            $postdata = array('premisuser' => 'ikhwanmart', 'premispssword' => '@abuya313', 'datapremis' => $dataPremis);
            $postdata['product'] = $postproduct;
            $fields_string2 = http_build_query($postdata, '', '&');
            $ch = curl_init();
            //set the url, number of POST vars, POST data
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //Set curl to return the data instead of printing it to the browser.
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string2);
            curl_setopt($ch, CURLOPT_COOKIEJAR, 'cookie.txt');
            $result = curl_exec($ch);
            $arrayProdUploaded = json_decode($result);
            $resultview .= '<p>' . $uploadproses . '. Record : ' . $startJ . ' to ' . $endRecord . ' Product successfully uploaded[' . count($arrayProdUploaded) . '] : <ul>';
            for ($k = 0; $k < count($arrayProdUploaded); $k++) {
                $prod_id = $arrayProdUploaded[$k]->idproduct_old;
                $proses = $arrayProdUploaded[$k]->proses;
                db_query("UPDATE product SET uploaded = 1 WHERE idproduct='%d'", $prod_id);
                $productName = $arrayProdUploaded[$k]->namaproduct;
                $productBarcode = $arrayProdUploaded[$k]->barcode;
                $resultview .= '<li>ID : ' . $prod_id . ', Barcode : ' . $productBarcode . ', Product Name : ' . $productName . ', Proses : ' . $proses . '</li>';
            }
            $resultview .= '</ul></p>';
            curl_close($ch);
            $uploadproses++;
        }
        /* End Process Upload Product Data */
        /* Process Upload Penjualan Data */
        $totalRecord = db_result(db_query("SELECT COUNT(*) AS total_record FROM penjualan WHERE uploaded = 0"));
        $totalUploadProcess = floor($totalRecord / 50) + 1;
        if ($totalUploadProcess > 40) {
            $totalUploadProcess = 40;
        }
        $dataPremis = get_data_premis_server_side();
        $dataPenjualan = get_updated_penjualan_server_side();
        $uploadproses = 1;
        for ($i = 0; $i < $totalUploadProcess; $i++) {
            $startJ = ($i * 50);
            $endRecord = ($i * 50) + 50;
            if ($endRecord > $totalRecord) {
                $endRecord = $totalRecord;
            }
            $postpenjualan = array();
            for ($j = $startJ; $j < $endRecord; $j++) {
                if (isset($dataPenjualan[$j])) {
                    $postpenjualan[] = $dataPenjualan[$j];
                }
            }
            $postdata = array('premisuser' => 'ikhwanmart', 'premispssword' => '@abuya313', 'datapremis' => $dataPremis);
            $postdata['penjualan'] = $postpenjualan;
            $fields_string2 = http_build_query($postdata, '', '&');
            $ch = curl_init();
            //set the url, number of POST vars, POST data
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //Set curl to return the data instead of printing it to the browser.
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string2);
            curl_setopt($ch, CURLOPT_COOKIEJAR, 'cookie.txt');
            $result = curl_exec($ch);
            $arrayPenjualanUploaded = json_decode($result);
            $resultview .= '<p>' . $uploadproses . '. Penjualan successfully uploaded[' . count($arrayPenjualanUploaded) . '] : <ul>';
            for ($k = 0; $k < count($arrayPenjualanUploaded); $k++) {
                $penj_id = $arrayPenjualanUploaded[$k]->idpenjualan;
                $proses = $arrayPenjualanUploaded[$k]->proses;
                db_query("UPDATE penjualan SET uploaded = 1 WHERE idpenjualan='%d'", $penj_id);
                $noNota = $arrayPenjualanUploaded[$k]->nonota;
                $tglPenjualan = $arrayPenjualanUploaded[$k]->tglpenjualan;
                $resultview .= '<li>ID report : ' . $arrayPenjualanUploaded[$k]->id . ', ID : ' . $penj_id . ', No. Nota : ' . $noNota . ', Tgl Penjualan : ' . $tglPenjualan . ', Proses : ' . $proses . '</li>';
            }
            $resultview .= '</ul></p>';
            curl_close($ch);
            $uploadproses++;
        }
        /* End Process Upload Penjualan Data */
    }
    return $resultview;
}
function do_upload_omset_server_side($username = null, $password = null){
	$resultview = '';
	if (is_connected_server_side() && !empty($username) && !empty($password)) {
		//copy premis data();
		$url = 'http://report.ikhwanit.com/importdatapremis';
		/* Process Upload Omset Data */
		$totalRecord = db_result(db_query("SELECT COUNT(*) AS total_record FROM laporan_omset WHERE uploaded = 0"));
		$totalUploadProcess = floor($totalRecord / 40) + 1;
		if ($totalUploadProcess > 40) {
			$totalUploadProcess = 40;
		}
		$dataPremis = get_data_premis_server_side();
		$dataOmset = get_updated_omset_server_side();
		$uploadproses = 1;
		for ($i = 0; $i < $totalUploadProcess; $i++) {
			$startJ = ($i * 40);
			$endRecord = ($i * 40) + 40;
			if ($endRecord > $totalRecord) {
				$endRecord = $totalRecord;
			}
			$postomset = array();
			for ($j = $startJ; $j < $endRecord; $j++) {
				if (isset($dataOmset[$j])) {
					$postomset[] = $dataOmset[$j];
				}
			}
			$postdata = array('premisuser' => 'ikhwanmart', 'premispssword' => '@abuya313', 'datapremis' => $dataPremis);
			$postdata['omset'] = $postomset;
			$fields_string2 = http_build_query($postdata, '', '&');
			$ch = curl_init();
			//set the url, number of POST vars, POST data
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //Set curl to return the data instead of printing it to the browser.
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string2);
			curl_setopt($ch, CURLOPT_COOKIEJAR, 'cookie.txt');
			$result = curl_exec($ch);
			$arrayOmsetUploaded = json_decode($result);
			$resultview .= '<p>' . $uploadproses . '. Record : ' . $startJ . ' to ' . $endRecord . ' Omset successfully uploaded[' . count($arrayOmsetUploaded) . '] : <ul>';
			for ($k = 0; $k < count($arrayOmsetUploaded); $k++) {
				set_default_time_zone($username, $password);
				$omsetDate = date('Y-m-d',$arrayOmsetUploaded[$k]->tglomset);
				$proses = $arrayOmsetUploaded[$k]->proses;
				db_query("UPDATE laporan_omset SET uploaded = 1 WHERE tanggal='%s'", $omsetDate);
				$resultview .= '<li>Tanggal Omset : ' . $omsetDate . ', Omset : ' . $arrayOmsetUploaded[$k]->omset . ', Proses : ' . $proses . '</li>';
			}
			$resultview .= '</ul></p>';
			curl_close($ch);
			$uploadproses++;
		}
		/* End Process Upload Omset */
	}
	return $resultview;
}
function get_updated_omset_server_side(){
    date_default_timezone_set('Asia/Jakarta');
	$strSQL = 'SELECT tanggal, omset, created, changed, uid, uploaded ';
	$strSQL .= 'FROM laporan_omset WHERE uploaded=0';
	$result = db_query($strSQL);
	$dataOmset = array();
	while ($data = db_fetch_array($result)) {
		$postData = array();
		$splitDate = explode('-', $data['tanggal']);
		$postData['tglomset'] = mktime(23, 0, 0, (int)$splitDate[1], (int)$splitDate[2], (int)$splitDate[0]);
		$postData['omset'] = $data['omset'];
		$dataOmset[] = $postData;
	}
	return $dataOmset;
}
function is_connected_server_side(){
    $connected = @fsockopen("report.ikhwanit.com", 80);
    //website, port  (try 80 or 443)
    if ($connected){
        $is_conn = true; //action when connected
        fclose($connected);
    }else{
        $is_conn = false; //action in connection failure
    }
    return $is_conn;

}

function serverSideCheckLogin($request){
    $username = $request['userkonter'];
    $password = $request['passkonter'];
    $userID = db_result(db_query("SELECT uid FROM cms_users WHERE name='%s' AND pass='%s'", $username, md5($password)));
    $retArray = array();
    $retData = new stdClass();
    $retData->uservalid = 0;
    if ($userID > 0){
        $retData->uservalid = 1;
    }
    $retArray[] = $retData;
    return $retArray;
}
if ($_GET['request_data'] == 'pelanggan'){
	$returnArray = serverSidePelanggan($_GET);
}else if($_GET['request_data'] == 'produk'){
	$returnArray = serverSideProduk($_GET);
}else if($_GET['request_data'] == 'penjualan'){
	$returnArray = serverSidePenjualan($_GET);
}else if($_GET['request_data'] == 'penjualan2'){
	$returnArray = serverSidePenjualan2($_GET);
}else if($_GET['request_data'] == 'laundry'){
    $returnArray = serverSideLaundry($_GET);
}else if($_GET['request_data'] == 'kategoripengeluaran'){
	$returnArray = kategoriPengeluaran($_GET);
}else if($_GET['request_data'] == 'pengeluaran'){
	$returnArray = pengeluaran($_GET);
}else if($_GET['request_data'] == 'pemasukan'){
	$returnArray = pemasukan($_GET);
}else if($_GET['request_data'] == 'customerorder'){
	$returnArray = serverSideCustomerOrder($_GET);
}else if($_GET['request_data'] == 'getproduct'){
	$returnArray = serverSideGetProduct($_GET);
}else if($_GET['request_data'] == 'getproductbarcode'){
	$returnArray = serverSideGetOneProduct($_GET);
}else if($_GET['request_data'] == 'detailpenjualan'){
	$returnArray = serverSideDetailPenjualan($_GET);
}else if($_GET['request_data'] == 'kategori'){
	$returnArray = serverSideArrayKategori($_GET);
}else if($_GET['request_data'] == 'subkategori'){
	$returnArray = serverSideArraySubKategori($_GET);
}else if($_GET['request_data'] == 'satuan'){
	$returnArray = serverSideArraySatuan($_GET);
}else if($_GET['request_data'] == 'allproduct'){
	header('Access-Control-Allow-Origin: *');
	$returnArray = serverSideGetAllProduct($_GET);
}else if ($_GET['request_data'] == 'postsales'){
	header('Access-Control-Allow-Origin: *');
	$returnArray = serverSidePostSales($_GET);
}else if ($_GET['request_data'] == 'penjualanandroid'){
	header('Access-Control-Allow-Origin: *');
	$returnArray = serverSidePenjualanAndroid($_GET);
}else if ($_GET['request_data'] == 'perubahanhargadroid'){
	header('Access-Control-Allow-Origin: *');
	if (isset($_SERVER['HTTP_ORIGIN'])) {
		header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
		header('Access-Control-Allow-Credentials: true');
		header('Access-Control-Max-Age: 86400');    // cache for 1 day
	}
	// Access-Control headers are received during OPTIONS requests
	if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
		if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
			header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

		if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
			header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
		exit(0);
	}
	//http://stackoverflow.com/questions/15485354/angular-http-post-to-php-and-undefined
	$postdata = file_get_contents("php://input");
	if (isset($postdata)) {
		$returnArray = serverSidePerubahanHargaAndroid($postdata);
	}
}else if ($_GET['request_data'] == 'omsetandroid'){
	header('Access-Control-Allow-Origin: *');
	$returnArray = serverSideGetOmset($_GET);
}else if ($_GET['request_data'] == 'postOmsetAndroid'){
	$username = $_GET['userkonter'];
	$password = $_GET['passkonter'];
	header('Access-Control-Allow-Origin: *');
	if (isset($_SERVER['HTTP_ORIGIN'])) {
		header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
		header('Access-Control-Allow-Credentials: true');
		header('Access-Control-Max-Age: 86400');    // cache for 1 day
	}
	// Access-Control headers are received during OPTIONS requests
	if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
		if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
			header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

		if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
			header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
		exit(0);
	}
	//http://stackoverflow.com/questions/15485354/angular-http-post-to-php-and-undefined
	$postdata = file_get_contents("php://input");
	if (isset($postdata)) {
		$returnArray = serverSidePostOmset($postdata,$username, $password);
	}
}else if ($_GET['request_data'] == 'checkconnection'){
    header('Access-Control-Allow-Origin: *');
    $returnArray = serverSideCheckLogin($_GET);
}
header('Access-Control-Allow-Origin: *');
echo json_encode($returnArray);
?>