<?php

function data_pekerja(){
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
    $filePath = base_path().file_directory_path();
    drupal_add_js(
        array(
            'filePath'  => $filePath,
        ),
        'setting'
    );
    $js_path = drupal_get_path('module','datapekerja').'/js/datapekerja.js';
    drupal_add_js($js_path);
    $viewtabelpekerja = '<form id="formpekerja" action="'.base_path().'simpanpekerja" method="post"><div id="formplace">';
    $viewtabelpekerja .= '<label>PEKERJA</label><input class=\"validate[required]\" type="text" id="pekerja" name="pekerja">';
    $viewtabelpekerja .= '<label>ALAMAT</label><input type="text" id="alamat" name="alamat">';
    $viewtabelpekerja .= '<label>TELP/HP</label><input type="text" id="telepon" name="telepon">';
    $viewtabelpekerja .= '<button>Tambah Pekerja</button></div></form>';
    $viewtabelpekerja .= '<div style="width: 80%;">'.tabel_pekerja().'</div>';
    return $viewtabelpekerja;
}

function tabel_pekerja(){
    $tabelpekerja ='<table cellpadding="0" cellspacing="0" border="0" class="display" id="tabel_pekerja">';
    $tabelpekerja .= '<thead>';
    $tabelpekerja .= '<tr>';
    $tabelpekerja .= '<th>PEKERJA</th>';
    $tabelpekerja .= '<th>ALAMAT</th>';
    $tabelpekerja .= '<th style="width: 150px;">TELP/HP</th>';
    $tabelpekerja .= '</tr>';
    $tabelpekerja .= '</thead>';
    $tabelpekerja .= '<tbody>';
    $result = db_query("SELECT id,telepon,nama,alamat FROM {datapekerja} ORDER BY nama");
    while ($data = db_fetch_object($result)){
        $tabelpekerja .= '<tr id="'.$data->id.'">';
        $tabelpekerja .= '<td class="editable">'.$data->nama.'</td>';
        $tabelpekerja .= '<td class="editable">'.$data->alamat.'</td>';
        $tabelpekerja .= '<td class="editable">'.$data->telepon.'</td>';
        $tabelpekerja .= '</tr>';
    }
    $tabelpekerja .= '</tbody>';
    $tabelpekerja .= '</table>';
    return $tabelpekerja;
}

function simpan_pekerja()
{
    global $user;
    if ($_POST["pekerja"]) {
        $created = time();
        $changed = time();
        db_query("INSERT INTO {datapekerja} (telepon,nama,alamat,created, changed,uid) 
        VALUES('%s','%s','%s','%d','%d','%d')",
            strtoupper($_POST["telepon"]), $_POST["pekerja"], $_POST["alamat"], $created, $changed, $user->uid);
        drupal_goto("datapekerja");
    }else{
        drupal_set_message('Nama Pekerja Wajib Diisi...!!!','error');
        return 'Error';
    }
    exit();
}

function update_pekerja(){
    $NILAI = $_POST['value'];
    $KOLOM = $_POST['kol_id'];
    $PEKERJA_ID = $_POST['row_id'];
    if ($KOLOM == "0"){
        $NILAI = strtoupper($NILAI);
        $sql_update = "UPDATE {datapekerja} SET nama='%s' WHERE id='%d'";
    }elseif ($KOLOM == "2"){
        $sql_update = "UPDATE {datapekerja} SET telepon='%s' WHERE id='%d'";
    }elseif ($KOLOM == "1"){
        $sql_update = "UPDATE {datapekerja} SET alamat='%s' WHERE id='%d'";
    }
    db_query($sql_update,$NILAI,$PEKERJA_ID);
    echo $NILAI;
    exit();
}