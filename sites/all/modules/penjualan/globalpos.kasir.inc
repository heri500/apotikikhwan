<?php

function penjualan($idtitipanlaundry = null, $alamatasal = null){
	$path = drupal_get_path('theme', 'cti_flex');
 	$form_style = $path.'/css/custom-style.css';
	$logoPath = base_path().file_directory_path().'/cti_flex_logo.png';
	drupal_add_css($form_style, 'theme', 'all', FALSE);
 	$variables['styles'] = drupal_get_css();
	drupal_add_css('misc/media/datatables/css/demo_table_jui.css');
	drupal_add_css('misc/media/themes/jquery-ui-1.8.11.custom.css');
	drupal_add_css('misc/media/css/validationEngine.jquery.css');
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	drupal_add_js('misc/media/jqClock.min.js');
	drupal_add_js('misc/media/jquery.validationEngine-en.js');
	drupal_add_js('misc/media/jquery.validationEngine.js');
	drupal_add_js('misc/media/jquery-ui-1.8.11.custom.min.js');
	drupal_add_js('misc/media/datatables/js/jquery.dataTables.min.js');
	drupal_add_js('misc/media/datatables/js/dataTables.addtr.js');
	drupal_add_js('misc/media/datatables/js/number.format.js');
	drupal_add_js('misc/media/jquery.autotab-1.1b.js');
	_addChosenJqueryPlugins();
	$idPelanggan = 0;
	if (!empty($idtitipanlaundry)){
		if (empty($alamatasal)){
			$alamatasal = 'viewlaundry';
		}
		drupal_add_js(
			array(
				'idtitipanlaundry' => $idtitipanlaundry,
				'alamatasal' => $alamatasal,
			), 
		'setting');
		if ($alamatasal == 'viewlaundry' || $alamatasal == 'laundrykeluar'){
			$titipanlaundry = db_fetch_array(db_query("SELECT idtitipanlaundry, nonota, tglpenjualan, idpemakai,
			idpelanggan, total, totalmodal, carabayar, bayar, kembali, nokartu, keterangan, insert_date, status_laundry,
			users.name,laundry.nomer_rak FROM titipanlaundry laundry LEFT JOIN cms_users users ON laundry.idpemakai = users.uid
			WHERE idtitipanlaundry=%d",$idtitipanlaundry));
			if (count($titipanlaundry)){
				$tgllaundry = explode(' ', $titipanlaundry['tglpenjualan']);
				$splittgllaundry = explode('-',$tgllaundry[0]);
				$tglTampilLaundry = $splittgllaundry[2].'-'.$splittgllaundry[1].'-'.$splittgllaundry[0];
				$idPelanggan = $titipanlaundry['idpelanggan'];
				$kasirlaundry = $titipanlaundry['name'];
				$nomerRak = $titipanlaundry['nomer_rak'];
				$labelKasir = 'LAUNDRY';
				$labelTgl = 'MASUK';
			}
		}else if($alamatasal == 'viewcustomerorder' || $alamatasal == 'orderkeluar'){
			$titipanlaundry = db_fetch_array(db_query("SELECT id, nonota, tglorder, idpemakai,
			idpelanggan, total, totalmodal, carabayar, bayar, kembali, nokartu, keterangan, insert_date, status_order,
			users.name FROM customer_order custord LEFT JOIN cms_users users ON custord.idpemakai = users.uid
			WHERE id=%d",$idtitipanlaundry));
			if (count($titipanlaundry)){
				$tgllaundry = explode(' ', $titipanlaundry['tglorder']);
				$splittgllaundry = explode('-',$tgllaundry[0]);
				$tglTampilLaundry = $splittgllaundry[2].'-'.$splittgllaundry[1].'-'.$splittgllaundry[0];
				$idPelanggan = $titipanlaundry['idpelanggan'];
				$kasirlaundry = $titipanlaundry['name'];
				$labelKasir = 'ORDER';
				$labelTgl = 'ORDER';
			}
		}
	}
	$uploadData = false;
	if (isset($_GET['afterinsert']) && $_GET['afterinsert']){
		$uploadData = true;
	}
	$tglsekarang = date("Y-m-d");
	$tgltampil = date("d-m-Y");
	drupal_add_js(
		array(
			'tglsekarang' => $tglsekarang,
			'tgltampil' => $tgltampil,
			'logo' => $logoPath,
			'upload_data' => $uploadData,
		), 
	'setting');
	$js_path = drupal_get_path('module','penjualan').'/js/kasir.form.new.js';
	drupal_add_js($js_path);
	if (isset($_GET['tanggal'])){
		$tanggal = $_GET['tanggal'];
		$tanggal = date('d-m-Y', strtotime($tanggal));
		$tanggalkirim = date('Y-m-d', strtotime($tanggal));
	}else{
		$tanggal = date('d-m-Y');
		$tanggalkirim = date('Y-m-d');
	}
	$panduantombol = '<a style="font-weight: bold;text-align: center;font-size:12px;margin:0;padding: .4em .3em;">Ctrl+Shift+</a>';
	$tombolcari = '<a id="tombolubahharga" class="cari" onclick="ubahharga()">F2:UBAH HARGA</a>';
	$tombolqty = '<a id="tombolubahqty" onclick="ubahqty()" class="buttonqty">F3:UBAH QTY</a>';
	$tombolhapus = '<a class="buttonhapus" onclick="hapus_latest_produk()">F4:HAPUS ITEM</a>';
	$tombolselesai = '<a class="buttonselesai" onclick="kirim_data(1)">F5:BAYAR&PRINT</a>';
	$tombolprint = '<a class="buttonprint" onclick="kirim_data(0)">F6:BAYAR</a>';
	//$tomboltutupkasir = '<a class="buttontutup">F7:TUTUP KASIR</a>';
	$tombollihatomset = '<a class="buttonomset" onclick="hitung_omset();">F8:OMSET</a>';
	$tombollihatpelanggan = '<a class="buttonpelanggan" onclick="pilih_pelanggan();">F9:PELANGGAN</a>';
	$penjualan = '<button onclick="munculkankasir();" style="font-size:12px;border: 1px solid orangered;">Klik untuk memunculkan kasir</button>';
	$penjualan .= '<div id="dialogkasir" style="font-size: 12px;" title="GLOBAL POS KASIR ['.$tanggal.']">';
	$penjualan .= '<div id="info-kasir-waktu">';
	$penjualan .= '<div id="tempattanggalkasir">';
	$penjualan .= '<div id="tempattanggal">';
	$penjualan .= '<label>TANGGAL</label><input readonly="readonly" type="text" id="tgljual" name="tgljual" value="'.$tanggal.'">';
	$penjualan .= '<input type="hidden" id="tgljualkirim" name="tgljualkirim" value="'.$tanggalkirim.'">';
	$penjualan .= '</div>';
	$penjualan .= '<div id="tempatnamakasir">';
	global $user;
	$penjualan .= '<label>KASIR</label><input readonly="readonly" type="text" id="kasir" name="kasir" value="'.$user->name.'">';
	$penjualan .= '</div>';
	if (!empty($idtitipanlaundry)){
		$penjualan .= '<div id="tempattanggal">';
		$penjualan .= '<label>KASIR '.$labelKasir.'</label><input readonly="readonly" type="text" id="kasir" name="kasir" value="'.$kasirlaundry.'">';
		$penjualan .= '</div>';
	}
	$penjualan .= '</div>';
	$penjualan .= '<div id="tempatjam" align="center">';
	$penjualan .= 'Jam';
	$penjualan .= '</div>';
	$penjualan .= '<div id="tempatkosong">';
	$penjualan .= '<div id="tempatsupplier"><label>PELANGGAN</label></div>';
	$penjualan .= '<div id="tempatsupplier2">'.createPelangganSelection($_GET['idpelanggan']).'</div>';
	if (!empty($idtitipanlaundry)){
		$penjualan .= '<div id="tempatsupplier"><label>TGL '.$labelTgl.'</label><input readonly="readonly" type="text" id="tglmasuk" name="tglmasuk" value="'.$tglTampilLaundry.'">';
		$penjualan .= '</div>';
	}
	$penjualan .= '</div>';
	$penjualan .= '</div>';
	$penjualan .= '<div id="barcode_place">SCAN ATAU INPUT BARCODE, KODE ATAU NAMA PRODUK : <input type="text" id="barcode" name="barcode" class="barcodekasir"></div>';
	$tablekasir = view_kasir($idtitipanlaundry,$alamatasal);
	$penjualan .= '<div id="tempattabelkasir">'.$tablekasir.'</div>';
	$penjualan .= '<input type="hidden" id="last_id" name="last_id">';
	$penjualan .= '<input type="hidden" id="lastqty" name="lastqty" value="1">';
	$penjualan .= '<input type="hidden" id="lastharga" name="lastharga">';
	$penjualan .= '<input type="hidden" id="lastdiskon" name="lastdiskon">';
	$penjualan .= '<input type="hidden" id="nilaikirim" name="nilaikirim">';
	//$penjualan .= '<div id="tempattombolkasir">';
	if ($nomerRak != ''){
		$penjualan .= '<div id="tempattombolkasir" style="height:330px;">';
		$penjualan .= '<a style="padding: 0.4em 0.3em;margin-top: 2px;margin-bottom: 4px;" class="buttonprint" onclick="preventDefault();">NO.RAK : '.$nomerRak.'</a>';
	}else{
		$penjualan .= '<div id="tempattombolkasir">';
	}
	$penjualan .= $panduantombol;
	$penjualan .= $tombolcari;
	$penjualan .= $tombolqty;
	$penjualan .= $tombolhapus;
	$penjualan .= $tombolselesai;
	$penjualan .= $tombolprint;
	//$penjualan .= $tombolprint;
	//$penjualan .= $tomboltutupkasir;
	$penjualan .= $tombollihatomset;
	$penjualan .= $tombollihatpelanggan;
	$penjualan .= '</div>';
    $penjualan .= '<div id="tempattotal"><div id="totalbelanja">Total Transaksi : Rp. 0</div></div>';
	$penjualan .= '</div>';
	$penjualan .= '<div title="Informasi" id="dialogwarning">';
	$penjualan .= '<p id="pesantext">Produk yang dicari tidak ada, Silahkan masukkan Barcode/Kode Produk/Nama Produk yang lain...!!!</p>';
	$penjualan .= '<p style="text-align: center"><button id="tutupdialog" class="buttonwarning" onclick="tutupwarning();">CLOSE</button></p>';
	$penjualan .= '</div>';
	$penjualan .= '<div title="UBAH HARGA" id="dialogubahharga">';
	$penjualan .= '<label>Harga Baru : </label><input type="text" id="newharga" name="newharga" value="1">';
	$penjualan .= '</div>';
	$penjualan .= '<div title="UBAH QTY" id="dialogubahqty">';
	$penjualan .= '<label>Qty Baru : </label><input type="text" id="newqty" name="newqty" value="1">';
	$penjualan .= '</div>';
	$penjualan .= '<div title="UBAH QTY" id="dialogubahqty2">';
	$penjualan .= '<label>Qty Baru : </label><input type="text" id="newqty2" name="newqty2">';
	$penjualan .= '</div>';
	$penjualan .= '<div title="PEMBAYARAN" id="dialogbayar">';
	$carabayar = '<select id="carabayar" name="carabayar">';
	$result = db_query("SELECT carabayar FROM carabayar");
	$i = 0;
	while($data = db_fetch_object($result)){
		if ($i == 0){
			$carabayar .= '<option selected="selected" value="'.$data->carabayar.'">'.$data->carabayar.'</option>';	
		}else{
			$carabayar .= '<option value="'.$data->carabayar.'">'.$data->carabayar.'</option>';	
		}
		$i++;
	}
	$carabayar .= '</select>';
	$perlakuankembalian = '<select id="kembalian" name="kembalian">';
	$arrayPerlakuan = PERLAKUAN_KEMBALIAN();
	for ($i = 0;$i < count($arrayPerlakuan);$i++){
		if ($i == 0){
			$perlakuankembalian .= '<option value="'.$i.'" selected>'.$arrayPerlakuan[$i].'</option>';
		}else{
			$perlakuankembalian .= '<option value="'.$i.'">'.$arrayPerlakuan[$i].'</option>';
		}
	}
	$perlakuankembalian .= '</select>';
	//Pelanggan
	/*$pelanggan = '<select id="idpelanggan" name="idpelanggan">';
	$result = db_query("SELECT idpelanggan,namapelanggan FROM pelanggan");
	$i = 0;
	while($data = db_fetch_object($result)){
		if ($i == 0){
			$pelanggan .= '<option selected="selected" value="'.$data->idpelanggan.'">'.$data->namapelanggan.'</option>';	
		}else{
			$pelanggan .= '<option value="'.$data->idpelanggan.'">'.$data->namapelanggan.'</option>';	
		}
		$i++;
	}
	$pelanggan .= '</select>';*/
	$nilaibayar = '<input type="text" id="nilaibayar" name="nilaibayar">';
	$depositpelanggan = '<input type="text" id="depositpelanggan" name="depositpelanggan" readonly="readonly">';
	$nokartudebit = '<input type="text" id="nomerkartu" name="nomerkartu">';
	$kembali = '<input readonly="readonly" type="text" id="kembali" name="kembali">';
	$totalbelanja = '<input type="text" id="totalbelanjauser" name="totalbelanjauser">';
	//$penjualan .= '<div class="barisbayar"><label>Pelanggan</label>'.$pelanggan.'</div>';
	$penjualan .= '<div class="barisbayar"><label>Total Belanja</label>'.$totalbelanja.'</div>';
	$penjualan .= '<div class="barisbayar"><label>Cara Bayar</label>'.$carabayar.'</div>';
	$penjualan .= '<div id="field_no_kartu" class="barisbayar" style="display: none;"><label>No. Kartu/Giro</label>'.$nokartudebit.'</div>';
	$penjualan .= '<div class="barisbayar"><label id="label-deposit">Deposit</label>'.$depositpelanggan.'</div>';
	$penjualan .= '<div class="barisbayar"><label>Pembayaran</label>'.$nilaibayar.'</div>';
	$penjualan .= '<div id="field_kembali" class="barisbayar"><label>Kembali</label>'.$kembali.'</div>';
	$penjualan .= '<div id="field_kembalian" class="barisbayar" style="display: none;"><label>Kembalian</label>'.$perlakuankembalian.'</div>';
	$penjualan .= '</div>';
	return $penjualan;
}

function simpan_penjualan(){
	//nonota, idpemakai, total, bayar, kembali
	if ($_POST["detail_produk"] AND $_POST["bayar"] >= 0 AND $_POST["totalbelanja"]){
		global $user;
		//date_default_timezone_set('Asia/Jakarta');
		$waktujual = $_POST["tgljual"]." ".date("H:i:s");
		$splitTanggal = explode('-', $_POST["tgljual"]);
		$splitJam = explode(':',date("H:i:s"));
		$intTanggal = mktime($splitJam[0],$splitJam[1],$splitJam[2],$splitTanggal[1],$splitTanggal[2],$splitTanggal[0]);
		$result = db_query("SELECT idpenjualan FROM penjualan ORDER BY idpenjualan DESC LIMIT 1");
		$data = db_fetch_object($result);
		if ($data->idpenjualan > 0){
			$next_id = $data->idpenjualan + 1;
		}else{
			$next_id = 1;
		}
		$no_nota = buat_nota($next_id);
		$kembali = $_POST["bayar"] - $_POST["totalbelanja"];
		$perkuankembalian = isset($_POST["perlakuankembalian"]) ? $_POST["perlakuankembalian"] : 0;
		$idtitipanlaundry = 0;
		if (isset($_POST['idtitipanlaundry']) && !empty($_POST['idtitipanlaundry'])){
			$idtitipanlaundry = $_POST['idtitipanlaundry'];
		}
		db_query("INSERT INTO penjualan (nonota, idpemakai, total, bayar, kembali, tglpenjualan, idpelanggan, carabayar, idtitipanlaundry, perlakuankembalian) 
		VALUES ('%s', '%d', '%f', '%f', '%f', '%s', '%d', '%s', '%d', '%d')",
		$no_nota, $user->uid, $_POST["totalbelanja"], $_POST["bayar"], $kembali, $waktujual,
		$_POST["idpelanggan"],$_POST["carabayar"], $idtitipanlaundry,$perkuankembalian);
		$next_id = db_last_insert_id('penjualan', 'idpenjualan');
		print $next_id;
		if ($kembali > 0 && $perkuankembalian == 2){
			if (isset($_POST["idpelanggan"]) && !empty($_POST["idpelanggan"])){
				$variables['idpelanggan'] = $_POST["idpelanggan"];
				$variables['hutang'] = getTotalHutang($_POST["idpelanggan"]);
				$variables['pembayaran'] = $kembali;
				$variables['tglbayar'] = $waktujual;
				$variables['idpenjualan'] = $next_id;
				$variables['idtitipanlaundry'] = $idtitipanlaundry;
				$variables['keterangan'] = 'Deposit Uang Dari Kembalian Nota Penjualan : '.$no_nota.' Tanggal : '.$waktujual;
				pembayaranhutang($variables);	
			}
		}else if ($kembali < 0){
			db_query("INSERT INTO detailpiutang (idpelanggan, idpenjualan, besarhutang) VALUES ('%d','%d','%f')",
			$_POST["idpelanggan"],$next_id,abs($kembali));
			$resultpiutang = db_query("SELECT idpelanggan, besarhutang  FROM piutang WHERE idpelanggan='%d'",
			$_POST["idpelanggan"]);
			$datapiutang = db_fetch_object($resultpiutang);
			if ($datapiutang->idpelanggan){
				$besarhutangskrg = $datapiutang->besarhutang + abs($kembali);
				db_query("UPDATE piutang SET besarhutang='%f',uid='%d' WHERE idpelanggan='%d'",
				$besarhutangskrg,$user->uid,$_POST["idpelanggan"]);
			}else{
				db_query("INSERT INTO piutang(idpelanggan,besarhutang,uid)VALUES('%d','%f','%d')",
				$_POST["idpelanggan"],abs($kembali),$user->uid);	
			}
		}
		if ($_POST["carabayar"] == "DEPOSIT"){
			if (isset($_POST["idpelanggan"]) && !empty($_POST["idpelanggan"])){
				$sisaDeposit = getTotalPembayaran($_POST["idpelanggan"]) - (getTotalHutang($_POST["idpelanggan"]) + getTotalPenggunaanDeposit($_POST["idpelanggan"]));
				$variables['idpelanggan'] = $_POST["idpelanggan"];
				$variables['deposit'] = $sisaDeposit;
				$variables['penggunaan'] = $_POST["bayar"];
				$variables['tglbayar'] = $waktujual;
				$variables['keterangan'] = 'Penggunaan deposit untuk pembayaran nota : '.$no_nota.' Tanggal : '.$waktujual;
				$variables['idpenjualan'] = $next_id;
				penggunaandeposit($variables);
				syncHutangPelanggan($_POST["idpelanggan"]);
			}
		}
		$detailTitipanLaundry = null;
		if (isset($_POST['idtitipanlaundry']) && !empty($_POST['idtitipanlaundry'])){
			$result = db_query("SELECT iddetail, idproduct, sisa, diambil FROM 
			detaillaundry WHERE idtitipanlaundry='%d' AND sisa > 0",$_POST['idtitipanlaundry']);
			while ($data = db_fetch_object($result)){
				$detailTitipanLaundry[$data->idproduct] = $data;
			}
		}else if (isset($_POST['idcustomerorder']) && !empty($_POST['idcustomerorder'])){
			$result = db_query("SELECT id, idproduct, sisa, diambil FROM
			detailcustomerorder WHERE idcustomerorder='%d' AND sisa > 0",$_POST['idcustomerorder']);
			while ($data = db_fetch_object($result)){
				$detailCustomerOrder[$data->idproduct] = $data;
			}
		}
		$pecahdetail = explode("&",$_POST["detail_produk"]);
		$totalmodal = 0;
		foreach ($pecahdetail as $parameter){
			$pecahparameter = explode("=",$parameter);
			$pecahnilai = explode("___",$pecahparameter[1]);
			$IDPRODUK =	$pecahnilai[0];
			$QTY = $pecahnilai[1];
			$HARGAJUAL = $pecahnilai[2];
			$DISKON = $pecahnilai[3];
			$result = db_query("SELECT type_product, hargapokok,stok FROM product WHERE idproduct='%d'",$IDPRODUK);	
			$data = db_fetch_object($result);
			$HARGAPOKOK = $data->hargapokok;
			$totalmodal = $totalmodal + ($HARGAPOKOK*$QTY);
			$STOKSEBELUM = $data->stok;
			db_query("INSERT INTO detailpenjualan(idpenjualan, idproduct, jumlah, hargapokok, hargajual, diskon) VALUES
			('%d', '%d', '%f', '%f', '%f', '%f')",
			$next_id,$IDPRODUK,$QTY,$HARGAPOKOK,$HARGAJUAL,$DISKON);
			if ($data->type_product == 0){
				$STOKSEKARANG = $STOKSEBELUM - $QTY;
				db_query("UPDATE product SET stok='%f' WHERE idproduct='%d'",$STOKSEKARANG,$IDPRODUK);
				$KETERANGAN = 'Penjualan';
				db_query("INSERT INTO transaksistock (idproduk, idpenjualan, stocksebelum, keluar, stocksetelah, keterangan) VALUES 
				('%d', '%d', '%f', '%f', '%f', '%s')",$IDPRODUK,$next_id,$STOKSEBELUM,$QTY,$STOKSEKARANG,$KETERANGAN);
			}
			if (!empty($detailTitipanLaundry) && isset($detailTitipanLaundry[$IDPRODUK])){
				if ($detailTitipanLaundry[$IDPRODUK]->sisa - $QTY <= 0){
					$statusDetail = 2;
				}else{
					$statusDetail = 1;
				}
				$strSQL = "UPDATE detaillaundry SET sisa = sisa - %f, diambil = %d, status_laundry = %d WHERE iddetail = %d";	
				db_query($strSQL, $QTY, $intTanggal, $statusDetail, $detailTitipanLaundry[$IDPRODUK]->iddetail);
			}else if(!empty($detailCustomerOrder) && isset($detailCustomerOrder[$IDPRODUK])){
				if ($detailCustomerOrder[$IDPRODUK]->sisa - $QTY <= 0){
					$statusDetail = 2;
				}else{
					$statusDetail = 1;
				}
				$strSQL = "UPDATE detailcustomerorder SET sisa = sisa - %f, diambil = %d, status_order = %d WHERE id = %d";
				db_query($strSQL, $QTY, $intTanggal, $statusDetail, $detailCustomerOrder[$IDPRODUK]->id);
			}
		}
		if (isset($_POST['idtitipanlaundry']) && !empty($_POST['idtitipanlaundry'])){
			$totalLaundry = db_result(db_query("SELECT COUNT(*) FROM detaillaundry WHERE idtitipanlaundry='%d'",$_POST['idtitipanlaundry']));
			$totalSelesai = db_result(db_query("SELECT COUNT(*) FROM detaillaundry WHERE idtitipanlaundry='%d' AND status_laundry=2",$_POST['idtitipanlaundry']));
			if ($totalSelesai > 0 && $totalSelesai == $totalLaundry){
				$statusLaundry = 2;	
			}else if($totalSelesai > 0 && $totalSelesai < $totalLaundry){
				$statusLaundry = 1;	
			}else{
				$statusLaundry = 0;	
			}
			$strSQL = "UPDATE titipanlaundry SET status_laundry=%d WHERE idtitipanlaundry=%d";
			db_query($strSQL, $statusLaundry, $_POST['idtitipanlaundry']);
		}else if(isset($_POST['idcustomerorder']) && !empty($_POST['idcustomerorder'])){
			$totalOrder = db_result(db_query("SELECT COUNT(*) FROM detailcustomerorder WHERE idcustomerorder='%d'",$_POST['idcustomerorder']));
			$totalSelesai = db_result(db_query("SELECT COUNT(*) FROM detailcustomerorder WHERE idcustomerorder='%d' AND status_order=2",$_POST['idcustomerorder']));
			if ($totalSelesai > 0 && $totalSelesai == $totalOrder){
				$statusOrder = 2;
			}else if($totalSelesai > 0 && $totalSelesai < $totalOrder){
				$statusOrder = 1;
			}else{
				$statusOrder = 0;
			}
			$strSQL = "UPDATE customer_order SET status_order=%d WHERE id=%d";
			db_query($strSQL, $statusOrder, $_POST['idcustomerorder']);
		}
		db_query("UPDATE penjualan SET totalmodal='%f' WHERE idpenjualan='%d'",$totalmodal,$next_id);
		/*if (function_exists('is_connected') && is_connected()){
			if (function_exists('do_upload_premisdata')){
				do_upload_premisdata();
			}
		}*/
	}else{
		print 'error';	
	}
	exit();
}
function buat_nota($idpenjualan){
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
function hitung_omset($tgl = null){
	if ($_POST["tglpost"]){
		$tglomset = $_POST["tglpost"];
	}else{
		if (is_null($tgl)){
			$tglomset = date("Y-m-d");
		}else{
			$tglomset = $tgl;
		}
	}
	$result = db_query("SELECT SUM(total) AS totalbelanja FROM penjualan WHERE SUBSTR(tglpenjualan,1,10)='%s'",$tglomset);
	$data = db_fetch_object($result);
	if ($_POST["tglpost"]){
		print $data->totalbelanja;
		exit();
	}else{
		return $data->totalbelanja;
	}
}
function cari_produk(){
	if ($_POST["katacari"]){
		$KATACARI = '%'.$_POST["katacari"].'%';
		//$sql = "SELECT idproduct,idkategori,namaproduct,hargajual FROM product WHERE alt_code LIKE '$KATACARI' OR barcode LIKE '$KATACARI' OR namaproduct LIKE '$KATACARI'";
		$result = db_query("SELECT idproduct,idkategori,namaproduct,hargajual,lead_time,aturan_jam_kerja,
		berlaku_sebelum_zuhur FROM product WHERE (alt_code LIKE '%s' OR barcode LIKE '%s' 
		OR UPPER(namaproduct) LIKE '%s') AND status_product = 1 LIMIT 50",$KATACARI,$KATACARI,$KATACARI);
		$data = db_fetch_object($result);
		if ($data->idproduct){
			$result2 = db_query("SELECT besardiskon FROM diskonkategori WHERE idpelanggan='%d' AND idkategori='%d'",
			$_POST["idpelanggan"],$data->idkategori);
			$datadiskon = db_fetch_object($result2);
			if ($datadiskon->besardiskon >=0 ){
				$DISKON = $datadiskon->besardiskon;
			}else{
				$DISKON = 0;
			}
			if ($_POST["idpelanggan"] == 0){
				$DISKON = 0;
			}
			$takeTime = calculateTakeTime($data->lead_time, $_POST["waktumasuk"],$data->aturan_jam_kerja,$data->berlaku_sebelum_zuhur);
			print $data->idproduct.';'.$data->namaproduct.';'.$data->hargajual.';'.$DISKON.';'.$takeTime[0].';'.$takeTime[1];
		}else{
			print "error";
		}
	}
	exit();	
}
function cari_barang(){
	if ($_GET["term"]){
		$KATACARI = '%'.$_GET["term"].'%';
		$result = db_query("SELECT barcode, alt_code, namaproduct, stok, hargajual FROM product WHERE (alt_code LIKE '%s' OR barcode LIKE '%s' OR UPPER(namaproduct) LIKE '%s') AND status_product=1 LIMIT 50",$KATACARI,$KATACARI,$KATACARI);
		$items = array();
		while ($data = db_fetch_object($result)){
			$items[] = array('value' => $data->namaproduct.'--->[Rp. '.number_format($data->hargajual,0,',','.').']['.$data->stok.']','barcode' => $data->barcode,'alt_code' => $data->alt_code);
		}
		print json_encode($items);
	}
	exit();	
}
function view_kasir($idtitipanlaundry = null, $alamatasal = null){
	$kasirtabel ='<table cellpadding="0" cellspacing="0" border="0" class="display" id="tabel_kasir">';
	$kasirtabel .= '<thead>';
	$kasirtabel .= '<tr>';
	$kasirtabel .= '<th class="tablebutton"></th>';
	$kasirtabel .= '<th class="tablebutton"></th>';
	$kasirtabel .= '<th>PRODUK</th>';
	$kasirtabel .= '<th>HARGA</th>';
	$kasirtabel .= '<th class="diskon2">%</th>';
	$kasirtabel .= '<th class="diskon2">QTY</th>';
	$kasirtabel .= '<th class="subtotal">SUBTOTAL</th>';
	$kasirtabel .= '</tr>';
	$kasirtabel .= '</thead>';
	$kasirtabel .= '<tbody>';
	if (!empty($idtitipanlaundry)){
		if (empty($alamatasal) || $alamatasal == 'viewlaundry' || $alamatasal == 'laundrykeluar'){
			$result = db_query("SELECT b.iddetail, b.idproduct, b.iddetail,c.barcode, c.namaproduct, b.jumlah,
			b.hargajual, (b.hargajual*b.jumlah) AS subtotal, sisa, diambil FROM
			detaillaundry b LEFT JOIN product c ON b.idproduct=c.idproduct LEFT JOIN
			supplier a ON c.idsupplier=a.idsupplier WHERE b.idtitipanlaundry='%d' AND sisa > 0",$idtitipanlaundry);
			$dataLaundry = array();
			while ($data = db_fetch_object($result)){
				$dataLaundry[] = $data;
			}
			drupal_add_js(
				array(
					'data_laundry' => $dataLaundry,
				),
				'setting');
		}else if ($alamatasal == 'viewcustomerorder' || $alamatasal == 'orderkeluar'){
			$result = db_query("SELECT b.id, b.idproduct, c.barcode, c.namaproduct, b.jumlah,
			b.hargajual, (b.hargajual*b.jumlah) AS subtotal, sisa, diambil FROM
			detailcustomerorder b LEFT JOIN product c ON b.idproduct=c.idproduct LEFT JOIN
			supplier a ON c.idsupplier=a.idsupplier WHERE b.idcustomerorder='%d' AND
			sisa > 0",$idtitipanlaundry);
			$dataOrder = array();
			while ($data = db_fetch_object($result)){
				$dataOrder[] = $data;
			}
			drupal_add_js(
				array(
					'data_order' => $dataOrder,
				),
				'setting');
		}
	}
	$kasirtabel .= '</tbody>';
	$kasirtabel .= '</table>';
	return $kasirtabel;
}