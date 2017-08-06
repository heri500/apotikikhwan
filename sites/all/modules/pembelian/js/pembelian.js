var oTable;
var pathutama = '';
var giCount = 1;
var totalbelanja = 0;
var totalproduk = 0;
var barisrubah;
var tglsekarang = '';
var tgltampil = '';
function tampilkantabelkasir(){
	oTable = $('#tabel_kasir').dataTable( {
		'bJQueryUI': true,
		'bPaginate': false,
		'bLengthChange': false,
		'bFilter': true,
		'bInfo': false,
		'sScrollY': '399px',
		'aoColumns': [
		{ 'bSortable': false },{ 'bSortable': false },null,null,null,null,null
		],
		'bAutoWidth': false
	});
}
function munculkankasir(){
	$('#dialogkasir').dialog('open');
}
function ubahharga(){
	if (totalproduk > 0){
		$('#dialogubahharga').dialog('open');
	}else{
		$('#pesantext').text('Mohon pilih produk terlebih dahulu...!!!');
		$('#dialogwarning').dialog('open');
	}
}
function ubahqty(){
	if (totalproduk > 0){
		$('#dialogubahqty').dialog('open');
	}else{
		$('#pesantext').text('Mohon pilih produk terlebih dahulu...!!!');
		$('#dialogwarning').dialog('open');
	}
}
function ubah_qty_produk(posisi,nTr,idproduk){
	barisrubah = nTr;
	$('#dialogubahqty2').dialog('open');
}
function tambahproduk(){
	var request = new Object();
	request.katacari = $('#barcode').val();
	alamatcariproduk = pathutama +'pembelian/cariproduk?idsupplier='+ $('#idsupplier').val();
	$.ajax({
		type: 'POST',
		url: alamatcariproduk,
		data: request,
		cache: false,
		success: function(data){
			pecahdata = new Array();
			pecahdata = data.split(';');
			if (pecahdata[0].trim() != 'error'){
				subtotal = number_format(parseInt(pecahdata[2]),0,',','.');
				nilaikirim = pecahdata[0].trim() +'___1___'+ pecahdata[2];
				index_cek_box = pecahdata[0].trim();
				namacekbox = 'cekbox_'+ index_cek_box;
				if($('#'+ namacekbox).val()){
					var nilaicekbox = $('#'+ namacekbox).val();
					var pecahnilai = nilaicekbox.split('___');
					var qtybaru = parseInt(pecahnilai[1]) + 1;
					var subtotallama = pecahnilai[1] * pecahnilai[2];
					var subtotal = qtybaru * pecahnilai[2];
					totalbelanja = totalbelanja - subtotallama + subtotal;
					$('#totalbelanja').html('Total Belanja : Rp. '+ number_format(totalbelanja,0,',','.'));
					var nTr = $('#'+ namacekbox).parent().parent().get(0);
					var posisibaris = oTable.fnGetPosition(nTr);
					oTable.fnUpdate(qtybaru, posisibaris, 4 );
					nilaikirim = pecahnilai[0].trim() +'___'+ qtybaru +'___'+ pecahnilai[2];
					checkboxnilai = '<input checked="checked" style="display: none;" id="'+ namacekbox +'" name="'+ namacekbox +'" type="checkbox" value="'+ nilaikirim +'" />';
					oTable.fnUpdate(number_format(subtotal,0,',','.') +' '+ checkboxnilai, posisibaris, 5 );
					posisiakhir = totalproduk-1;
					if (posisibaris == posisiakhir){
						$('#lastqty').val(qtybaru);
					}
				}else{
					var icondelete = '<img onclick="hapus_produk(\''+ index_cek_box +'\',this.parentNode.parentNode,\''+ pecahdata[0] +'\')" title="Klik untuk menghapus" src="'+ pathutama +'misc/media/images/close.ico" width="24">';
					var iconubah = '<img onclick="ubah_qty_produk(\''+ index_cek_box +'\',this.parentNode.parentNode,\''+ pecahdata[0] +'\')" title="Klik untuk mengubah qty produk ini" src="'+ pathutama +'misc/media/images/edit.ico" width="24">';

					$('#lastharga').val(pecahdata[2]);
					$('#last_id').val(pecahdata[0]);
					$('#lastqty').val('1');
					checkboxnilai = '<input checked="checked" style="display: none;" id="'+ namacekbox +'" name="'+ namacekbox +'" type="checkbox" value="'+ nilaikirim +'" />';
					var row = '<tr id="'+ index_cek_box +'"><td>'+ icondelete +'</td><td>'+ iconubah +'</td><td>'+ pecahdata[1] +'</td><td class="angka">'+ subtotal +'</td><td class="angka">1</td><td class="angka">'+ subtotal +' '+ checkboxnilai +'</td><td class="angka">'+ pecahdata[3] +'</td></tr>';
					$('#tabel_kasir').dataTable().fnAddTr($(row)[0]);
					giCount++;
					totalproduk++;
					totalbelanja = totalbelanja + parseInt(pecahdata[2]);
					$('#totalbelanja').html('Total Belanja : Rp. '+ number_format(totalbelanja,0,',','.'));
				}
				$('.dataTables_scrollBody').scrollTop($('.dataTables_scrollBody')[0].scrollHeight);
				$('#barcode').autocomplete('close');
				$('#barcode').select();
			}else{
				$('#pesantext').text('Produk yang dicari atau diinput tidak ada, silahkan masukkan barcode atau kode atau nama produk yang lain...!!!');
				$('#dialogwarning').dialog('open');
			}
		}
	});
}
function kirim_data(){
	if (totalproduk > 0){
		var sData = $('input', oTable.fnGetNodes()).serialize();
		$('#nilaikirim').val(sData);
		$('#dialogbayar').dialog('open');
	}else{
		$('#pesantext').text('Mohon pilih produk terlebih dahulu...!!!');
		$('#dialogwarning').dialog('open');
	}
}
function tutupwarning(){
	$('#dialogwarning').dialog('close');
}
function hapus_latest_produk(){
	if (totalproduk > 0){
        totalbelanja = totalbelanja - ($('#lastharga').val()*$('#lastqty').val());
        $('#totalbelanja').html('Total Belanja : Rp. '+ number_format(totalbelanja,0,',','.'));
        oTable.fnDeleteRow(totalproduk-1);
		totalproduk--;
		if (totalproduk >= 0){
			var nTr = oTable.fnGetNodes(totalproduk-1);
			idproduknya = nTr.getAttribute('id');
			var nilaidataakhir = $('#cekbox_'+ idproduknya).val();
			var pecahnilaiakhir = nilaidataakhir.split('___');
			$('#lastharga').val(pecahnilaiakhir[2]);
			$('#lastqty').val(pecahnilaiakhir[1]);
			$('#last_id').val(pecahnilaiakhir[0]);
		}else{
			$('#lastharga').val('');
			$('#lastqty').val('');
			$('#last_id').val('');
		}
	}else{
		$('#pesantext').text('Mohon pilih produk terlebih dahulu...!!!');
		$('#dialogwarning').dialog('open');
	}
}
function focusbarcode(){
	$('#barcode').select();
}
function hapus_produk(posisi,nTr,idproduk){
	var posisibaris = oTable.fnGetPosition(nTr);
	var nilaidata = $('#cekbox_'+ idproduk).val();
    console.log(nilaidata);
	var pecahnilai = nilaidata.split('___');
	totalbelanja = totalbelanja - (pecahnilai[1]*pecahnilai[2]);
	$('#totalbelanja').html('Total Belanja : Rp. '+ number_format(totalbelanja,0,',','.'));
	oTable.fnDeleteRow(posisibaris,focusbarcode);
	totalproduk--;
	if (totalproduk > 0){
		var nilaidataakhir = $('#cekbox_'+ totalproduk).val();
		var pecahnilaiakhir = nilaidataakhir.split('___');
		$('#lastharga').val(pecahnilaiakhir[2]);
		$('#lastqty').val(pecahnilaiakhir[1]);
		$('#last_id').val(pecahnilaiakhir[0]);
	}else{
		$('#lastharga').val('');
		$('#lastqty').val('');
		$('#last_id').val('');
	}
	$('#barcode').focus();
	$('#barcode').select();
}
function akhiri_belanja(){
	if ($('#carabayar').val() == 'TUNAI'){
		if ($('#nilaibayar').val() >= totalbelanja){
			do_selesai();
		}else{
			alert('Mohon isi pembayaran dengan nilai yang lebih besar atau sama dengan Total Belanja...!!!');
		}
	}else if ($('#carabayar').val() == 'HUTANG'){
		do_selesai();
	}
}
function do_selesai(){
	var request = new Object();
	request.idsupplier = $('#idsupplier').val();
	request.detail_produk = $('#nilaikirim').val();
	request.totalbelanja = totalbelanja;
	request.bayar = $('#nilaibayar').val();
	request.tglbeli = $('#tglbelikirim').val();
	request.carabayar = $('#carabayar').val();
	alamat = pathutama + 'pembelian/simpanpembelian';
	$.ajax({
		type: 'POST',
		url: alamat,
		data: request,
		cache: false,
		success: function(data){
			if (data != 'error'){
				window.location = pathutama + 'pembelian/kasir?tanggal='+ request.tglbeli;
			}else{
				alert('Ada masalah dalam penyimpanan data...!!!');
			}
		}
	});
}
function inisialulangautocomplete(){
	$('#barcode').autocomplete('destroy');
	$('#barcode').autocomplete({
		source: pathutama + 'pembelian/autocaribarang?idsupplier='+ $('#idsupplier').val(),
		select: function (event, ui) {
			console.log(ui.item)
			if (ui.item.barcode){
				$("#barcode").val(ui.item.barcode);
			}else if(!ui.item.barcode && ui.item.alt_code){
				$("#barcode").val(ui.item.alt_code);
			}else if(!ui.item.barcode && !ui.item.alt_code){
				$("#barcode").val(ui.item.value);
			}
			tambahproduk();
		}
	});
	$('#barcode').select();
}
$(document).ready(function(){
	var tglsekarang = Drupal.settings.tglsekarang;
	var tgltampil = Drupal.settings.tgltampil;
	pathutama = Drupal.settings.basePath;
	$('#dialogkasir').dialog({
		modal: true,
		width: 925,
		closeOnEscape: false,
		height: 730,
		resizable: false,
		autoOpen: false,
		open: function(event, ui) {
			$('#tempatjam').clock({'format':'24','calendar':'false'});
			$('#barcode').focus();
		},
		position: ['auto','auto']
	});
	$('#dialogwarning').dialog({
		modal: true,
		width: 400,
		closeOnEscape: false,
		resizable: false,
		autoOpen: false,
		open: function(event, ui) {
			$('#tutupdialog').focus();
		},
		close: function(){
			$('#barcode').select();
		},
		position: ['auto','auto']
	});
	$('#dialogubahqty').dialog({
		modal: true,
		width: 250,
		height: 100,
		closeOnEscape: false,
		resizable: false,
		autoOpen: false,
		open: function(event, ui) {
			$('#newqty').val($('#lastqty').val());
			$('#newqty').select();
		},
		close: function(){
			$('#barcode').select();
		},
		position: ['auto','auto']
	});
	$('#dialogubahharga').dialog({
		modal: true,
		width: 250,
		height: 100,
		closeOnEscape: false,
		resizable: false,
		autoOpen: false,
		open: function(event, ui) {
			$('#newharga').val($('#lastharga').val());
			$('#newharga').select();
		},
		close: function(){
			$('#barcode').select();
		},
		position: ['auto','auto']
	});
	$('#dialogubahqty2').dialog({
		modal: true,
		width: 250,
		height: 100,
		closeOnEscape: false,
		resizable: false,
		autoOpen: false,
		open: function(event, ui) {
			idproduknya = barisrubah.getAttribute('id');
			var nilaidata = $('#cekbox_'+ idproduknya).val();
			var pecahnilai = nilaidata.split('___');
			$('#newqty2').val(pecahnilai[1]);
			$('#newqty2').select();
		},
		close: function(){
			$('#barcode').select();
		},
		position: ['auto','auto']
	});
	$('#dialogbayar').dialog({
		modal: true,
		width: 550,
		closeOnEscape: false,
		resizable: false,
		autoOpen: false,
		open: function(event, ui) {
			$('#totalbelanjauser').val('Rp. '+ number_format(totalbelanja,0,',','.'));
			if (totalbelanja > 0 && totalbelanja <= 10000){
				$('#nilaibayar').val('10000');
			}else if(totalbelanja > 10000 && totalbelanja <= 20000){
				$('#nilaibayar').val('20000');
			}else if(totalbelanja > 20000 && totalbelanja <= 50000){
				$('#nilaibayar').val('50000');
			}else if(totalbelanja > 50000 && totalbelanja <= 100000){
				$('#nilaibayar').val('100000');
			}else if(totalbelanja > 100000 && totalbelanja <= 110000){
				$('#nilaibayar').val('110000');
			}else if(totalbelanja > 110000 && totalbelanja <= 120000){
				$('#nilaibayar').val('120000');
			}else if(totalbelanja > 120000 && totalbelanja <= 150000){
				$('#nilaibayar').val('150000');
			}else if(totalbelanja > 150000 && totalbelanja <= 200000){
				$('#nilaibayar').val('200000');
			}else{
				$('#nilaibayar').val(totalbelanja);
			}
			kembali = $('#nilaibayar').val()-totalbelanja;
			$('#kembali').val('Rp. '+ number_format(kembali,0,',','.'));
			$('#nilaibayar').select();
		},
		close: function(){
			$('#barcode').select();
		},
		position: ['auto','auto']
	});
	tampilkantabelkasir();
	$('#dialogkasir').dialog('open');
	$('.ui-dialog-titlebar').css('font-size','14px');
	$('button').button();
	$('#barcode').keypress(function(e) {
		if (e.keyCode == 114){
			$('#tombolubahqty').click();
		}else if (e.keyCode == 13){
			if ($('#barcode').val() != ''){
				tambahproduk();
			}else{
				$('#pesantext').text('Mohon isi barcode atau kode produk atau nama produk yang ingin dicari...!!!');
				$('#dialogwarning').dialog('open');
			}
		}else if (e.keyCode == 116 || e.keyCode == 117){
			kirim_data();
		}else if (e.keyCode == 115){
			hapus_latest_produk();
		}else if (e.keyCode == 113){
			$('#tombolubahharga').click();
		}
	});
	$('#barcode').autocomplete({
		source: pathutama + 'pembelian/autocaribarang?idsupplier='+ $('#idsupplier').val(),
		select: function (event, ui) {
			if (ui.item.barcode){
				$("#barcode").val(ui.item.barcode);
			}else if(!ui.item.barcode && ui.item.alt_code){
				$("#barcode").val(ui.item.alt_code);
			}else if(!ui.item.barcode && !ui.item.alt_code){
				$("#barcode").val(ui.item.value);
			}
			tambahproduk();
		}
	});
	$('#newqty').keypress(function(e) {
		if (e.keyCode == 13){
			var baris_int = totalproduk-1;
			totalbelanja = totalbelanja - ($('#lastharga').val()*$('#lastqty').val());
			var nilaiubah = $('#newqty').val();
			oTable.fnUpdate(nilaiubah, baris_int, 4 );
			nilaisubtotal = $('#lastharga').val()*nilaiubah;
			subtotalbaru = number_format(nilaisubtotal,0,',','.');
			var namacekbox = 'cekbox_'+ $('#last_id').val();
			var nilaikirim = $('#last_id').val() +'___'+ nilaiubah +'___'+ $('#lastharga').val();
			var checkboxnilai = '<input checked="checked" style="display: none;" id="'+ namacekbox +'" name="'+ namacekbox +'" type="checkbox" value="'+ nilaikirim +'" />';
			oTable.fnUpdate(subtotalbaru +' '+ checkboxnilai, baris_int, 5 );
			$('#lastqty').val(nilaiubah);
			totalbelanja = totalbelanja + ($('#lastharga').val()*$('#lastqty').val());
			$('#totalbelanja').html('Total Belanja : Rp. '+ number_format(totalbelanja,0,',','.'));
			$('#dialogubahqty').dialog('close');
		}
	});
	$('#newharga').keypress(function(e) {
		if (e.keyCode == 13){
			var baris_int = totalproduk-1;
			totalbelanja = totalbelanja - ($('#lastharga').val()*$('#lastqty').val());
			var nilaiubah = $('#newharga').val();
			oTable.fnUpdate(nilaiubah, baris_int, 3 );
			nilaisubtotal = $('#lastqty').val()*nilaiubah;
			subtotalbaru = number_format(nilaisubtotal,0,',','.');
			var namacekbox = 'cekbox_'+ $('#last_id').val();
			var nilaikirim = $('#last_id').val() +'___'+ $('#lastqty').val() +'___'+ nilaiubah;
			var checkboxnilai = '<input checked="checked" style="display: none;" id="'+ namacekbox +'" name="'+ namacekbox +'" type="checkbox" value="'+ nilaikirim +'" />';
			oTable.fnUpdate(subtotalbaru +' '+ checkboxnilai, baris_int, 5 );
			$('#lastharga').val(nilaiubah);
			totalbelanja = totalbelanja + ($('#lastharga').val()*$('#lastqty').val());
			$('#totalbelanja').html('Total Belanja : Rp. '+ number_format(totalbelanja,0,',','.'));
			$('#dialogubahharga').dialog('close');
		}
	});
	$('#newqty2').keypress(function(e) {
		if (e.keyCode == 13){
			var baris_int = oTable.fnGetPosition(barisrubah);
			var idproduknya = barisrubah.getAttribute('id');
			var nilaidata = $('#cekbox_'+ idproduknya).val();
			var pecahnilai = nilaidata.split('___');
			totalbelanja = totalbelanja - (pecahnilai[1]*pecahnilai[2]);
			var nilaiubah = $('#newqty2').val();
			oTable.fnUpdate(nilaiubah, baris_int, 4 );
			nilaisubtotal = pecahnilai[2]*nilaiubah;
			subtotalbaru = number_format(nilaisubtotal,0,',','.');
			var namacekbox = 'cekbox_'+ idproduknya;
			var nilaikirim = idproduknya +'___'+ nilaiubah +'___'+ pecahnilai[2];
			var checkboxnilai = '<input checked="checked" style="display: none;" id="'+ namacekbox +'" name="'+ namacekbox +'" type="checkbox" value="'+ nilaikirim +'" />';
			oTable.fnUpdate(subtotalbaru +' '+ checkboxnilai, baris_int, 5 );
			totalbelanja = totalbelanja + (pecahnilai[2]*nilaiubah);
			posisiakhir = totalproduk-1;
			if (baris_int == posisiakhir){
				$('#lastqty').val(nilaiubah);
			}
			$('#totalbelanja').html('Total Belanja : Rp. '+ number_format(totalbelanja,0,',','.'));
			$('#dialogubahqty2').dialog('close');
		}
	});
	$('#nilaibayar').keyup(function(e){
		kembali = $('#nilaibayar').val()-totalbelanja;
		$('#kembali').val('Rp. '+ number_format(kembali,0,',','.'));
		if (e.keyCode == 13){
			akhiri_belanja();
		}
	});
	$('#tglbeli').datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'dd-mm-yy',
		altField: '#tglbelikirim',
		altFormat: 'yy-mm-dd',
		onClose: function(dateText, inst) {
			$('#barcode').select();
		}
	});
	$("#tglbeli").css("width","177px");
	$('#carabayar').change(function(){
		if ($(this).val() == 'HUTANG'){
			$('#nilaibayar').val(0);
			kembali = $('#nilaibayar').val()-totalbelanja;
			$('#kembali').val('Rp. '+ number_format(kembali,0,',','.'));
			$('#nilaibayar').select();
		}
	});
	$('#info-kasir-waktu').css('background','url('+ Drupal.settings.logo +') 99% 50% no-repeat');
	$('#info-kasir-waktu').css('background-size','75px 75px');
})