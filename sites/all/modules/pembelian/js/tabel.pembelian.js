var oTable;
var pathutama = '';
var tglAwal = '';
var tglAkhir = '';
var urutan = 0;
var tampilData = 0;
var idpelanggan = 0;
var idsupplier = 0;
var selectedPenjualan = 0;
var selectedNota = '';
var selectedPelanggan = 0;
var alamatupdatepenjualan = '';
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
function tampiltabelbeli(){
    if (tampilData == 0){
        oTable = $('#tabel_pembelian').dataTable( {
            'bJQueryUI': true,
            'bAutoWidth': false,
            'sPaginationType': 'full_numbers',
            'bInfo': true,
            'aLengthMenu': [[100, 200, 300, -1], [100, 200, 300, 'All']],
            'iDisplayLength': 100,
            'aaSorting': [[urutan, 'desc']],
            'processing': true,
            'serverSide': true,
            'ajax': Drupal.settings.basePath + 'sites/all/modules/datapelanggan/server_processing.php?request_data=pembelian&tglawal='+ tglAwal +'&tglakhir='+ tglAkhir +'&idpelanggan='+ Drupal.settings.filterId,
            buttons: [
                {
                    extend: 'colvis',
                    columns: [1,2,3,4,5,6,7,8,9,10]
                }, 'copy', 'excel', 'print'
            ],
            'sDom': '<"button-div"B><"H"lfr>t<"F"ip>',
            'createdRow': function ( row, data, index ) {
                row.id = data[(data.length - 1)];
                $('td', row).eq(1).addClass('center');
                $('td', row).eq(2).addClass('center');
                $('td', row).eq(3).addClass('center').attr('id','haripembelian-'+ row.id);
                $('td', row).eq(4).addClass('center').editable(alamatupdatetanggalbeli,{
                    submitdata : function(value, settings) {
                        var idpembelian = row.id;
                        var jampembelianupdate = $('#jampembelian-'+ idpembelian).html();
                        return {jampembelian: jampembelianupdate,ubah: 'tanggal'};
                    },
                    name : 'tanggalbeli',
                    width : 130,
                    height : 18,
                    style   : 'margin: 0',
                    tooltip   : 'Klik untuk mengubah tanggal pembelian',
                    indicator : 'Saving...',
                    type: "datepicker",
                    datepicker: {
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: "yy-mm-dd"
                    },
                    callback : function(value, settings) {
                        var split_tanggal = value.split('-');
                        var tanggalbeli = new Date();
                        var bulan = parseInt(split_tanggal[1]) - 1;
                        tanggalbeli.setFullYear(split_tanggal[2],bulan,split_tanggal[0]);
                        var indexhari = tanggalbeli.getDay();
                        var hari = Drupal.settings.namahari[indexhari];
                        var idpembelian = row.id;
                        $('#haripembelian-'+ idpembelian).html(hari);
                    }
                }).attr('id','tglpembelian-'+ row.id);
                $('td', row).eq(5).addClass('center').editable(alamatupdatetanggalbeli,{
                    name : 'jampembelian',
                    width : 120,
                    height : 18,
                    style   : 'margin: 0;',
                    type: "timepicker",
                    submitdata : function(value, settings) {
                        var idpembelian = row.id;
                        var tglpembelianupdate = $('#tglpembelian-'+ idpembelian).html();
                        return {tanggalbeli: tglpembelianupdate,ubah: 'jam'};
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
                    tooltip   : 'Klik untuk mengubah jam pembelian',
                    indicator : 'Saving...'
                }).attr('id','jampembelian-'+ row.id);
                $('td', row).eq(6).addClass('angka');
                $('td', row).eq(7).addClass('center');
                $('td', row).eq(8).addClass('angka');
                $('td', row).eq(9).addClass('angka');
                $('td', row).eq(10).addClass('center');
                $('td', row).eq(11).addClass('center');
            },
            'aoColumnDefs': [
                { 'bSortable': false, 'aTargets': [ 0,1,4,10 ] }
            ],
            'footerCallback': function ( row, data, start, end, display ) {
                var api = this.api(), data;
                // Remove the formatting to get integer data for summation
                var intVal = function ( i ) {
                    return typeof i === 'string' ?
                        i.replace(/[\$.]/g, '')*1 :
                        typeof i === 'number' ?
                            i : 0;
                };
                // Total over all pages
                total = api
                    .column( 6 )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                // Update footer
                $( api.column( 6 ).footer() ).html(
                    'Rp. '+ addCommas(total)
                ).addClass('angka');
                total = api
                    .column( 8 )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                // Update footer
                $( api.column( 8 ).footer() ).html(
                    'Rp. '+ addCommas(total)
                ).addClass('angka');
                total = api
                    .column( 9 )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                // Update footer
                $( api.column( 9 ).footer() ).html(
                    'Rp. '+ addCommas(total)
                ).addClass('angka');
            },
        });
    }else if (tampilData == 1){
        oTable = $('#tabel_pembelian').dataTable( {
            'bJQueryUI': true,
            'bAutoWidth': false,
            'sPaginationType': 'full_numbers',
            'bInfo': true,
            'aLengthMenu': [[100, 200, 300, -1], [100, 200, 300, 'All']],
            'iDisplayLength': 100,
            'aaSorting': [[urutan, 'desc']],
            'processing': true,
            'serverSide': true,
            'ajax': Drupal.settings.basePath + 'sites/all/modules/datapelanggan/server_processing.php?request_data=penjualan2&tglawal='+ tglAwal +'&tglakhir='+ tglAkhir +'&idsupplier='+ Drupal.settings.filterId,
            buttons: [
                {
                    extend: 'colvis'
                }, 'copy', 'excel', 'print'
            ],
            'sDom': '<"button-div"B><"H"lfr>t<"F"ip>',
            'createdRow': function ( row, data, index ) {
                row.id = data[(data.length - 1)];
                $('td', row).eq(0).addClass('center');
                $('td', row).eq(3).addClass('angka');
                $('td', row).eq(4).addClass('angka');
                $('td', row).eq(5).addClass('angka');
                $('td', row).eq(6).addClass('angka');
                $('td', row).eq(7).addClass('angka');
                $('td', row).eq(8).addClass('angka');
                $('td', row).eq(9).addClass('angka');
                $('td', row).eq(10).addClass('angka');
            },
            'footerCallback': function ( row, data, start, end, display ) {
                var api = this.api(), data;
                // Remove the formatting to get integer data for summation
                var intVal = function ( i ) {
                    return typeof i === 'string' ?
                        i.replace(/[\$.]/g, '')*1 :
                        typeof i === 'number' ?
                            i : 0;
                };
                // Total over all pages
                total = api
                    .column( 8 )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                // Update footer
                $( api.column( 8 ).footer() ).html(
                    'Rp. '+ addCommas(total)
                ).addClass('angka');
                total = api
                    .column( 9 )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                // Update footer
                $( api.column( 9 ).footer() ).html(
                    'Rp. '+ addCommas(total)
                ).addClass('angka');
                total = api
                    .column( 10 )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
                // Update footer
                $( api.column( 10 ).footer() ).html(
                    'Rp. '+ addCommas(total)
                ).addClass('angka');
            },
        });
    }
}
function tampiltabelbelidetail(){
	oTable = $("#tabel_detail_pembelian").dataTable( {
		"bJQueryUI": true,
		"bAutoWidth": false,
		"bPaginate": false,
		"bLengthChange": false,
		"bInfo": false,
		"aaSorting": [[0, "asc"]],
		"sDom": '<"H"<"toolbar">fr>t<"F"ip>'
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
function delete_pembelian(idpembelian,nonota){
	var konfirmasi = confirm('Yakin ingin menghapus pembelian dengan no nota : '+ nonota +' ini...??!!');	
	if (konfirmasi){
		window.location = pathutama + 'pembelian/deletepembelian/'+ idpembelian +'?destination=pembelian/viewpembelian';	
	}
}
$(document).ready(function(){
    pathutama = Drupal.settings.basePath;
    alamatupdatetanggalbeli = pathutama + 'pembelian/updatepembelian';
	urutan = Drupal.settings.urutan;
    tampilData = Drupal.settings.tampilData;
    tglAwal = Drupal.settings.tglAwal;
    tglAkhir = Drupal.settings.tglAkhir;
	$("#dialogdetail").dialog({
		modal: true,
		width: 850,
		resizable: false,
		autoOpen: false,
		position: ["auto","auto"]
	});
	$("button").button();
	//TableToolsInit.sSwfPath = pathutama +"misc/media/datatables/swf/ZeroClipboard.swf";
	if (urutan == 1){
		$('.edit-tanggal').editable(alamatupdatetanggalbeli,{
			submitdata : function(value, settings) {
			 var idpembelian = $(this).attr('id');
			 var splitidpembelian = idpembelian.split('-');
			 idpembelian = splitidpembelian[1];
			 var jampembelianupdate = $('#jampembelian-'+ idpembelian).html();
			 return {jampembelian: jampembelianupdate,ubah: 'tanggal'};
   		},
			name : 'tanggalbeli',
			width : 130,
			height : 18,
			style   : 'margin: 0',
			tooltip   : 'Klik untuk mengubah tanggal pembelian',
	    indicator : 'Saving...',
	    type: "datepicker",
			datepicker: {
	      changeMonth: true,
	      changeYear: true,
	      dateFormat: "dd-mm-yy"
	    },
	    callback : function(value, settings) {
      	var split_tanggal = value.split('-');
      	var tanggalbeli = new Date();
      	var bulan = parseInt(split_tanggal[1]) - 1;
				tanggalbeli.setFullYear(split_tanggal[2],bulan,split_tanggal[0]);
				var indexhari = tanggalbeli.getDay();
				var hari = Drupal.settings.namahari[indexhari];
				var idpembelian = $(this).attr('id');
			 	var splitidpembelian = idpembelian.split('-');
			 	idpembelian = splitidpembelian[1];
			 	$('#haripembelian-'+ idpembelian).html(hari);
     	}
	  });
	  $('.edit-jam').editable(alamatupdatetanggalbeli,{
			name : 'jampembelian',
			width : 120,
			height : 18,
			style   : 'margin: 0;',
			type: "timepicker",
			submitdata : function(value, settings) {
			 var idpembelian = $(this).attr('id');
			 var splitidpembelian = idpembelian.split('-');
			 idpembelian = splitidpembelian[1];
			 var tglpembelianupdate = $('#tglpembelian-'+ idpembelian).html();
			 return {tanggalbeli: tglpembelianupdate,ubah: 'jam'};
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
			tooltip   : 'Klik untuk mengubah jam pembelian',
	    indicator : 'Saving...'
	  });
	}
	tampiltabelbeli();
	$("#tgl1").datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: "dd-mm-yy"
	});
	$("#tgl2").datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: "dd-mm-yy"
	});
})