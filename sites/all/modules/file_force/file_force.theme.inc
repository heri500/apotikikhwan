<?php

/**
 * @file file_force.theme.inc
 * 
 * File Force module.
 *
 * Theme functions used for overridden file output.
 */

/**
 * Displays file attachments in table
 *
 * @ingroup themeable
 */
function file_force_upload_attachments($files) {
  $header = array(t('Attachment'), t('Size'));
  $rows = array();
  foreach ($files as $file) {
    $file = (object)$file;
    if ($file->list && empty($file->remove)) {
      $href = file_force_create_url($file->filepath);
      $text = $file->description ? $file->description : $file->filename;
      $rows[] = array(l($text, $href, array('query' => array('download' => 1))), format_size($file->filesize));
    }
  }
  if (count($rows)) {
    return theme('table', $header, $rows, array('id' => 'attachments'));
  }
}

/**
 * Preprocess function for comment_upload's theme_comment_upload_attachments().
 */
function file_force_preprocess_comment_upload_attachments(&$variables) {
  $row = 0;
  $variables['images'] = array();
  $variables['attachments'] = array();
  foreach ($variables['files'] as $fid => $file) {
    if ($file['list'] && empty($file['remove'])) {
      $text = $file['description'] ? $file['description'] : $file['filename'];

      if ($variables['display_images'] && strpos($file['filemime'], 'image/') === 0) {
        if ($variables['preset']) {
          $variables['images'][$fid]['image'] = theme('imagecache', $variables['preset'], file_create_path($file['filepath']), $text, $text);
        }
        else {
          $variables['images'][$fid]['image'] = theme('image', file_create_path($file['filepath']), $text, $text);
        }
        $variables['images'][$fid]['url'] = check_url(file_force_create_url($file['filepath'])).'&download=1';
      }
      else {
        $variables['attachments'][$fid]['zebra'] = $row % 2 == 0 ? 'odd' : 'even';
        $variables['attachments'][$fid]['text'] = check_plain($text);
        $variables['attachments'][$fid]['url'] = check_url(file_force_create_url($file['filepath'])).'&download=1';
        $variables['attachments'][$fid]['size'] = format_size($file['filesize']);
        $row++;
      }
    }
  }
}
