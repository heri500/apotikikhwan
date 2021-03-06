<?php

function data_supplier(){
	$path = drupal_get_path('theme', 'cti_flex');
 	$form_style = $path.'/css/custom-style.css';
 	drupal_add_css($form_style, 'theme', 'all', FALSE);
 	$variables['styles'] = drupal_get_css();
	drupal_add_css('misc/media/datatables/css/demo_table_jui.css');
	drupal_add_css('misc/media/datatables/css/TableTools.css');
	drupal_add_css('misc/media/datatables/themes/smoothness/jquery-ui-1.8.4.custom.css');
	drupal_add_css('misc/media/datatables/css/ColVis.css');
	drupal_add_css('misc/media/css/validationEngine.jquery.css');
	drupal_add_js('misc/media/jquery-1.4.4.min.js');
	drupal_add_js('misc/media/jquery.validationEngine-en.js');
	drupal_add_js('misc/media/jquery.validationEngine.js');
	drupal_add_js('misc/media/jquery-ui-1.8.custom.min.js');
	drupal_add_js('misc/media/datatables/js/jquery.dataTables.min.js');
	drupal_add_js('misc/media/datatables/ZeroClipboard/ZeroClipboard.js');
	drupal_add_js('misc/media/datatables/js/TableTools.min.js');
	drupal_add_js('misc/media/jquery.jeditable.js');
	drupal_add_js('misc/media/jquery.autotab-1.1b.js');
	drupal_add_js('
		var oTable;
		var oTable2;
		var oTable3;
		var oTable4;
		var pathutama = "'.base_path().'";
		var pathfile = "'.base_path().file_directory_path().'/";
		function tampilkantabelsupplier(){
			oTable = $("#tabel_supplier").dataTable( {
				"bJQueryUI": true,
				"bAutoWidth": false,
				"sPaginationType": "full_numbers",
				"bInfo": false,
				"aLengthMenu": [[100, 200, 300, -1], [100, 200, 300, "All"]],
				"iDisplayLength": 100,
				"aaSorting": [[0, "asc"]],
				"sDom": \'<"space"T><"clear"><"H"lfr>t<"F"ip>\'
			});
		}
		function tampiltabelhutangdetail(){
			oTable2 = $("#tabel_detail_hutang").dataTable( {
				"bJQueryUI": true,
				"bAutoWidth": false,
				"bPaginate": false,
				"bLengthChange": false,
				"bFilter": false,
				"bInfo": false,
				"aaSorting": [[0, "asc"]],
				"sDom": \'<"H"<"toolbar">fr>t<"F"ip>\'
			});
		}
		function view_detail_hutang(idsupplier,namasupplier,besarhutang){
			var tampilhutang = "HUTANG KE SUPPLIER SAAT INI : Rp. "+ besarhutang;
			$("#tempatnilaihutang").html(tampilhutang);
			var request = new Object();
			request.idsupplier = idsupplier;
			alamat = pathutama + "datasupplier/detailhutang";
			$.ajax({ 
				type: "POST",
				url: alamat,
				data: request, 
				cache: false, 
				success: function(data){
					$("#detailpiutang").html(data);
					tampiltabelhutangdetail();
					$("div.toolbar").html("SUPPLIER : "+ namasupplier);
					alamat = pathutama + "datasupplier/detailpembayaran";
					$.ajax({ 
						type: "POST",
						url: alamat,
						data: request, 
						cache: false, 
						success: function(data2){
							$("#detailpembayaran").html(data2);
							tampiltabelpembayaran();
							$("div.toolbar2").html("PEMBAYARAN");
							$("#dialogdetailhutang").dialog("open");
						}
					});		
				}
			});
		}
		function tampiltabelbelidetail(){
			oTable3 = $("#tabel_detail_pembelian").dataTable( {
				"bJQueryUI": true,
				"bAutoWidth": false,
				"bPaginate": false,
				"bLengthChange": false,
				"bInfo": false,
				"aaSorting": [[0, "asc"]],
				"sDom": \'<"H"<"toolbar">fr>t<"F"ip>\'
			});
		}
		function tampiltabelpembayaran(){
			oTable4 = $("#history_pembayaran").dataTable( {
				"bJQueryUI": true,
				"bAutoWidth": false,
				"bPaginate": false,
				"bLengthChange": false,
				"bInfo": false,
				"bFilter": false,
				"aaSorting": [[0, "asc"]],
				"sDom": \'<"H"<"toolbar2">fr>t<"F"ip>\'
			});
		}
		function view_detail(idpembelian,nonota){
			var request = new Object();
			request.idpembelian = idpembelian;
			alamat = pathutama + "pembelian/detailpembelian";
			$.ajax({ 
				type: "POST",
				url: alamat,
				data: request, 
				cache: false, 
				success: function(data){
					$("#dialogdetail").html(data);
					tampiltabelbelidetail();
					$("div.toolbar").html("No. Nota : "+ nonota);
					$("#dialogdetail").dialog("open");
				}
			});
		}
		function pembayaran(idsupplier,namasupplier,besarhutang,nilaihutang){
			if (nilaihutang > 0){
				var tampilhutang = "HUTANG KE SUPPLIER "+ namasupplier +" SAAT INI : Rp. "+ besarhutang;
				$("#nilaipembayaran").val(parseInt(nilaihutang));
				$("#tothutang").val(parseInt(nilaihutang));
				$("#idsupplierbayar").val(idsupplier);
				$("#totalhutangpelanggan").html(tampilhutang);
				$("#dialogpembayaran").dialog("open");
			}else{
				alert("Tidak ada hutang ke supplier "+ namasupplier);
			}
		}
		function do_pembayaran(){
			/*idsupplier, nilaisebelumbayar, pembayaran, uid, tglbayar*/
			var request = new Object();
			request.idsupplier = $("#idsupplierbayar").val();
			request.hutang = $("#tothutang").val();
			request.pembayaran = $("#nilaipembayaran").val();
			request.tglbayar = $("#tglbayarkirim").val();
			alamat = pathutama + "datasupplier/pembayaran";
			$.ajax({ 
				type: "POST",
				url: alamat,
				data: request, 
				cache: false, 
				success: function(){
					window.location = pathutama + "datasupplier/supplier";
				}
			});
		}
		$(document).ready(function() {
			TableToolsInit.sSwfPath = pathutama +"misc/media/datatables/swf/ZeroClipboard.swf";
			alamatupdate = pathutama + "datasupplier/updatesupplier";
			$("#tabel_supplier tbody .editable").editable(alamatupdate, {
				"callback": function( sValue, y ) {
					var aPos = oTable.fnGetPosition( this );
					oTable.fnUpdate( sValue, aPos[0], aPos[1] );
				},
				"submitdata": function ( value, settings ) {
					var aPos = oTable.fnGetPosition( this );
				  return { "row_id": this.parentNode.getAttribute("id"), "kol_id": aPos[1] };
				},
				"height": "20px",
				"submit": "Ok",
				"cancel": "Batal",
				"indicator": "Menyimpan...",
				"tooltip": "Klik untuk mengubah..."
			});
			tampilkantabelsupplier();
			$("#formsupplier").validationEngine();
			$("button").button();
			$("#kodesupplier").autotab_filter({
				format: "alphanumeric",
				uppercase: true,
				nospace: true
			});
			$("#dialogdetailhutang").dialog({
				modal: true,
				width: 1100,
				resizable: false,
				autoOpen: false,
				position: ["auto","auto"]
			});
			$("#dialogdetail").dialog({
				modal: true,
				width: 850,
				resizable: false,
				autoOpen: false,
				position: ["auto","auto"]
			});
			$("#dialogpembayaran").dialog({
				modal: true,
				width: 450,
				resizable: false,
				autoOpen: false,
				position: ["auto","auto"],
				open: function(event, ui) {
					$("#nilaipembayaran").focus();
					$("#nilaipembayaran").select();
				}
			});
			$("#tglbayar").datepicker({
				changeMonth: true,
				changeYear: true,
				dateFormat: "dd-mm-yy",
				altField: "#tglbayarkirim",
				altFormat: "yy-mm-dd"
			});
			$("#nilaipembayaran").keypress(function(e) {
				if (e.keyCode == 13){
					$("#bayarhutang").click();
				}
			});
		})
	','inline');
	$viewtabelsupplier = '<form id="formsupplier" action="'.base_path().'datasupplier/simpansupplier" method="post"><div id="formplace" class="supplier">';
	$viewtabelsupplier .= '<label>KODE</label><input type="text" class=\"validate[required]\" id="kodesupplier" name="kodesupplier">';
	$viewtabelsupplier .= '<label>SUPPLIER</label><input class=\"validate[required]\" type="text" id="namasupplier" name="namasupplier">';
	$viewtabelsupplier .= '<label>TELEPON</label><input type="text" id="telp" name="telp">';
	$viewtabelsupplier .= '<label>ALAMAT</label><input type="text" id="alamat" name="alamat">';
	$viewtabelsupplier .= '<label>EMAIL</label><input type="text" id="email" name="email">';
	$viewtabelsupplier .= '<button style="font-size: 12px;">Tambah Supplier</button></div></form>';
	$viewtabelsupplier .= '<div style="width: 80%;">'.tabel_supplier().'</div>';
	$viewtabelsupplier .= '<div id="dialogdetailhutang" title="DETAIL HUTANG DAN PEMBAYARAN"><div id="tempatnilaihutang"></div><div id="detailpiutang"></div><div id="detailpembayaran">a</div></div>';
	$viewtabelsupplier .= '<div id="dialogdetail" title="DETAIL PEMBELIAN"></div>';
	$viewtabelsupplier .= '<div id="dialogpembayaran" title="PEMBAYARAN HUTANG">';
	$viewtabelsupplier .= '<div id="totalhutangpelanggan"></div>';
	$viewtabelsupplier .= '<div class="baris"><label>Tgl Bayar</label><input readonly="readonly" type="text" id="tglbayar" name="tglbayar" value="'.date("d-m-Y").'"><input type="hidden" id="tglbayarkirim" name="tglbayarkirim" value="'.date("Y-m-d").'"></div>';
	$viewtabelsupplier .= '<div class="baris"><label>Pembayaran</label><input type="text" id="nilaipembayaran" name="nilaipembayaran"></div>';
	$viewtabelsupplier .= '<div class="baris"><button id="bayarhutang" onclick="do_pembayaran();">BAYAR</button>';
	$viewtabelsupplier .= '<input type="hidden" id="idsupplierbayar" name="idsupplierbayar">';
	$viewtabelsupplier .= '<input type="hidden" id="tothutang" name="tothutang"></div>';
	$viewtabelsupplier .= '</div>';
	return $viewtabelsupplier;
}

function tabel_supplier(){
	$tabelsupplier ='<table cellpadding="0" cellspacing="0" border="0" class="display" id="tabel_supplier">';
	$tabelsupplier .= '<thead>';
	$tabelsupplier .= '<tr>';
	$tabelsupplier .= '<th class="tablebutton"></th>';
	$tabelsupplier .= '<th class="tablebutton"></th>';
	$tabelsupplier .= '<th style="width: 150px;">KODE</th>';
	$tabelsupplier .= '<th>NAMA SUPPLIER</th>';
	$tabelsupplier .= '<th>TELP</th>';
	$tabelsupplier .= '<th>ALAMAT</th>';
	$tabelsupplier .= '<th>EMAIL</th>';
	$tabelsupplier .= '<th>HUTANG</th>';
	$tabelsupplier .= '<th>AKHIR</th>';
	$tabelsupplier .= '<th class="tanggal">UPDATE</th>';
	$tabelsupplier .= '</tr>';
	$tabelsupplier .= '</thead>';
	$tabelsupplier .= '<tbody>';
	$totalhutang = 0;
	$result = db_query("SELECT idsupplier,kodesupplier,namasupplier,telp,alamat,email FROM supplier ORDER BY kodesupplier,namasupplier");
	while ($data = db_fetch_object($result)){
		$tabelsupplier .= '<tr id="'.$data->idsupplier.'">';
		$resulthutang = db_query("SELECT besarhutang,pembayaranterakhir ,SUBSTR(last_update,1,10) AS bayarterakhir 
		FROM hutang WHERE idsupplier='%d'",$data->idsupplier);
		$datahutang = db_fetch_object($resulthutang);
		$totalhutang = $totalhutang + $datahutang->besarhutang;
		$tampilhutang = number_format($datahutang->besarhutang,0,",",".");
		$lihathutang = '<img title="Klik untuk melihat detail hutang dan pembayaran ke Supplier '.$data->namasupplier.'" src="'.base_path().'misc/media/images/forward_enabled.ico" onclick="view_detail_hutang(\''.$data->idsupplier.'\',\''.$data->namasupplier.'\',\''.$tampilhutang.'\')">';
		$bayarhutang = '<img title="Klik untuk mengisi form pembayaran hutang" src="'.base_path().'misc/media/images/money2_24.png" onclick="pembayaran(\''.$data->idsupplier.'\',\''.$data->namasupplier.'\',\''.number_format($datahutang->besarhutang,0,",",".").'\',\''.$datahutang->besarhutang.'\')">';
		$tabelsupplier .= '<td class="center">'.$lihathutang.'</td>';
		$tabelsupplier .= '<td class="center">'.$bayarhutang.'</td>';
		$tabelsupplier .= '<td class="editable">'.$data->kodesupplier.'</td>';
		$tabelsupplier .= '<td class="editable">'.$data->namasupplier.'</td>';
		$tabelsupplier .= '<td class="editable">'.$data->telp.'</td>';
		$tabelsupplier .= '<td class="editable">'.$data->alamat.'</td>';
		$tabelsupplier .= '<td class="editable">'.$data->email.'</td>';
		$tabelsupplier .= '<td class="angka">'.number_format($datahutang->besarhutang,0,",",".").'</td>';
		$tabelsupplier .= '<td class="angka">'.number_format($datahutang->pembayaranterakhir,0,",",".").'</td>';
		$tabelsupplier .= '<td class="center">'.$datahutang->bayarterakhir.'</td>';
		$tabelsupplier .= '</tr>';
	}
	$tabelsupplier .= '</tbody>';
	$tabelsupplier .= '<tfoot>';
	$tabelsupplier .= '<tr>';
	$tabelsupplier .= '<th style="text-align:right" colspan="7">Total:&nbsp;&nbsp;</th>';
	$tabelsupplier .= '<th style="text-align: right" colspan="3">Rp. '.number_format($totalhutang,0,",",".").'&nbsp;&nbsp;</th>';
	$tabelsupplier .= '</tr>';
	$tabelsupplier .= '</tfoot>';
	$tabelsupplier .= '</table>';
	return $tabelsupplier;
}

function simpan_supplier(){
	if ($_POST["kodesupplier"] AND $_POST["namasupplier"]){
		db_query("INSERT INTO supplier(kodesupplier,namasupplier,telp,alamat,email) VALUES('%s','%s','%s','%s','%s')",
		strtoupper($_POST["kodesupplier"]),$_POST["namasupplier"],$_POST["telp"],$_POST["alamat"],$_POST["email"]);
		if ($_POST["asal"]){
			$result = db_query("SELECT idsupplier FROM supplier WHERE kodesupplier='%s' AND namasupplier='%s'",
			strtoupper($_POST["kodesupplier"]),$_POST["namasupplier"]);
			$data = db_fetch_object($result);
			print $data->idsupplier;
		}else{
			drupal_goto("datasupplier/supplier");
		}
	}
	exit();	
}

function update_supplier(){
	$NILAI = $_POST['value'];
	$KOLOM = $_POST['kol_id'];
	$SUPPLIER_ID = $_POST['row_id'];
	if ($KOLOM == "2"){
		$NILAI = strtoupper($NILAI);
		$sql_update = "UPDATE supplier SET kodesupplier='%s' WHERE idsupplier='%d'";
	}elseif ($KOLOM == "3"){
		$sql_update = "UPDATE supplier SET namasupplier='%s' WHERE idsupplier='%d'";
	}elseif ($KOLOM == "4"){
		$sql_update = "UPDATE supplier SET telp='%s' WHERE idsupplier='%d'";
	}elseif ($KOLOM == "5"){
		$sql_update = "UPDATE supplier SET alamat='%s' WHERE idsupplier='%d'";
	}elseif ($KOLOM == "6"){
		$sql_update = "UPDATE supplier SET email='%s' WHERE idsupplier='%d'";
	}
	db_query($sql_update,$NILAI,$SUPPLIER_ID);
	echo $NILAI;
	exit();	
}
function bayar_hutang_supplier(){
	//idpelanggan, nilaisebelumbayar, pembayaran, uid, tglbayar
	if ($_POST["idsupplier"] AND $_POST["pembayaran"]){
		global $user;
		db_query("INSERT INTO pembayaranhutang (idsupplier, hutangsebelumbayar, pembayaran, uid, tglbayar) VALUES 
		('%d', '%f', '%f', '%d', '%s')",$_POST["idsupplier"],$_POST["hutang"],$_POST["pembayaran"],$user->uid,$_POST["tglbayar"]);
		$sisahutang = $_POST["hutang"] - $_POST["pembayaran"];
		$tglsekarang = date("Y-m-d H:i:s");
		db_query("UPDATE hutang SET besarhutang='%f',pembayaranterakhir='%f',last_update='%s' WHERE idsupplier='%d'",
		$sisahutang,$_POST["pembayaran"],$tglsekarang,$_POST["idsupplier"]);
	}
	exit();	
}
function detail_hutang(){
	if ($_POST["idsupplier"]){
		$tabelhutang ='<table cellpadding="0" cellspacing="0" border="0" class="display" id="tabel_detail_hutang">';
		$tabelhutang .= '<thead>';
		$tabelhutang .= '<tr>';
		$tabelhutang .= '<th class="tablebutton"></th>';
		$tabelhutang .= '<th style="width: 150px;">NO. NOTA</th>';
		$tabelhutang .= '<th>TOTAL</th>';
		$tabelhutang .= '<th>DP</th>';
		$tabelhutang .= '<th>HUTANG</th>';
		$tabelhutang .= '<th class="tanggal">TGL JUAL</th>';
		$tabelhutang .= '</tr>';
		$tabelhutang .= '</thead>';
		$tabelhutang .= '<tbody>';
		$result = db_query("SELECT a.idsupplier, a.idpembelian,a.besarhutang,b.nonota,b.total,b.bayar,SUBSTR(b.tglpembelian,1,10) AS tglbeli FROM 
		detailhutang a, pembelian b WHERE a.idpembelian = b.idpembelian AND a.idsupplier='%d'",
		$_POST["idsupplier"]);
		$totalbelanja = 0;
		$totaldp = 0;
		$totalhutang = 0;
		while ($data = db_fetch_object($result)){
			$lihatdetailpembelian = '<img title="Klik untuk melihat detail pembelian" onclick="view_detail(\''.$data->idpembelian.'\',\''.$data->nonota.'\');" src="'.base_path().'misc/media/images/forward_enabled.ico">';
			$tabelhutang .= '<tr id="'.$data->idpembelian.'">';
			$tabelhutang .= '<td class="center">'.$lihatdetailpembelian.'</td>';
			$tabelhutang .= '<td class="center">'.$data->nonota.'</td>';
			$totalbelanja = $totalbelanja + $data->total;
			$totaldp = $totaldp + $data->bayar;
			$totalhutang = $totalhutang + $data->besarhutang;
			$tabelhutang .= '<td class="angka">'.number_format($data->total,0,",",".").'</td>';
			$tabelhutang .= '<td class="angka">'.number_format($data->bayar,0,",",".").'</td>';
			$tabelhutang .= '<td class="angka">'.number_format($data->besarhutang,0,",",".").'</td>';
			$tabelhutang .= '<td class="center">'.$data->tglbeli.'</td>';
			$tabelhutang .= '</tr>';
		}
		$tabelhutang .= '</tbody>';
		$tabelhutang .= '<tfoot>';
		$tabelhutang .= '<tr>';
		$tabelhutang .= '<th style="text-align:right" colspan="2">Total:&nbsp;&nbsp;</th>';
		$tabelhutang .= '<th style="text-align: right" >Rp. '.number_format($totalbelanja,0,",",".").'&nbsp;&nbsp;</th>';
		$tabelhutang .= '<th style="text-align: right" >Rp. '.number_format($totaldp,0,",",".").'&nbsp;&nbsp;</th>';
		$tabelhutang .= '<th style="text-align: right" >Rp. '.number_format($totalhutang,0,",",".").'&nbsp;&nbsp;</th>';
		$tabelhutang .= '<th></th>';
		$tabelhutang .= '</tr>';
		$tabelhutang .= '</tfoot>';
		$tabelhutang .= '</table>';
		$tabelhutang .= '<br><br>';
		print $tabelhutang;
	}
	exit();	
}

function detail_pembayaran_hutang(){
	//idlangganan, pembayaran, last_update
	if ($_POST["idsupplier"]){
		$tabelpembayaran ='<table cellpadding="0" cellspacing="0" border="0" class="display" id="history_pembayaran">';
		$tabelpembayaran .= '<thead>';
		$tabelpembayaran .= '<tr>';
		$tabelpembayaran .= '<th class="tanggal">TGL BAYAR</th>';
		$tabelpembayaran .= '<th>KETERANGAN</th>';
		$tabelpembayaran .= '<th>NILAI</th>';
		$tabelpembayaran .= '</tr>';
		$tabelpembayaran .= '</thead>';
		$tabelpembayaran .= '<tbody>';
		$result = db_query("SELECT keterangan, pembayaran, SUBSTR(last_update,1,10) AS tglbayar FROM pembayaranhutang WHERE idsupplier='%d'",
		$_POST["idsupplier"]);
		$totalbayar = 0;
		while ($data = db_fetch_object($result)){
			$tabelpembayaran .= '<tr>';
			$tabelpembayaran .= '<td class="center">'.$data->tglbayar.'</td>';
			$tabelpembayaran .= '<td>'.$data->keterangan.'</td>';
			$totalbayar = $totalbayar + $data->pembayaran;
			$tabelpembayaran .= '<td class="angka">'.number_format($data->pembayaran,0,",",".").'</td>';
			$tabelpembayaran .= '</tr>';
		}
		$tabelpembayaran .= '</tbody>';
		$tabelpembayaran .= '<tfoot>';
		$tabelpembayaran .= '<tr>';
		$tabelpembayaran .= '<th style="text-align:right">Total:&nbsp;&nbsp;</th>';
		$tabelpembayaran .= '<th colspan="3" style="text-align: right" >Rp. '.number_format($totalbayar,0,",",".").'&nbsp;&nbsp;</th>';
		$tabelpembayaran .= '</tr>';
		$tabelpembayaran .= '</tfoot>';
		$tabelpembayaran .= '</table>';
		$tabelpembayaran .= '<br><br>';
		print $tabelpembayaran;
	}
	exit();	
}