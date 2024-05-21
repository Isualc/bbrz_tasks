-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               8.0.30 - MySQL Community Server - GPL
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für tem_uebung
CREATE DATABASE IF NOT EXISTS `tem_uebung` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tem_uebung`;

-- Exportiere Struktur von Tabelle tem_uebung.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportiere Daten aus Tabelle tem_uebung.orders: ~12 rows (ungefähr)
INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `total_amount`) VALUES
	(1, 1, '2024-04-05', 2200.00),
	(2, 2, '2024-04-10', 1200.00),
	(3, 3, '2024-04-15', 550.00),
	(4, 4, '2024-04-20', 1000.00),
	(5, 5, '2024-04-25', 400.00),
	(6, 6, '2024-04-30', 750.00),
	(7, 7, '2024-05-05', 300.00),
	(8, 8, '2024-05-10', 900.00),
	(9, 9, '2024-05-15', 150.00),
	(10, 10, '2024-05-20', 2000.00),
	(11, 1, '2024-05-20', 150.00),
	(12, 2, '2024-04-30', 400.00);

-- Exportiere Struktur von Tabelle tem_uebung.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportiere Daten aus Tabelle tem_uebung.order_items: ~15 rows (ungefähr)
INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
	(1, 1, 1, 2, 1200.00),
	(2, 1, 3, 1, 150.00),
	(3, 2, 2, 1, 800.00),
	(4, 3, 3, 2, 150.00),
	(5, 4, 4, 1, 400.00),
	(6, 4, 5, 2, 250.00),
	(7, 5, 6, 1, 100.00),
	(8, 6, 7, 2, 50.00),
	(9, 7, 8, 1, 200.00),
	(10, 8, 9, 1, 150.00),
	(11, 9, 10, 1, 800.00),
	(12, 10, 1, 3, 1200.00),
	(13, 10, 2, 1, 800.00),
	(14, 10, 3, 1, 150.00),
	(15, 10, 4, 2, 400.00);

-- Exportiere Struktur von Tabelle tem_uebung.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportiere Daten aus Tabelle tem_uebung.products: ~10 rows (ungefähr)
INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `stock_quantity`) VALUES
	(1, 'Laptop', '15-inch 8GB RAM 512GB SSD', 1200.00, 50),
	(2, 'Smartphone', '6.5-inch 128GB storage 5G', 800.00, 100),
	(3, 'Headphones', 'Noise-canceling over-ear', 150.00, 30),
	(4, 'Tablet', '10-inch 64GB storage WiFi', 400.00, 80),
	(5, 'Monitor', '24-inch Full HD LED', 250.00, 60),
	(6, 'Keyboard', 'Mechanical RGB backlighting', 100.00, 50),
	(7, 'Mouse', 'Wireless ergonomic design', 50.00, 70),
	(8, 'Printer', 'Color inkjet WiFi-enabled', 200.00, 40),
	(9, 'Smartwatch', 'Fitness tracker heart rate monitor', 150.00, 90),
	(10, 'Camera', 'Mirrorless 24MP 4K video', 800.00, 30);

-- Exportiere Struktur von Tabelle tem_uebung.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `review_text` text,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reviews_chk_1` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportiere Daten aus Tabelle tem_uebung.reviews: ~11 rows (ungefähr)
INSERT INTO `reviews` (`review_id`, `product_id`, `user_id`, `rating`, `review_text`, `review_date`) VALUES
	(1, 1, 1, 4, 'Great laptop fast delivery!', '2024-04-06'),
	(2, 2, 2, 5, 'Amazing smartphone highly recommended.', '2024-04-11'),
	(3, 3, 3, 4, 'Good quality headphones.', '2024-04-16'),
	(4, 4, 4, 3, 'Decent tablet good value for money.', '2024-04-21'),
	(5, 5, 5, 5, 'Excellent monitor crisp display.', '2024-04-26'),
	(6, 6, 6, 4, 'Love the keyboard feels great to type on.', '2024-05-01'),
	(7, 7, 7, 3, 'Mouse works fine but scroll wheel feels loose.', '2024-05-06'),
	(8, 8, 8, 4, 'Printer prints well easy setup.', '2024-05-11'),
	(9, 9, 9, 5, 'Smartwatch tracks accurately comfortable to wear.', '2024-05-16'),
	(10, 10, 10, 4, 'Camera takes excellent photos and videos.', '2024-05-21'),
	(11, 1, 2, 2, 'Laptop is good', '2024-05-21');

-- Exportiere Struktur von Tabelle tem_uebung.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `registration_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportiere Daten aus Tabelle tem_uebung.users: ~10 rows (ungefähr)
INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `registration_date`) VALUES
	(1, 'john_doe', 'john@example.com', 'hashed_password', '2023-01-14 23:00:00'),
	(2, 'jane_smith', 'jane@example.com', 'hashed_password', '2023-02-19 23:00:00'),
	(3, 'mike_jackson', 'mike@example.com', 'hashed_password', '2023-03-09 23:00:00'),
	(4, 'sarah_williams', 'sarah@example.com', 'hashed_password', '2023-04-04 22:00:00'),
	(5, 'chris_evans', 'chris@example.com', 'hashed_password', '2023-05-11 22:00:00'),
	(6, 'emily_taylor', 'emily@example.com', 'hashed_password', '2023-06-17 22:00:00'),
	(7, 'david_brown', 'david@example.com', 'hashed_password', '2023-07-24 22:00:00'),
	(8, 'lisa_thompson', 'lisa@example.com', 'hashed_password', '2023-08-29 22:00:00'),
	(9, 'steve_morris', 'steve@example.com', 'hashed_password', '2023-09-06 22:00:00'),
	(10, 'amanda_hill', 'amanda@example.com', 'hashed_password', '2023-10-14 22:00:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
