var oTable;
var pathutama = '';
var pathfile = '';
function tampilkantabelpekerja(){
    oTable = $("#tabel_pekerja").dataTable( {
        "bJQueryUI": true,
        "bAutoWidth": false,
        "sPaginationType": "full_numbers",
        "bInfo": false,
        "aLengthMenu": [[100, 200, 300, -1], [100, 200, 300, "All"]],
        "iDisplayLength": 100,
        "aaSorting": [[0, "asc"]],
        "sDom": '<"space"T><"clear"><"H"lfr>t<"F"ip>'
});
}
$(document).ready(function() {
    pathutama = Drupal.settings.basePath;
    pathfile = Drupal.settings.filePath;
    TableToolsInit.sSwfPath = pathutama +"misc/media/datatables/swf/ZeroClipboard.swf";
    alamatupdate = pathutama + "updatepekerja";
    $("#tabel_pekerja tbody .editable").editable(alamatupdate, {
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
    tampilkantabelpekerja();
    $("#formpekerja").validationEngine();
    $("button").button();
})