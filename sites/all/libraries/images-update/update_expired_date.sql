ALTER TABLE `detailpembelian` ADD `expired_date` DATE NULL DEFAULT NULL AFTER `perubahan`;
ALTER TABLE `detailpembelian` ADD `barcode_batch` VARCHAR(255) NULL AFTER `expired_date`;
ALTER TABLE `detailpembelian` ADD `qty_sell` DOUBLE NOT NULL DEFAULT '0' AFTER `barcode_batch`;