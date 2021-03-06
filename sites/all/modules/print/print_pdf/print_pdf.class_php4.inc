<?php

/**
 * @file
 * Extend the TCPDF class to be able to customize the Footer (PHP4 version)
 *
 * This file is included by the _print_pdf_tcpdf function when the current
 * PHP_VERSION is less than 5.0.0
 *
 * @ingroup print
 */

class PrintTCPDF extends TCPDF {
  var $footer;

  // Page footer data
  function SetFooterData($arg = '') {
    $this->footer = $arg;
  }

  // Page footer
  function Footer() {
    $this = theme('print_pdf_tcpdf_footer2', $this);
  }
}
