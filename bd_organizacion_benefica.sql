-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2024 a las 16:47:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_organizacion_benefica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `subcategoria_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `stock_minimo` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `nombre`, `descripcion`, `categoria_id`, `subcategoria_id`, `cantidad`, `ubicacion`, `estado`, `fecha_registro`, `stock_minimo`) VALUES
(1, 'Pantalón mezclilla azul', 'Pantalón mezclilla color azul donado por Elias', 2, 2, 10, 'Atoyatempan', 'Usado', '2024-05-29 19:40:10', 10),
(2, 'Camisa Polo', 'Camisa Polo 100% algodón', 2, 7, 40, 'Tepeaca', 'Usado', '2024-05-31 20:27:08', 10),
(3, 'Spaguetti Ital-Pasta', 'Bolsa de Spaguetti Ital-Pasta 100 gr', 4, 8, 196, 'Atoyatempan', 'Nuevo', '2024-05-31 20:29:26', 50),
(4, 'Frijol Enlatado La Costeña', '500gr de frijol enlatado marca La Costeña', 4, 13, 40, 'Puebla', 'Nuevo', '2024-06-06 03:17:30', 50),
(5, 'Laptop HP', 'Computadora portátil marca HP ', 1, 14, 8, 'Puebla', 'Nuevo', '2024-06-28 16:11:46', 10),
(6, 'Dinero', 'Use este artículo para donaciones económicas', 6, 15, 10, 'Puebla', 'Nuevo', '2024-10-10 20:04:01', 10),
(7, 'sd', 'saf', 1, 1, 2, 'sfdf', 'Nuevo', '2024-12-04 15:46:19', 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Electrónicos'),
(2, 'Ropa'),
(3, 'Muebles'),
(4, 'Alimento'),
(5, 'Varios'),
(6, 'Dinero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donaciones`
--

CREATE TABLE `donaciones` (
  `id` int(11) NOT NULL,
  `donante` varchar(100) DEFAULT NULL,
  `fecha_donacion` date DEFAULT NULL,
  `tipo_articulo` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `articulo_id` int(11) DEFAULT NULL,
  `tipo_donacion` enum('especie','economica') NOT NULL DEFAULT 'especie',
  `monto` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `donaciones`
--

INSERT INTO `donaciones` (`id`, `donante`, `fecha_donacion`, `tipo_articulo`, `cantidad`, `motivo`, `articulo_id`, `tipo_donacion`, `monto`) VALUES
(5, 'Juan Pérez', '2024-06-04', 'Ropa', 2, NULL, 1, 'especie', NULL),
(6, 'Juan Pérez', '2024-06-04', 'Ropa', 6, NULL, 1, 'especie', NULL),
(7, 'Carmelo', '2024-06-05', 'Comida', 10, 'Niños en Atoyatempan', 4, 'especie', NULL),
(8, 'Juanito', '2024-06-28', 'Computadora', 6, NULL, 5, 'especie', NULL),
(9, 'Organizacion Caritas', '2024-06-28', 'Computadora', 3, 'Escuela Rural en la Sierra Madre', 5, 'especie', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donaciones_economicas`
--

CREATE TABLE `donaciones_economicas` (
  `id` int(11) NOT NULL,
  `tipo_transaccion` enum('Ingreso','Egreso') NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_donacion` date NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `donaciones_economicas`
--

INSERT INTO `donaciones_economicas` (`id`, `tipo_transaccion`, `monto`, `fecha_donacion`, `descripcion`) VALUES
(1, 'Ingreso', 500.00, '2024-10-10', 'Hola'),
(2, 'Egreso', 200.00, '2024-10-10', 'Tanda'),
(3, 'Ingreso', 7000.00, '2024-10-11', 'Donado por pepe'),
(4, 'Egreso', 4000.00, '2024-10-11', 'jovenes buap');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_inventario`
--

CREATE TABLE `movimientos_inventario` (
  `id` int(11) NOT NULL,
  `articulo_id` int(11) DEFAULT NULL,
  `tipo` enum('entrada','salida') DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos_inventario`
--

INSERT INTO `movimientos_inventario` (`id`, `articulo_id`, `tipo`, `cantidad`, `fecha`) VALUES
(5, 3, 'entrada', 196, '2024-06-06 03:18:36'),
(6, 4, 'entrada', 50, '2024-06-06 03:18:45'),
(7, 4, 'salida', 10, '2024-06-06 04:09:04'),
(8, 5, 'entrada', 5, '2024-06-28 16:11:46'),
(9, 5, 'entrada', 6, '2024-06-28 16:13:36'),
(10, 5, 'salida', 3, '2024-06-28 16:14:23'),
(11, 6, 'entrada', 10, '2024-10-10 20:04:01'),
(12, 7, 'entrada', 2, '2024-12-04 15:46:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `nombre`, `categoria_id`) VALUES
(1, 'Celulares', 1),
(2, 'Pantalones', 2),
(3, 'Playeras', 2),
(4, 'Zapatos', 2),
(5, 'Ropa Interior', 2),
(7, 'Camisas', 2),
(8, 'Pastas', 4),
(9, 'Lácteos', 4),
(10, 'Frutas y Verduras', 4),
(11, 'Carnes', 4),
(12, 'Cereales', 4),
(13, 'Enlatados', 4),
(14, 'Computadoras', 1),
(15, 'Dinero', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('admin','usuario') NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `contrasena`, `rol`, `fecha_registro`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$1/l4B6C0cZo.U6CCRoYP/uv9ry4F.5tFuSBzRqZnciR0G1cCqCNBy', 'admin', '2024-05-23 19:10:16');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `subcategoria_id` (`subcategoria_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `donaciones`
--
ALTER TABLE `donaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulo_id` (`articulo_id`);

--
-- Indices de la tabla `donaciones_economicas`
--
ALTER TABLE `donaciones_economicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulo_id` (`articulo_id`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `donaciones`
--
ALTER TABLE `donaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `donaciones_economicas`
--
ALTER TABLE `donaciones_economicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`subcategoria_id`) REFERENCES `subcategorias` (`id`);

--
-- Filtros para la tabla `donaciones`
--
ALTER TABLE `donaciones`
  ADD CONSTRAINT `donaciones_ibfk_1` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`);

--
-- Filtros para la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD CONSTRAINT `movimientos_inventario_ibfk_1` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`);

--
-- Filtros para la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
