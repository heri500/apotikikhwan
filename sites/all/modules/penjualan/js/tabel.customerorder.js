var oTable;
var pathutama = '';
var urutan = '';
var alamatupdatedetailcustomerorder = '';
function addCommas(nStr){
	nStr += "";
	x = nStr.split(",");
	x1 = x[0];
	x2 = x.length > 1 ? "," + x[1] : "";
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, "$1" + "." + "$2");
	}
	return x1 + x2;
}
function tampiltabelcustomerorder(){
	oTable = $('#tabel_customerorder').dataTable( {
        'bJQueryUI': true,
        'bAutoWidth': false,
        'sPaginationType': 'full_numbers',
        'bInfo': true,
        'aLengthMenu': [[100, 200, 300, -1], [100, 200, 300, 'All']],
        'iDisplayLength': 100,
        'order': [[ 7, "desc" ]],
        'processing': true,
        'serverSide': true,
        'ajax': Drupal.settings.basePath + 'sites/all/modules/datapelanggan/server_processing.php?request_data=customerorder&tglawal='+ Drupal.settings.tglawal +'&tglakhir='+ Drupal.settings.tglakhir,
        buttons: [
            {
                extend: 'colvis',
                columns: [4,5,6,7,8,9,10,11,12,13,14,15]
            }, 'copy', 'excel', 'print'
        ],
        'sDom': '<"button-div"B><"H"lfr>t<"F"ip>',
        'createdRow': function ( row, data, index ) {
            row.id = data[(data.length - 1)];
            $('td', row).eq(1).addClass('center');
            $('td', row).eq(2).addClass('center');
            $('td', row).eq(3).addClass('center');
            $('td', row).eq(4).addClass('center');
            $('td', row).eq(5).addClass('center');
            $('td', row).eq(6).addClass('center');
            $('td', row).eq(7).addClass('center');
			$('td', row).eq(8).addClass('center');
            $('td', row).eq(9).addClass('angka');
            $('td', row).eq(10).addClass('center');
            $('td', row).eq(11).addClass('angka');
            $('td', row).eq(12).addClass('angka');
            $('td', row).eq(13).addClass('center');
            $('td', row).eq(14).addClass('center');
            $('td', row).eq(15).addClass('center');
            $('td', row).eq(16).addClass('center');
			$('td', row).eq(17).addClass('center');
        },
		'drawCallback': function( settings ) {
			var renderer = "bmp";
			var btype = "ean13";
			var settings = {
				output:renderer,
				barWidth: 1,
				barHeight: 20
			};
			$(".barcode-place").each(function(){
				barcode_value = $(this).attr('id');
				$(this).barcode(barcode_value, btype, settings);
			});
		},
		"aoColumnDefs": [
			{ "bSortable": false, "aTargets": [ 0,1,2,3,4,6,8,12,13,16,18 ] }
		]
	});
}
function tampiltabelcustomerorderdetail(){
	oTable = $("#tabel_detail_customerorder").dataTable( {
		"bJQueryUI": true,
		"bAutoWidth": false,
		"bPaginate": false,
		"bLengthChange": false,
		"bInfo": false,
		"aaSorting": [[0, "asc"]],
		"sDom": "<'H'<'toolbar'>fr>t<'F'ip>"
	});
}
function view_detail(idcustomerorder,nonota){
	var request = new Object();
	request.idcustomerorder = idcustomerorder;
	alamat = pathutama + 'penjualan/detailcustomerorder';
	$.ajax({
		type: 'POST',
		url: alamat,
		data: request,
		cache: false,
		success: function(data){
			$('#dialogdetail').html(data);
			tampiltabelcustomerorderdetail();
			$('div.toolbar').html('No. Nota : '+ nonota);
			$('#dialogdetail').dialog('open');
		}
	});
}
function delete_customerorder(idcustomerorder,nonota){
	var konfirmasi = confirm('Yakin ingin menghapus customer order dengan no nota : '+ nonota +' ini...??!!');
	if (konfirmasi){
		window.location = pathutama + 'penjualan/deletecustomerorder/'+ idcustomerorder +'?destination=penjualan/viewcustomerorder';	
	}
}
function print_customerorder(idcustomerorder,nonota){
	var konfirmasi = confirm('Yakin ingin mencetak kembali customerorder dengan no nota : '+ nonota +' ini...??!!');	
	if (konfirmasi){
		window.open(pathutama + 'print/6?idorder='+ idcustomerorder);
	}
}
function print_production(idcustomerorder,nonota){
	var konfirmasi = confirm('Yakin ingin mencetak detail customer order dengan no nota : '+ nonota +' untuk keperluan produksi...??!!');
	if (konfirmasi){
		window.open(pathutama + 'print/6?idorderlogo='+ idcustomerorder);
	}
}
function pickup_customerorder(idcustomerorder, nonota){
	window.open(Drupal.settings.basePath + 'penjualan/kasir/'+ idcustomerorder +'/viewcustomerorder');
}
$(document).ready(function(){
	pathutama = Drupal.settings.basePath;
	alamatupdatetanggaljual = pathutama + 'penjualan/updatecustomerorder';
	//alamatupdatedetailcustomerorder = pathutama + 'customerorder/updatedetailcustomerorder';
	urutan = Drupal.settings.urutan;
	$('#dialogdetail').dialog({
		modal: true,
		width: 850,
		resizable: false,
		autoOpen: false,
		position: ['auto','auto']
	});
	$('button').button();
	//TableToolsInit.sSwfPath = pathutama +'misc/media/datatables/swf/ZeroClipboard.swf';
	if (urutan == 1){
		$('.edit-tanggal').editable(alamatupdatetanggaljual,{
			submitdata : function(value, settings) {
			 var idcustomerorder = $(this).attr('id');
			 var splitidcustomerorder = idcustomerorder.split('-');
			 idcustomerorder = splitidcustomerorder[1];
			 var jamcustomerorderupdate = $('#jamcustomerorder-'+ idcustomerorder).html();
			 return {jamcustomerorder: jamcustomerorderupdate,ubah: 'tanggal'};
   		},
			name : 'tanggaljual',
			width : 130,
			height : 18,
			style   : 'margin: 0',
			tooltip   : 'Klik untuk mengubah tanggal customerorder',
	    indicator : 'Saving...',
	    type: "datepicker",
			datepicker: {
	      changeMonth: true,
	      changeYear: true,
	      dateFormat: "dd-mm-yy"
	    },
	    callback : function(value, settings) {
      	var split_tanggal = value.split('-');
      	var tanggaljual = new Date();
      	var bulan = parseInt(split_tanggal[1]) - 1;
				tanggaljual.setFullYear(split_tanggal[2],bulan,split_tanggal[0]);
				var indexhari = tanggaljual.getDay();
				var hari = Drupal.settings.namahari[indexhari];
				var idcustomerorder = $(this).attr('id');
			 	var splitidcustomerorder = idcustomerorder.split('-');
			 	idcustomerorder = splitidcustomerorder[1];
			 	$('#haricustomerorder-'+ idcustomerorder).html(hari);
     	}
	  });
	  $('.edit-jam').editable(alamatupdatetanggaljual,{
			name : 'jampenjualan',
			width : 120,
			height : 18,
			style   : 'margin: 0;',
			type: "timepicker",
			submitdata : function(value, settings) {
			 var idcustomerorder = $(this).attr('id');
			 var splitidcustomerorder = idcustomerorder.split('-');
			 idcustomerorder = splitidcustomerorder[1];
			 var tglcustomerorderupdate = $('#tglpenjualan-'+ idcustomerorder).html();
			 return {tanggaljual: tglcustomerorderupdate,ubah: 'jam'};
   		},
			timepicker: {
		  	timeOnlyTitle: "PILIH WAKTU",
				timeText: "Waktu",
				hourText: "Jam",
				minuteText: "Menit",
				secondText: "Detik",
				currentText: "Saat Ini",
				showButtonPanel: false
		  },
		  submit		: "Ok",
			tooltip   : 'Klik untuk mengubah jam customerorder',
	    indicator : 'Saving...'
	  });
	}
	tampiltabelcustomerorder();
	$('#tgl1').datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'dd-mm-yy'
	});
	$('#tgl2').datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'dd-mm-yy'
	});
})