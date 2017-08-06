<?php
function JAM_KERJA_LAUNDRY(){
	return array(
		'normal' => array(
			'jam_masuk' => 7, 
			'jam_keluar' => 20, 
			'total_jam' => 13
		), 
		'minggu' => array(
			'jam_masuk' => 8, 
			'jam_keluar' => 16, 
			'total_jam' => 8
		)
	);	
}
function PERLAKUAN_KEMBALIAN(){
	return array('DIKEMBALIKAN','DISUMBANGKAN','DIMASUKAN DEPOSIT');
}

function getDataLaundry($nidtitipanlaundry = null){
	$dataLaundry = null;
	if (!empty($nidtitipanlaundry)){
		$dataLaundry = array();
		$strSQL = "SELECT a.idtitipanlaundry, a.nonota, a.tglpenjualan, a.idpemakai, b.name, a.idpelanggan, a.total, 
		a.totalmodal, a.carabayar, a.bayar, a.kembali, a.nokartu, a.keterangan, a.insert_date,a.status_laundry, 
		c.namapelanggan,c.telp,c.alamat, c.email
		FROM titipanlaundry a LEFT JOIN cms_users b ON a.idpemakai = b.uid 
		LEFT JOIN pelanggan c ON a.idpelanggan = c.idpelanggan WHERE a.idtitipanlaundry=%d";
		$result = db_query($strSQL,$nidtitipanlaundry);
		$dataLaundry['info'] = db_fetch_object($result);
		$dataLaundry['detail'] = getDetailLaundry($nidtitipanlaundry);
	}
	return $dataLaundry;
}
function getDetailLaundry($nidtitipanlaundry = null){
	$detailLaundry = null;
	if (!empty($nidtitipanlaundry)){
		$detailLaundry = array();
		$strSQL = "SELECT iddetail, idtitipanlaundry, a.idproduct, jumlah, a.hargapokok, a.hargajual, 
		a.diskon, status_laundry, sisa, diambil, b.namaproduct, b.satuan, masuk, perkiraan_ambil FROM detaillaundry a LEFT JOIN product b
		ON a.idproduct = b.idproduct WHERE a.idtitipanlaundry=%d ORDER BY perkiraan_ambil DESC";
		$result = db_query($strSQL,$nidtitipanlaundry);
		while ($data = db_fetch_object($result)){
			$data->masuk = date('Y-m-d H:i', $data->masuk);
			$data->perkiraan_ambil = date('Y-m-d H:i', $data->perkiraan_ambil);
			$detailLaundry[] = $data;
		}
	}
	return $detailLaundry;
}
function getDataPenjualan($nidpenjualan = null){
	$dataPenjualan = null;
	if (!empty($nidpenjualan)){
		$dataPenjualan = array();
		$strSQL = "SELECT idpenjualan, name, nonota, tglpenjualan, idpemakai, a.idpelanggan, total,
		totalmodal, carabayar, bayar, kembali, nokartu, keterangan, insert_date,idtitipanlaundry,
		perlakuankembalian,namapelanggan FROM penjualan a LEFT JOIN cms_users b ON a.idpemakai = b.uid
		LEFT JOIN pelanggan c ON a.idpelanggan = c.idpelanggan WHERE idpenjualan=%d";
		$result = db_query($strSQL,$nidpenjualan);
		$dataPenjualan['info'] = db_fetch_object($result);
		if (!empty($dataPenjualan['info']->idtitipanlaundry)){
			$dataPenjualan['laundry'] = getDataLaundry($dataPenjualan['info']->idtitipanlaundry);
		}
		$dataPenjualan['detail'] = getDetailPenjualan($nidpenjualan);
	}
	return $dataPenjualan;
}
function getDetailPenjualan($nidpenjualan = null){
	$detailPenjualan = null;
	if (!empty($nidpenjualan)){
		$detailPenjualan = array();
		$strSQL = "SELECT iddetail, idpenjualan, a.idproduct, jumlah, a.hargapokok, a.hargajual, 
		a.diskon, b.namaproduct, b.satuan, b.barcode FROM detailpenjualan a LEFT JOIN product b
		ON a.idproduct = b.idproduct WHERE a.idpenjualan=%d";
		$result = db_query($strSQL,$nidpenjualan);
		while ($data = db_fetch_object($result)){
			$detailPenjualan[] = $data;
		}
	}
	return $detailPenjualan;
}
function printOutLaundry(){
	$dataPremis = getPremisInformation();
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	$js_path = drupal_get_path('module','penjualan').'/js/direct.print.js';
	drupal_add_js($js_path);
	global $user;
	$tablePrint = '';
	$nidtitipanlaundry = isset($_GET['nidlaundry']) ? $_GET['nidlaundry'] : null;
	$printHeader = false;
	if (!empty($nidtitipanlaundry)){
		global $user;
		$dataLaundry = getDataLaundry($nidtitipanlaundry);
		$tablePrint = '<table style="width: 240px;border-collapse: collapse;" >';
		$tablePrint .= '<tbody>';
		if ($printHeader){
			$tablePrint .= '<tr><td colspan="3" style="font-size: 12px;text-align: center;border-bottom: 1px dotted #444;border-top: 1px dotted #444;">'.$dataPremis->nama.'</td></tr>';
			$tablePrint .= '<tr><td colspan="3" style="font-size: 11px;text-align: center;border-top: 1px dotted #444;"><span style="float: left"><img src="'.base_path().'misc/media/images/bbm.png" width="12" style="vertical-align:middle;">&nbsp;'.$dataPremis->bbm.'</span><span style="float: right"><img src="'.base_path().'misc/media/images/whatsapp.png" width="11" style="vertical-align:middle;">&nbsp;'.$dataPremis->whatsapp.'&nbsp;&nbsp;</span></td></tr>';
		}
		$tablePrint .= '<tr><td colspan="3" style="font-size: 14px;line-height: 13px;">No. <strong>'.$dataLaundry['info']->nonota.'&nbsp;&nbsp;</strong></td></tr>';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 14px;line-height: 13px;"><div style="width: 30%;float: left;">Nama</div><div style="width: 70%;float: left;">: <strong>'.$dataLaundry['info']->namapelanggan.'&nbsp;&nbsp;</strong></div></td></tr>';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 14px;line-height: 13px;"><div style="width: 30%;float: left;">Telp/ HP</div><div style="width: 70%;float: left;">: '.$dataLaundry['info']->telp.'&nbsp;&nbsp;</div></td></tr>';
		$waktuPejualan = explode(' ', $dataLaundry['info']->tglpenjualan);
		$tablePrint .= '<tr><td colspan="3" style="font-size: 14px;line-height: 13px;"><div style="width: 30%;float: left;">Terima</div><div style="width: 70%;float: left;"><span style="float: left;">: '.$waktuPejualan[0].'</span><span style="float: right;">'.substr($waktuPejualan[1],0,5).'&nbsp;</span></div></td></tr>';
		$waktuSelesai = explode(' ', $dataLaundry['detail'][0]->perkiraan_ambil);
		$tablePrint .= '<tr><td colspan="3" style="font-size: 14px;border-bottom: 1px dotted #444;line-height: 13px;"><div style="width: 30%;float: left;">Selesai</div><div style="width: 70%;float: left;"><span style="float: left;">: '.$waktuSelesai[0].'</span><span style="float: right;">'.$waktuSelesai[1].'&nbsp;</span></div></td></tr>';
		$totalLaundry = 0;
		$totalDiskon = 0;
		$totalItem = array();
		for ($i = 0;$i < count($dataLaundry['detail']);$i++){
			$dataDetail = $dataLaundry['detail'][$i];
			$tablePrint .= '<tr>';
			$tablePrint .= '<td colspan="3" style="font-size: 13px;line-height: 13px;"><strong>'.$dataDetail->namaproduct.'</strong></td>';
			$tablePrint .= '</tr>';
			if ($i == (count($dataLaundry['detail']) - 1)){
				$tablePrint .= '<tr style="border-bottom: 1px dotted #444;">';
			}else{
				$tablePrint .= '<tr>';
			}
			$tablePrint .= '<td style="font-size: 13px;width:30%;line-height: 13px;">'.$dataDetail->jumlah.' '.$dataDetail->satuan.'</td>';
			if (isset($totalItem[$dataDetail->satuan])){
				$totalItem[$dataDetail->satuan] = $totalItem[$dataDetail->satuan] + $dataDetail->jumlah;
			}else{
				$totalItem[$dataDetail->satuan] = $dataDetail->jumlah;	
			}
			$tablePrint .= '<td style="font-size: 13px;width:30%;line-height: 13px;">Rp. '.number_format($dataDetail->hargajual,0,",",".").'</td>';
			$tablePrint .= '<td style="font-size: 13px;line-height: 13px;line-height: 13px;text-align: right;"><span style="float: left;">Rp.</span><span style="float: right;">'.number_format($dataDetail->hargajual*$dataDetail->jumlah,0,",",".").'&nbsp;</span></td>';
			$tablePrint .= '</tr>';
			$totalLaundry = $totalLaundry + ($dataDetail->hargajual*$dataDetail->jumlah);
			$totalDiskon = $totalDiskon + round(($dataDetail->diskon*$dataDetail->hargajual*$dataDetail->jumlah)/100,0);
		}
		$nilaiBayar = 0;
		if ($dataLaundry['info']->carabayar != 'KEMUDIAN'){
			$nilaiBayar = $dataLaundry['info']->bayar;	
		}
		$sisaYangHarusDibayar = $totalLaundry - $nilaiBayar;
		$tablePrint .= '<tr>';
		$tablePrint .= '<td colspan="2" style="font-size: 13px;text-align: right;border-top: 1px dotted #444;">TOTAL :</td>';
		$tablePrint .= '<td style="font-size: 13px;text-align: right;border-top: 1px dotted #444;text-align: right"><span style="float: left;">Rp.</span><span style="float: right;">'.number_format($totalLaundry,0,",",".").'&nbsp;</span></td>';
		$tablePrint .= '</tr>';
		if ($totalDiskon > 0){
			$tablePrint .= '<tr>';
			$tablePrint .= '<td colspan="2" style="font-size: 13px;text-align: right;">DISKON :</td>';
			$tablePrint .= '<td style="font-size: 13px;text-align: right;text-align: right"><span style="float: left;">Rp.</span><span style="float: right;">'.number_format($totalDiskon,0,",",".").'&nbsp;</span></td>';
			$tablePrint .= '</tr>';
		}
		$tablePrint .= '<tr>';
		$tablePrint .= '<td colspan="2" style="font-size: 13px;text-align: right;">BAYAR :</td>';
		$tablePrint .= '<td style="font-size: 13px;text-align: right;text-align: right"><span style="float: left;">Rp.</span><span style="float: right;">'.number_format($nilaiBayar,0,",",".").'&nbsp;</span></td>';
		$tablePrint .= '</tr>';
		$tablePrint .= '<tr>';
		$tablePrint .= '<td colspan="2" style="font-size: 13px;text-align: right;border-bottom: 1px dotted #444;">SISA :</td>';
		$tablePrint .= '<td style="font-size: 13px;text-align: right;border-bottom: 1px dotted #444;text-align: right"><span style="float: left;">Rp.</span><span style="float: right;">'.number_format($sisaYangHarusDibayar,0,",",".").'&nbsp;</span></td>';
		$tablePrint .= '</tr>';
		if ($printHeader){
			$tablePrint .= '<tr><td colspan="3" style="font-size: 11px;text-align: center;">'.$dataPremis->alamat.'&nbsp;&nbsp;</td></tr>';
			//$tablePrint .= '<tr><td colspan="3" style="font-size: 11px;text-align: center;border-bottom: 1px dotted #444;">Blok C No.22, Sentul City - Bogor&nbsp;&nbsp;</td></tr>';
		}
		$totalItemView = '';
		if (count($totalItem)){
			$itemCount = 0;
			foreach($totalItem as $key => $value){
				if ($itemCount == 0){
					$totalItemView = $value.' '.$key;
				}else{
					$totalItemView .= '+'.$value.' '.$key;
				}
				$itemCount++;
			}
		}
		$statusPembayaran  = '<b>LUNAS</b>';
		if ($sisaYangHarusDibayar > 0){
			$statusPembayaran = '<b>BELUM LUNAS</b>';
		}
		$keterangan = !empty($dataLaundry['info']->keterangan) ? $dataLaundry['info']->keterangan : '-';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 13px;line-height: 13px;">Total Qty Item : '.$totalItemView.'</td></tr>';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 13px;line-height: 13px;">Status : '.$statusPembayaran.'</td></tr>';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 13px;line-height: 13px;">Ket : '.$keterangan.'</td></tr>';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 13px;line-height: 13px;">Kasir : '.$user->name.'</td></tr>';
		$tablePrint .= '</tbody>';
		$tablePrint .= '</table>';
	}
	return $tablePrint;
}
function printOutPenjualan(){
	$dataPremis = getPremisInformation();
	$perlakuanKembalian = PERLAKUAN_KEMBALIAN();
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	$js_path = drupal_get_path('module','penjualan').'/js/direct.print.js';
	drupal_add_js($js_path);
	$tablePrint = '';
	$nidpenjualan = isset($_GET['idpenjualan']) ? $_GET['idpenjualan'] : null;
	$printHeader = true;
	$pathLogo = createLogoImagePath();
	if (!empty($nidpenjualan)){
		global $user;
		$dataPenjualan = getDataPenjualan($nidpenjualan);
		$tablePrint = '<table style="width: 240px;border-collapse: collapse;" >';
		$tablePrint .= '<tbody>';
		if ($printHeader){
			$tablePrint .= '<tr><td rowspan="3" style="border-bottom: 1px solid #000;border-top: 1px solid #000;width:50px;text-align: center;"><img height="48" src="'.$pathLogo.'" /></td><td colspan="2" style="font-size: 14px;font-weight: bold;text-align: center;border-bottom: 1px solid #000;border-top: 1px solid #000;">'.$dataPremis->nama.'</td></tr>';
			$tablePrint .= '<tr><td colspan="2" style="font-size: 11px;text-align: center;border-bottom: 1px solid #000;">'.$dataPremis->alamat.'&nbsp;&nbsp;</td></tr>';
			//$tablePrint .= '<tr><td colspan="2" style="font-size: 11px;text-align: center;border-bottom: 1px solid #000;">SENTUL CITY - BOGOR&nbsp;&nbsp;</td></tr>';
		}
		$tablePrint .= '<tr><td colspan="3" style="font-size: 14px;text-align: center;"><span style="float: left">No.</span><span style="float: right">'.$dataPenjualan['info']->nonota.'&nbsp;&nbsp;</span></td></tr>';
		if (!empty($dataPenjualan['info']->namapelanggan)){
			$tablePrint .= '<tr><td colspan="3" style="font-size: 14px;text-align: center;"><span style="float: left">Member</span><span style="float: right">'.$dataPenjualan['info']->namapelanggan.'&nbsp;&nbsp;</span></td></tr>';
		}
		$tablePrint .= '<tr><td colspan="3" style="font-size: 14px;text-align: center;border-bottom: 1px solid #000;"><span style="float: left">Tanggal</span><span style="float: right">'.$dataPenjualan['info']->tglpenjualan.'&nbsp;&nbsp;</span></td></tr>';
		if (isset($dataPenjualan['laundry'])){
			$tablePrint .= '<tr><td colspan="3" style="font-size: 12px;text-align: center;border-bottom: 1px solid #000;"><span style="float: left">MASUK : '.$dataPenjualan['laundry']['info']->tglpenjualan.'</span><span style="float: right">KASIR : '.$dataPenjualan['laundry']['info']->name.'&nbsp;&nbsp;</span></td></tr>';
			$tablePrint .= '<tr><td colspan="3" style="font-size: 12px;text-align: center;border-bottom: 1px solid #000;"><span style="float: left">Status : AMBIL</span><span style="float: right">Bayar : '.$dataPenjualan['info']->carabayar.' '.$nilaiBayar.'&nbsp;&nbsp;</span></td></tr>';
		}
		$totalPenjualan = 0;
		for ($i = 0;$i < count($dataPenjualan['detail']);$i++){
			$dataDetail = $dataPenjualan['detail'][$i];
			$tablePrint .= '<tr>';
			$tablePrint .= '<td colspan="3" style="font-size: 13px;font-weight: bold;">'.$dataDetail->namaproduct.'</td>';
			$tablePrint .= '</tr>';
			$tablePrint .= '<tr>';
			$tablePrint .= '<td style="font-size: 13px;font-weight: bold;text-align: right;">'.number_format($dataDetail->hargajual,0,",",".").'</td>';
			$tablePrint .= '<td style="font-size: 13px;font-weight: bold;text-align: right;">x '.number_format($dataDetail->jumlah,0,",",".").'</td>';
			$tablePrint .= '<td style="font-size: 13px;font-weight: bold;text-align: right;">'.number_format($dataDetail->hargajual*$dataDetail->jumlah,0,",",".").'&nbsp;&nbsp;</td>';
			$tablePrint .= '</tr>';
			$totalPenjualan = $totalPenjualan + ($dataDetail->hargajual*$dataDetail->jumlah);
		}
		$tablePrint .= '<tr><td colspan="3" style="font-size: 13px;font-weight: bold;text-align: center;border-top: 1px solid #000;"><span style="float: left">TOTAL</span><span style="float: right">'.number_format($totalPenjualan,0,",",".").'&nbsp;&nbsp;</span></td></tr>';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 13px;font-weight: bold;text-align: center;"><span style="float: left">'.strtoupper($dataPenjualan['info']->carabayar).'</span><span style="float: right">'.number_format($dataPenjualan['info']->bayar,0,",",".").'&nbsp;&nbsp;</span></td></tr>';
		if (($dataPenjualan['info']->carabayar == 'HUTANG' || $dataPenjualan['info']->kembali < 0) && !empty($dataPenjualan['info']->idpelanggan)){
			$totalHutang = getTotalHutangLatest($dataPenjualan['info']->idpelanggan);
			$tablePrint .= '<tr><td colspan="3" style="font-size: 13px;font-weight: bold;text-align: center;"><span style="float: left">TOTAL HUTANG</span><span style="float: right">'.number_format($totalHutang,0,",",".").'&nbsp;&nbsp;</span></td></tr>';
		}
		$viewperlakuankembalian = '';
		if ($dataPenjualan['info']->perlakuankembalian != 0){
			$viewperlakuankembalian = '<span style="font-size: 13px;font-weight: bold;">'.$perlakuanKembalian[$dataPenjualan['info']->perlakuankembalian].'</span>';
		}
		if ($dataPenjualan['info']->kembali >= 0){
			$tablePrint .= '<tr><td colspan="3" style="font-size: 13px;font-weight: bold;text-align: center;"><span style="float: left">KEMBALI '.$viewperlakuankembalian.'</span><span style="float: right">'.number_format($dataPenjualan['info']->kembali,0,",",".").'&nbsp;&nbsp;</span></td></tr>';
		}
		$tablePrint .= '<tr><td colspan="3" style="font-size: 12px;text-align: center;border-top: 1px solid #000;">TERIMAKASIH</td></tr>';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 12px;text-align: center;">SILAHKAN DATANG KEMBALI</td></tr>';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 11px;text-align: center;border-top: 1px solid #000;">KRITIK/SARAN DAN PESAN ANTAR HUBUNGI</td></tr>';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 12px;text-align: center;font-weight: bold;"><span style="float: left"><img src="'.base_path().'misc/media/images/bbm.png" width="12" style="vertical-align:middle;">&nbsp;'.$dataPremis->bbm.'</span><span style="float: right"><img src="'.base_path().'misc/media/images/whatsapp.png" width="11" style="vertical-align:middle;">&nbsp;'.$dataPremis->whatsapp.'&nbsp;&nbsp;</span></td></tr>';
		$tablePrint .= '<tr><td colspan="3" style="font-size: 13px;text-align: center;border-bottom: 1px solid #000;">"ISLAM ITU INDAH"</td></tr>';
		$tablePrint .= '</tbody>';
		$tablePrint .= '</table>';
	}
	return $tablePrint;
}
function createDateRangeArray($strDateFrom,$strDateTo)
{
    $aryRange=array();
		$iDateFrom=mktime(1,0,0,substr($strDateFrom,5,2),     substr($strDateFrom,8,2),substr($strDateFrom,0,4));
    $iDateTo=mktime(1,0,0,substr($strDateTo,5,2),     substr($strDateTo,8,2),substr($strDateTo,0,4));

    if ($iDateTo>=$iDateFrom)
    {
        array_push($aryRange,date('Y-m-d',$iDateFrom)); // first entry
        while ($iDateFrom<$iDateTo)
        {
            $iDateFrom+=86400; // add 24 hours
            array_push($aryRange,date('Y-m-d',$iDateFrom));
        }
    }
    return $aryRange;
}
function createLogoImagePath(){
	$logoPath = base_path().file_directory_path().'/cti_flex_logo.png';
	drupal_add_js(
		array(
			'logo' => $logoPath,
		),
	'setting');
	return $logoPath;
}
function getTotalPenjualan($field_name = null, $tglAwal = null, $tglAkhir = null, $carabayar = 0, $idPelanggan = 0){
	if (!empty($field_name) && !empty($tglAwal) && !empty($tglAkhir)){
		$tglAwal = $tglAwal.' 00:00';
		$tglAkhir = $tglAkhir.' 23:59';
		if ($carabayar == 0){
			if (!empty($idPelanggan)){
				$totalPenjualan = db_result(db_query("SELECT SUM($field_name) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND '%s' AND idpelanggan=%d",$tglAwal,$tglAkhir, $idPelanggan));
			}else{
				$totalPenjualan = db_result(db_query("SELECT SUM($field_name) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND '%s'",$tglAwal,$tglAkhir));
			}
		}else if($carabayar == 1){
			//Untuk mendapatkan total cash saja
			if (empty($idPelanggan)){
				$strSQL = "SELECT SUM($field_name) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND '%s' AND carabayar='TUNAI' AND kembali >= 0";
				$totalPenjualanCash = db_result(db_query($strSQL,$tglAwal,$tglAkhir));
			}else{
				$strSQL = "SELECT SUM($field_name) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND '%s' AND carabayar='TUNAI' AND kembali >= 0 AND idpelanggan=%d";
				$totalPenjualanCash = db_result(db_query($strSQL,$tglAwal,$tglAkhir,$idPelanggan));
			}
			if (empty($idPelanggan)) {
				$strSQL = "SELECT SUM(bayar) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND ";
				$strSQL .= "'%s' AND ((carabayar='TUNAI' AND kembali < 0) OR (carabayar='HUTANG'))";
				$totalPenjualanDP = db_result(db_query($strSQL,$tglAwal,$tglAkhir));
			}else{
				$strSQL = "SELECT SUM(bayar) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND ";
				$strSQL .= "'%s' AND ((carabayar='TUNAI' AND kembali < 0) OR (carabayar='HUTANG')) AND idpelanggan = %d";
				$totalPenjualanDP = db_result(db_query($strSQL,$tglAwal,$tglAkhir,$idPelanggan));
			}
			$totalPenjualan = $totalPenjualanCash + $totalPenjualanDP;
		}else if($carabayar == 2){
			//Untuk mendapatkan total hutang dari penjualan
			if (empty($idPelanggan)) {
				$strSQL = "SELECT SUM(kembali) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND ";
				$strSQL .= "'%s' AND ((carabayar='TUNAI' AND kembali < 0) OR (carabayar='HUTANG'))";
				$totalPenjualan = db_result(db_query($strSQL,$tglAwal,$tglAkhir));
			}else{
				$strSQL = "SELECT SUM(kembali) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND ";
				$strSQL .= "'%s' AND ((carabayar='TUNAI' AND kembali < 0) OR (carabayar='HUTANG')) AND idpelanggan = %d";
				$totalPenjualan = db_result(db_query($strSQL,$tglAwal,$tglAkhir,$idPelanggan));
			}
		}else if($carabayar == 3){
			//Untuk mendapatkan total debit/giro saja
			if (empty($idPelanggan)) {
				$totalPenjualan = db_result(
					db_query(
						"SELECT SUM($field_name) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND '%s' AND carabayar IN ('DEBIT','GIRO')",
						$tglAwal,
						$tglAkhir
					)
				);
			}else{
				$totalPenjualan = db_result(
					db_query(
						"SELECT SUM($field_name) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND '%s' AND carabayar IN ('DEBIT','GIRO') AND idpelanggan=%d",
						$tglAwal,
						$tglAkhir,
						$idPelanggan
					)
				);
			}
		}else if($carabayar == 4){
			//Untuk mendapatkan total pembayaran menggunakan deposit
			if (empty($idPelanggan)) {
				$totalPenjualan = db_result(
					db_query(
						"SELECT SUM($field_name) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND '%s' AND carabayar = 'DEPOSIT'",
						$tglAwal,
						$tglAkhir
					)
				);
			}else{
				$totalPenjualan = db_result(
					db_query(
						"SELECT SUM($field_name) FROM penjualan WHERE tglpenjualan BETWEEN '%s' AND '%s' AND carabayar = 'DEPOSIT' AND idpelanggan=%d",
						$tglAwal,
						$tglAkhir,
						$idPelanggan
					)
				);
			}
		}
	}
	return $totalPenjualan;
}
function getTotalPenjualan2($field_name1 = null, $field_name2 = null, $tglAwal = null, $tglAkhir = null, $idSupplier = 0){
	if (!empty($field_name1) && !empty($field_name2) && !empty($tglAwal) && !empty($tglAkhir)){
		$tglAwal = $tglAwal.' 00:00';
		$tglAkhir = $tglAkhir.' 23:59';
		if (empty($idSupplier)) {
			$totalPenjualan = db_result(
				db_query(
					"SELECT SUM($field_name1*$field_name2) FROM detailpenjualan AS detail
					LEFT JOIN penjualan AS penj ON detail.idpenjualan = penj.idpenjualan
					WHERE penj.tglpenjualan BETWEEN '%s' AND '%s'",
					$tglAwal,
					$tglAkhir
				)
			);
		}else{
			$totalPenjualan = db_result(
				db_query(
					"SELECT SUM($field_name1*$field_name2) FROM detailpenjualan AS detail
					LEFT JOIN penjualan AS penj ON detail.idpenjualan = penj.idpenjualan
					LEFT JOIN product AS prod ON detail.idproduct = prod.idproduct
					WHERE penj.tglpenjualan BETWEEN '%s' AND '%s' AND prod.idsupplier=%d ",
					$tglAwal,
					$tglAkhir,
					$idSupplier
				)
			);
		}
	}
	return $totalPenjualan;
}
function getRandomString($length=22)
{
	$key = '';
	$keys = array_merge(range(0, 9));
	for ($i = 0; $i < $length; $i++) {
		mt_srand((double)microtime() * 10000000);
		$key .= $keys[array_rand($keys)];
	}
	return $key;
}
function createEAN13Code($number){
	$code = '899' . str_pad($number, 9, '0');
	$weightflag = true;
	$sum = 0;
	// Weight for a digit in the checksum is 3, 1, 3.. starting from the last digit.
	// loop backwards to make the loop length-agnostic. The same basic functionality
	// will work for codes of different lengths.
	for ($i = strlen($code) - 1; $i >= 0; $i--)
	{
		$sum += (int)$code[$i] * ($weightflag?3:1);
		$weightflag = !$weightflag;
	}
	$code .= (10 - ($sum % 10)) % 10;
	return $code;
}
function printCustomerOrderBarcode(){
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	$js_path = drupal_get_path('module','penjualan').'/js/direct.print.js';
	_addBarcodePlugins();
	drupal_add_js($js_path);
	$js_path = drupal_get_path('module','penjualan').'/js/order.barcode.js';
	drupal_add_js($js_path);
	$tablePrint = '';
	$nidorder = isset($_GET['idcustomerorder']) ? $_GET['idcustomerorder'] : null;
	if (!empty($nidorder)){
		$dataOrder = getCustomerOrder($nidorder);
		if (count($dataOrder)){
			$tablePrint = '<table style="width: 100px;border-collapse: collapse;" >';
			$tablePrint .= '<tbody>';
			$tablePrint .= '<tr><td id="'.$dataOrder['info']->nonota.'" class="barcode-place"></td></tr>';
			$tablePrint .= '<tr><td style="text-align: center;">'.$dataOrder['info']->namapelanggan.'</td></tr>';
			$tablePrint .= '</tbody>';
			$tablePrint .= '</table>';
		}
	}
	return $tablePrint;
}
function printProductBarcode(){
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	$js_path = drupal_get_path('module','penjualan').'/js/direct.print.js';
	_addBarcodePlugins();
	drupal_add_js($js_path);
	$js_path = drupal_get_path('module','penjualan').'/js/product.barcode.js';
	drupal_add_js($js_path);
	$tablePrint = '';
	$nidProduct = isset($_GET['idproduct']) ? $_GET['idproduct'] : null;
	$explodeNid = explode('__',$nidProduct);
	if (!empty($explodeNid) && count($explodeNid)){
		for ($i = 0;$i < count($explodeNid);$i++){
			$nidProduct = $explodeNid[$i];
			$dataProduct = getDataProduct($nidProduct);
			if (count($dataProduct)){
				if ($i == 0){
					$tablePrint .= '<table style="width: 186px;border-collapse: collapse;" >';
					$tablePrint .= '<tbody>';
				}else{
					$tablePrint .= '<table style="width: 186px;border-collapse: collapse;" class="pagebreak">';
					$tablePrint .= '<tbody>';
					$tablePrint .= '<tr><td style="font-size: 10px;">&nbsp;</td></tr>';
				}
				$tablePrint .= '<tr><td>';
				$tablePrint .= '<div id="'.$dataProduct['info']->barcode.'" class="barcode-place" align="center" style="width: 166px;"></div>';
				$tablePrint .= '<div class="small-font" align="center" style="width: 100%;">'.$dataProduct['info']->barcode.'</div>';
				$tablePrint .= '</td></tr>';
				$tablePrint .= '<tr class="standard-font"><td style="text-align: center;">'.$dataProduct['info']->namaproduct.'</td></tr>';
				$tablePrint .= '<tr class="small-font"><td style="text-align: center;"><span style="float: left;">&nbsp;&nbsp;&nbsp;'.$dataProduct['info']->alt_code.'</span><span style="float: right;">Rp. '.number_format($dataProduct['info']->hargajual,0,',','.').',-&nbsp;&nbsp;&nbsp;</span></td></tr>';
				$tablePrint .= '</tbody>';
				$tablePrint .= '</table>';
				$tablePrint .= '</div>';
			}
		}
	}
	return $tablePrint;
}
function printProductBarcodeWithLogo(){
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	$js_path = drupal_get_path('module','penjualan').'/js/direct.print.js';
	_addBarcodePlugins();
	drupal_add_js($js_path);
	$js_path = drupal_get_path('module','penjualan').'/js/productlogo.barcode.js';
	drupal_add_js($js_path);
	$tablePrint = '';
	$nidProduct = isset($_GET['idproductlogo']) ? $_GET['idproductlogo'] : null;
	$explodeNid = explode('__',$nidProduct);
	$pathLogo = createLogoImagePath();
	if (!empty($explodeNid) && count($explodeNid)){
		for ($i = 0;$i < count($explodeNid);$i++) {
			$nidProduct = $explodeNid[$i];
			$dataProduct = getDataProduct($nidProduct);
			if (count($dataProduct)) {
				if ($i == 0){
					$tablePrint .= '<table style="width: 190px;border-collapse: collapse;" >';
					$tablePrint .= '<tbody>';
				}else{
					$tablePrint .= '<table style="width: 190px;border-collapse: collapse;" class="pagebreak">';
					$tablePrint .= '<tbody>';
					$tablePrint .= '<tr><td colspan="2" style="font-size: 8px;">&nbsp;</td></tr>';
				}
				$tablePrint .= '<tr>';
				$tablePrint .= '<td rowspan="3" class="logo-place">';
				$tablePrint .= '<img height="68" src="' . $pathLogo . '" />';
				$tablePrint .= '</td>';
				$tablePrint .= '<td>';
				$tablePrint .= '<div id="' . $dataProduct['info']->barcode . '" class="barcode-place" align="center"></div>';
				$tablePrint .= '<div class="small-font" align="center" style="width: 100%;">' . $dataProduct['info']->barcode . '</div>';
				$tablePrint .= '</td></tr>';
				$tablePrint .= '<tr class="standard-font"><td align="center">' . $dataProduct['info']->namaproduct . '</td></tr>';
				$tablePrint .= '<tr class="small-font"><td align="center"><span>Rp. ' . number_format(
						$dataProduct['info']->hargajual,
						0,
						',',
						'.'
					) . '</span></td></tr>';
				$tablePrint .= '</tbody>';
				$tablePrint .= '</table>';
			}
		}
	}
	return $tablePrint;
}
function printProductBarcodeWithLogo2(){
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	$js_path = drupal_get_path('module','penjualan').'/js/direct.print.js';
	_addBarcodePlugins();
	drupal_add_js($js_path);
	$js_path = drupal_get_path('module','penjualan').'/js/productlogo.barcode.js';
	drupal_add_js($js_path);
	$tablePrint = '';
	$products = isset($_POST['selected-product-print']) ? $_POST['selected-product-print'] : null;
	$explodeProduct = explode('||',$products);
	$pathLogo = createLogoImagePath();
	if (!empty($explodeProduct) && count($explodeProduct)){
		$printPage = 0;
		for ($i = 0;$i < count($explodeProduct);$i++) {
			$productData = explode('__',$explodeProduct[$i]);
			$nidProduct = $productData[0];
			$totalPrint = $productData[1];
			$dataProduct = getDataProduct($nidProduct);
			if (count($dataProduct) && $totalPrint > 0) {
				for ($j = 0;$j < $totalPrint;$j++) {
					if ($printPage == 0) {
						$tablePrint .= '<table style="width: 190px;border-collapse: collapse;" >';
						$tablePrint .= '<tbody>';
					} else {
						$tablePrint .= '<table style="width: 190px;border-collapse: collapse;" class="pagebreak">';
						$tablePrint .= '<tbody>';
						$tablePrint .= '<tr><td colspan="2" style="font-size: 8px;">&nbsp;</td></tr>';
					}
					$tablePrint .= '<tr>';
					$tablePrint .= '<td rowspan="3" class="logo-place">';
					$tablePrint .= '<img height="68" src="' . $pathLogo . '" />';
					$tablePrint .= '</td>';
					$tablePrint .= '<td>';
					$tablePrint .= '<div id="' . $dataProduct['info']->barcode . '" class="barcode-place" align="center"></div>';
					$tablePrint .= '<div class="small-font" align="center" style="width: 100%;">' . $dataProduct['info']->barcode . '</div>';
					$tablePrint .= '</td></tr>';
					$tablePrint .= '<tr class="standard-font"><td align="center">' . $dataProduct['info']->namaproduct . '</td></tr>';
					$tablePrint .= '</tbody>';
					$tablePrint .= '</table>';
					$printPage++;
				}
			}
		}
	}
	return $tablePrint;
}
function printProductBarcodeWithLogo3(){
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	$js_path = drupal_get_path('module','penjualan').'/js/direct.print.js';
	_addBarcodePlugins();
	drupal_add_js($js_path);
	$js_path = drupal_get_path('module','penjualan').'/js/productlogo2.barcode.js';
	drupal_add_js($js_path);
	$tablePrint = '';
	$products = isset($_POST['selected-product-print']) ? $_POST['selected-product-print'] : null;
	$explodeProduct = explode('||',$products);
	$pathLogo = createLogoImagePath();
	if (!empty($explodeProduct) && count($explodeProduct)){
		$printPage = 0;
		for ($i = 0;$i < count($explodeProduct);$i++) {
			$productData = explode('__',$explodeProduct[$i]);
			$nidProduct = $productData[0];
			$totalPrint = $productData[1];
			$dataProduct = getDataProduct($nidProduct);
			if (count($dataProduct) && $totalPrint > 0) {
				for ($j = 0;$j < $totalPrint;$j++) {
					if ($printPage == 0) {
						$tablePrint .= '<table style="width: 190px;border-collapse: collapse;" >';
						$tablePrint .= '<tbody>';
					} else {
						$tablePrint .= '<table style="width: 190px;border-collapse: collapse;" class="pagebreak">';
						$tablePrint .= '<tbody>';
						$tablePrint .= '<tr><td style="font-size: 8px;">&nbsp;</td></tr>';
					}
					$tablePrint .= '<tr>';
					$tablePrint .= '<td>';
					$tablePrint .= '<div id="' . $dataProduct['info']->barcode . '" class="barcode-place" align="center"></div>';
					$tablePrint .= '<div class="standard-font" align="center" style="width: 100%;">' . strtoupper($dataProduct['info']->namaproduct) . '</div>';
					$tablePrint .= '</td></tr>';
					$tablePrint .= '</tbody>';
					$tablePrint .= '</table>';
					$printPage++;
				}
			}
		}
	}
	return $tablePrint;
}
function printCustomerOrderLogo(){
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	$js_path = drupal_get_path('module','penjualan').'/js/direct.print.js';
	_addBarcodePlugins();
	drupal_add_js($js_path);
	$js_path = drupal_get_path('module','penjualan').'/js/orderlogo.barcode.js';
	drupal_add_js($js_path);
	$tablePrint = '';
	$nidOrder = isset($_GET['idorderlogo']) ? $_GET['idorderlogo'] : null;
	$pathLogo = createLogoImagePath();
	if ($nidOrder > 0){
		$detailOrders = getDetailOrder($nidOrder);
		if (count($detailOrders)) {
			$counterData = 0;
			for ($i = 0;$i < count($detailOrders);$i++){
				$dataOrder = $detailOrders[$i];
				for ($j = 0;$j < (int)$dataOrder['outstanding'];$j++){
					if ($counterData == 0){
						$tablePrint .= '<table style="width: 190px;border-collapse: collapse;" >';
						$tablePrint .= '<tbody>';
					}else{
						$tablePrint .= '<table style="width: 190px;border-collapse: collapse;" class="pagebreak">';
						$tablePrint .= '<tbody>';
						$tablePrint .= '<tr><td colspan="2" style="font-size: 8px;">&nbsp;</td></tr>';
					}
					$tablePrint .= '<tr>';
					$tablePrint .= '<td rowspan="3" class="logo-place">';
					$tablePrint .= '<img height="68" src="' . $pathLogo . '" />';
					$tablePrint .= '</td>';
					$tablePrint .= '<td>';
					$tablePrint .= '<div id="' . $dataOrder['detailbarcode'] . '" class="barcode-place" align="center"></div>';
					$tablePrint .= '<div class="small-font" align="center" style="width: 100%;">' . $dataOrder['detailbarcode'] . '</div>';
					$tablePrint .= '</td></tr>';
					$tablePrint .= '<tr class="standard-font"><td align="center">' . $dataOrder['namapelanggan'] . '</td></tr>';
					$tablePrint .= '<tr class="small-font"><td align="center">' . $dataOrder['namaproduct'] . ' ['.($j + 1).']</td></tr>';
					$tablePrint .= '</tbody>';
					$tablePrint .= '</table>';
					$counterData++;
				}
			}
		}
	}
	return $tablePrint;
}
function printCustomerOrderBarcodeNew($totalPrint = 1){
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	$js_path = drupal_get_path('module','penjualan').'/js/direct.print.js';
	_addBarcodePlugins();
	drupal_add_js($js_path);
	$js_path = drupal_get_path('module','penjualan').'/js/orderlogo.barcode.js';
	drupal_add_js($js_path);
	$tablePrint = '';
	$nidOrder = isset($_GET['idorder']) ? $_GET['idorder'] : null;
	$pathLogo = createLogoImagePath();
	if ($nidOrder > 0){
		$detailOrders = getCustomerOrder($nidOrder);
		if (isset($detailOrders['info']) && count($detailOrders['info'])) {
			$dataOrder = $detailOrders['info'];
			for ($i = 0;$i < $totalPrint;$i++){
				if ($counterData == 0){
					$tablePrint .= '<table style="width: 190px;border-collapse: collapse;" >';
					$tablePrint .= '<tbody>';
				}else{
					$tablePrint .= '<table style="width: 190px;border-collapse: collapse;" class="pagebreak">';
					$tablePrint .= '<tbody>';
					$tablePrint .= '<tr><td colspan="2" style="font-size: 8px;">&nbsp;</td></tr>';
				}
				$tablePrint .= '<tr>';
				$tablePrint .= '<td rowspan="3" class="logo-place">';
				$tablePrint .= '<img height="68" src="' . $pathLogo . '" />';
				$tablePrint .= '</td>';
				$tablePrint .= '<td>';
				$tablePrint .= '<div id="' . $dataOrder->nonota . '" class="barcode-place" align="center"></div>';
				$tablePrint .= '<div class="small-font" align="center" style="width: 100%;">' . $dataOrder->nonota . '</div>';
				$tablePrint .= '</td></tr>';
				$tablePrint .= '<tr class="standard-font"><td align="center">' . $dataOrder->namapelanggan . '</td></tr>';
				$splitTgl = explode(' ',$dataOrder->tglorder);
				$tablePrint .= '<tr class="small-font"><td align="center"><span class="pull-left">'.$splitTgl[0].'</span><span class="pull-right">Rp. ' . number_format($dataOrder->total,0,',','.') . '</span></td></tr>';
				$tablePrint .= '</tbody>';
				$tablePrint .= '</table>';
			}
		}
	}
	return $tablePrint;
}
function getCustomerOrder($nidCustomerOrder = null){
	$dataCO = null;
	if (!empty($nidCustomerOrder)){
		$strSQL = 'SELECT custord.id, custord.nonota, custord.tglorder, custord.idpemakai, ';
		$strSQL .= 'custord.idpelanggan, custord.total, custord.totalmodal, custord.carabayar, ';
		$strSQL .= 'custord.bayar, custord.kembali, custord.nokartu, custord.keterangan, ';
		$strSQL .= 'custord.insert_date, custord.status_order, plg.namapelanggan FROM customer_order ';
		$strSQL .= 'custord LEFT JOIN pelanggan plg ON custord.idpelanggan = plg.idpelanggan ';
		$strSQL .= 'WHERE id=%d';
		$result = db_query($strSQL,$nidCustomerOrder);
		$dataCO['info'] = db_fetch_object($result);
		$dataCO['detail'] = getDetailCustomerOrder($nidCustomerOrder);
	}
	return $dataCO;
}
function getDetailOrder($nidCustomerOrder = null){
	$detailOrder = null;
	if (!empty($nidCustomerOrder)) {
		$dataCustomerOrder = getCustomerOrder($nidCustomerOrder);
		$strSQL = 'SELECT a.detailbarcode, a.jumlah, a.outstanding, b.namaproduct FROM detailcustomerorder a ';
		$strSQL .= 'LEFT JOIN product b ON a.idproduct = b.idproduct ';
		$strSQL .= 'WHERE a.idcustomerorder = %d';
		$result = db_query($strSQL,$nidCustomerOrder);
		$detailOrder = array();
		while ($data = db_fetch_object($result)){
			$detailOrder[] = array(
				'detailbarcode' => $data->detailbarcode,
				'namapelanggan' => $dataCustomerOrder['info']->namapelanggan,
				'namaproduct' => $data->namaproduct,
				'jumlah' => $data->jumlah,
				'outstanding' => $data->outstanding,
			);
		}
	}
	return $detailOrder;
}
function getDataProduct($nidProduct = null){
	$dataProduct = null;
	if (!empty($nidProduct)){
		$strSQL = 'SELECT idproduct, idsupplier, idkategori, idsubkategori, barcode, alt_code, ';
		$strSQL .= 'namaproduct, type_product, hargapokok, hargajual, margin, minstok, maxstok, ';
		$strSQL .= 'stok, satuan, berat, keterangan, lead_time, aturan_jam_kerja, ';
		$strSQL .= 'berlaku_sebelum_zuhur ';
		$strSQL .= 'FROM product WHERE idproduct=%d';
		$result = db_query($strSQL,$nidProduct);
		$dataProduct['info'] = db_fetch_object($result);
	}
	return $dataProduct;
}
function getDetailCustomerOrder($nidCustomerOrder = null){
	$detailOrder = null;
	if (!empty($nidCustomerOrder)){
		$strSQL = 'SELECT id, idcustomerorder, idproduct, detailbarcode, jumlah, hargapokok, hargajual, ';
		$strSQL .= 'diskon, status_order, sisa, diambil, masuk, perkiraan_ambil FROM detailcustomerorder ';
		$strSQL .= 'WHERE idcustomerorder=%d';
		$result = db_query($strSQL,$nidCustomerOrder);
		$detailOrder = array();
		while ($data = db_fetch_object($result)){
			$detailOrder[] = $data;
		}
	}
	return $detailOrder;
}
function getPremisInformation(){
	$dataPremis = null;
	if (module_exists('datapremis')){
		$dataPremis = get_data_premis();
	}else{
		$dataPremis = new stdClass();
		
		$dataPremis->nama = 'GALERI IKHWAN';
		$dataPremis->bbm = '335B75B5';
		$dataPremis->telepon = '+6281280046437';
		$dataPremis->whatsapp = '+6281280046437';
		$dataPremis->alamat = 'CIBINONG CITY MALL,lt. UG No. C3A';
		$dataPremis->alamat .= "\n";
		$dataPremis->alamat .= 'CIBINONG - BOGOR';
		$dataPremis->email = 'galeriikhwan@gmail.com';
		$dataPremis->website = 'galeriikhwan.ikhwanit.com';
		/* untuk Ikhwan Mart 
		$dataPremis->nama = 'IKHWAN MART';
		$dataPremis->bbm = '5FA325FA';
		$dataPremis->telepon = '+6287873134847';
		$dataPremis->whatsapp = '+6287873134847';
		$dataPremis->alamat = 'PLAZA VICTORIA,BLOK G No.3';
		$dataPremis->alamat .= "\n";
		$dataPremis->alamat .= 'SENTUL CITY - BOGOR 16810';
		$dataPremis->email = 'ikhwanmart@gmail.com';
		$dataPremis->website = 'ikhwanmart.ikhwanit.com';
		*/	
	}
	return $dataPremis;
}
function cekPrinterCommand(){
	$printOut = '';
	if (isset($_GET['nidlaundry'])){
		$printOut = printOutLaundry();
	}else if (isset($_GET['idpenjualan'])){
		$printOut = printOutPenjualan();
	}else if (isset($_GET['idcustomerorder'])){
		$printOut = printCustomerOrderBarcode();
	}else if (isset($_GET['idproduct'])){
		$printOut = printProductBarcode();
	}else if (isset($_GET['idproductlogo'])){
		$printOut = printProductBarcodeWithLogo();
	}else if (isset($_GET['idorderlogo'])) {
		$printOut = printCustomerOrderLogo();
	}else if (isset($_GET['idorder'])){
		$totalPrint = 1;
		if (isset($_GET['totalprint'])){
 			$totalPrint = $_GET['totalprint'];
		}
		$printOut = printCustomerOrderBarcodeNew($totalPrint);
	}else if (isset($_POST['selected-product-print'])){
		if (isset($_POST['sticker-type']) && $_POST['sticker-type'] == 0){
			$printOut = printProductBarcodeWithLogo2();
		}else if(isset($_POST['sticker-type']) && $_POST['sticker-type'] == 1){
			$printOut = printProductBarcodeWithLogo3();
		}else{
			$printOut = printProductBarcodeWithLogo2();
		}
	}
	return $printOut;
}