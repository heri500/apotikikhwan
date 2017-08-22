<?php
$schema['datapekerja'] = array(
    'description' => 'Data pekerja.',
    'fields' => array(
        'id' => array(
            'type' => 'serial',
            'unsigned' => TRUE,
            'not null' => TRUE,
            'description' => t('ID pekerja.'),
        ),
        'nama' => array(
            'type' => 'varchar',
            'length' => 500,
            'not null' => TRUE,
            'default' => 'Ikhwan Mart',
            'description' => t('Nama pekerja.'),
        ),
        'alamat' => array(
            'type' => 'varchar',
            'length' => 1000,
            'not null' => TRUE,
            'default' => 'Alamat Pekerja',
            'description' => t('Alamat pekerja.'),
        ),
        'telepon' => array(
            'type' => 'varchar',
            'length' => 120,
            'not null' => TRUE,
            'default' => '021-00000000',
            'description' => t('Telepon pekerja.'),
        ),
        'created' => array(
            'type' => 'int',
            'unsigned' => TRUE,
            'not null' => TRUE,
            'default' => 0,
            'description' => t('Waktu record dibuat.'),
        ),
        'changed' => array(
            'type' => 'int',
            'unsigned' => TRUE,
            'not null' => TRUE,
            'default' => 0,
            'description' => t('Waktu record diubah/edit.'),
        ),
        'uid' => array(
            'type' => 'int',
            'unsigned' => TRUE,
            'not null' => TRUE,
            'default' => 0,
            'description' => t('User ID yang membuat record.'),
        ),
    ),
    'primary key' => array('id'),
    'indexes' => array(
        'idx_nama' => array('nama'),
    ),
);

