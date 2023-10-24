CREATE TABLE `clientes`(
    `individualClient_id` BIGINT NOT NULL,
    `equipoCliente_id` BIGINT NOT NULL,
    `id` BIGINT NOT NULL
);
CREATE TABLE `registro`(
    `cliente_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `carritoShop_id` BIGINT NOT NULL,
    `factura_id` BIGINT NOT NULL
);
CREATE TABLE `inventario`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `stock` TEXT NOT NULL,
    `pro_limits` TEXT NOT NULL,
    `pro_unlimits` TEXT NOT NULL
);
CREATE TABLE `carritoShop`(
    `carShop_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `productosShopLimit_id` BIGINT NOT NULL,
    `productosShopUnlimit_id` BIGINT NOT NULL
);
CREATE TABLE `pedido`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `producto_id` BIGINT NOT NULL,
    `factura_id` BIGINT NOT NULL
);
CREATE TABLE `Cliente individual`(
    `clienteIndividual_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre` LONGTEXT NOT NULL,
    `telefono` BIGINT NOT NULL,
    `carShop_id` BIGINT NOT NULL
);
CREATE TABLE `cliente equipos`(
    `clienteEquipo_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nameEquipo` TEXT NOT NULL,
    `jugadores` BIGINT NOT NULL,
    `carShop_id` BIGINT NOT NULL
);
CREATE TABLE `promosiones`(
    `promosion_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `descuentoXJugador` BIGINT NOT NULL
);
CREATE TABLE `factura_id`(
    `cliente_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `telefono` BIGINT NOT NULL,
    `pedido_id` BIGINT NOT NULL
);
ALTER TABLE
    `pedido` ADD CONSTRAINT `pedido_producto_id_foreign` FOREIGN KEY(`producto_id`) REFERENCES `inventario`(`id`);
ALTER TABLE
    `carritoShop` ADD CONSTRAINT `carritoshop_productosshopunlimit_id_foreign` FOREIGN KEY(`productosShopUnlimit_id`) REFERENCES `inventario`(`pro_unlimits`);
ALTER TABLE
    `registro` ADD CONSTRAINT `registro_carritoshop_id_foreign` FOREIGN KEY(`carritoShop_id`) REFERENCES `carritoShop`(`carShop_id`);
ALTER TABLE
    `cliente equipos` ADD CONSTRAINT `cliente equipos_jugadores_foreign` FOREIGN KEY(`jugadores`) REFERENCES `promosiones`(`descuentoXJugador`);
ALTER TABLE
    `clientes` ADD CONSTRAINT `clientes_equipocliente_id_foreign` FOREIGN KEY(`equipoCliente_id`) REFERENCES `cliente equipos`(`clienteEquipo_id`);
ALTER TABLE
    `pedido` ADD CONSTRAINT `pedido_factura_id_foreign` FOREIGN KEY(`factura_id`) REFERENCES `registro`(`factura_id`);
ALTER TABLE
    `cliente equipos` ADD CONSTRAINT `cliente equipos_carshop_id_foreign` FOREIGN KEY(`carShop_id`) REFERENCES `carritoShop`(`productosShopUnlimit_id`);
ALTER TABLE
    `Cliente individual` ADD CONSTRAINT `cliente individual_carshop_id_foreign` FOREIGN KEY(`carShop_id`) REFERENCES `carritoShop`(`productosShopLimit_id`);
ALTER TABLE
    `clientes` ADD CONSTRAINT `clientes_id_foreign` FOREIGN KEY(`id`) REFERENCES `factura_id`(`cliente_id`);
ALTER TABLE
    `clientes` ADD CONSTRAINT `clientes_individualclient_id_foreign` FOREIGN KEY(`individualClient_id`) REFERENCES `Cliente individual`(`clienteIndividual_id`);
ALTER TABLE
    `factura_id` ADD CONSTRAINT `factura_id_pedido_id_foreign` FOREIGN KEY(`pedido_id`) REFERENCES `pedido`(`id`);
ALTER TABLE
    `inventario` ADD CONSTRAINT `inventario_pro_unlimits_foreign` FOREIGN KEY(`pro_unlimits`) REFERENCES `promosiones`(`promosion_id`);