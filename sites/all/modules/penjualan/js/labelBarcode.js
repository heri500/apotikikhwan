$(document).ready(function(){
    for (var i = 0; i < Drupal.settings.dataProduct.length;i++) {
        var barcode_number = Drupal.settings.dataProduct[i].barcode;
        JsBarcode("#barcode-" + barcode_number, barcode_number, {
            format: "ean13",
            flat: true,
            width: 1.7,
            height: 35,
            margin: 0,
            displayValue: false
        });
    }
})