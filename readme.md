<b>DATABASE ENGINEER CAPSTONE PROJECT</b>

<b>Module 1 - Exercise: Create an ER diagram data model and implement it in MySQL </b>
<b>Task 1: </b>In this task, you need to create a normalized ER diagram (that adheres to 1NF, 2NF and 3NF) with relevant relationships to meet the data requirements of Little Lemon.
![image](https://github.com/user-attachments/assets/6f432fae-e857-4c8a-88bc-cb0d87326153)

<b>Task 2: In this second task, you need to implement the Little Lemon data model inside your MySQL server.</b>

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(100) NULL,
  `ContactNumber` VARCHAR(15) NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATE NULL,
  `TableNumber` INT NULL,
  `CustomerID` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `StaffID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(100) NULL,
  `ContactNumber` VARCHAR(15) NULL,
  `Email` VARCHAR(255) NULL,
  `Role` VARCHAR(255) NULL,
  `Salary` DECIMAL(10,2) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MenuItems` (
  `MenuItemsID` INT NOT NULL,
  `CourseName` VARCHAR(255) NULL,
  `StarterName` VARCHAR(255) NULL,
  `DesertName` VARCHAR(255) NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menu` (
  `MenuID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `MenuItemsID` INT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `MenuItemsID_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `MenuItemsID`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `mydb`.`MenuItems` (`MenuItemsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `OrderID` INT NULL,
  `DeliveryDate` DATE NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderID` INT NOT NULL,
  `Date` DATE NULL,
  `Quantity` INT NULL,
  `Cost` DECIMAL(10,2) NULL,
  `BookingID` INT NULL,
  `CustomerID` INT NULL,
  `StaffID` INT NULL,
  `MenuID` INT NULL,
  `DeliveryID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `BookingID_idx` (`BookingID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `DeliveryID_idx` (`DeliveryID` ASC) VISIBLE,
  CONSTRAINT `BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `mydb`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `mydb`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DeliveryID`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `mydb`.`Delivery` (`DeliveryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

<b>Task 3:  </b> In the third and final task, you need to show the databases in the MySQL server. Write a SQL code inside MySQL Workbench SQL editor to show all your databases in MySQL server.
![image](https://github.com/user-attachments/assets/34081c09-454b-4c04-a209-0f015d40794a)

<b>Module 2: </b> Exercise: Create a virtual table to summarize data
Little Lemon needs to retrieve data from their database. You can use your knowledge of MySQL to help them. As part of this task, you need to:
- Create a virtual table to summarize data.
- Use a JOIN statement to query data from multiple tables.
- Create a SQL statement with a subquery.
  
<b>Task 1: </b> In the first task, Little Lemon need you to create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 
![image](https://github.com/user-attachments/assets/4dbbfd80-fca2-4035-8129-7d5384aa3359)

<b>Task 2: </b> For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause: 
- Customers table: The customer id and full name.
- Orders table: The order id and cost.
- Menus table: The menus name.
- MenusItems table: course name and starter name.
The result set should be sorted by the lowest cost amount.
![image](https://github.com/user-attachments/assets/a19643eb-c301-4c91-a243-c6f91b56f09d)

<b>Task 3: </b>For the third and final task, Little Lemon need you to find all menu items for which more than 2 orders have been placed. You can carry out this task by creating a subquery that lists the menu names from the menus table for any order quantity with more than 2.
Here’s some guidance around completing this task: 
- Use the ANY operator in a subquery
- The outer query should be used to select the menu name from the menus table.
- The inner query should check if any item quantity in the order table is more than 2.

![image](https://github.com/user-attachments/assets/e6e21a26-3880-4660-a23b-51cf45e9de3a)

<b>Module 2: </b>Exercise: Create optimized queries to manage and analyze data

<b>Task 1: </b> In this first task, Little Lemon need you to create a procedure that displays the maximum ordered quantity in the Orders table. 
Creating this procedure will allow Little Lemon to reuse the logic implemented in the procedure easily without retyping the same code over again and again to check the maximum quantity. 
![image](https://github.com/user-attachments/assets/d6cbe197-d30d-474f-88ce-d4e03d6095ac)


You can call the procedure GetMaxQuantity.

![image](https://github.com/user-attachments/assets/ee1e526f-03e8-4e1a-bb04-2817d407bf68)

<b>Task 2: </b> In the second task, Little Lemon need you to help them to create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.
The prepared statement should accept one input argument, the CustomerID value, from a variable. 
The statement should return the order id, the quantity and the order cost from the Orders table. 


Once you create the prepared statement, you can create a variable called id and assign it value of 1. 

![image](https://github.com/user-attachments/assets/cb5cacba-a988-4203-ba51-3a0bef833253)

<b>Task 3: </b>Your third and final task is to create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.
Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement.



![image](https://github.com/user-attachments/assets/ca1ee25c-79fe-4f4a-973d-e2273aa83d09)

<b>Module 2: </b> Exercise: Create SQL queries to check available bookings based on user input

<b>Task 1: </b> Little Lemon wants to populate the Bookings table of their database with some records of data. Your first task is to replicate the list of records in the following table by adding them to the Little Lemon booking table.
![image](https://github.com/user-attachments/assets/49460413-af13-4816-ad76-59ecd44f18f4)
<br/>
<b>Task 2: </b> For your second task, Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.
The procedure should have two input parameters in the form of booking date and table number. You can also create a variable in the procedure to check the status of each table.<br/>
![image](https://github.com/user-attachments/assets/8c522a3a-49ad-4453-a0ee-76d9bf61063e)

<b>Task 3: </b>For your third and final task, Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name. 
Since integrity is not optional, Little Lemon need to ensure that every booking attempt includes these verification and decline steps. However, implementing these steps requires a stored procedure and a transaction. 
To implement these steps, you need to create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.  

![image](https://github.com/user-attachments/assets/56143bb7-b801-4a62-ae99-12dd6329a191)

<b>Module 2: </b>Exercise: Create SQL queries to add and update bookings

<b>Task 1: </b>In this first task you need to create a new procedure called AddBooking to add a new table booking record.
The procedure should include four input parameters in the form of the following bookings parameters:
- booking id, 
- customer id, 
- booking date,
- and table number.

![image](https://github.com/user-attachments/assets/8f064f61-adab-46e9-981c-b9889e7a97dc)

<b>Task 2: </b> For your second task, Little Lemon need you to create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.
The procedure should have two input parameters in the form of booking id and booking date. You must also include an UPDATE statement inside the procedure. 

![image](https://github.com/user-attachments/assets/77e68e7b-5451-48fc-9a91-d56012fc3e9a)

<b>Task 3: </b> For the third and final task, Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or remove a booking.
The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure. 

![image](https://github.com/user-attachments/assets/a1f9a474-94b2-41e2-810a-c3a8e72a32a3)

<b>Module 3: </b> Exercise: Create interactive dashboard for sales and profits

<b>Task 1: </b>In the first task, you need to create a bar chart that shows customers sales and filter data based on sales with at least $70.
![image](https://github.com/user-attachments/assets/fbb1ca09-a5f6-4944-9f06-49b9e534234c)

<b>Task 2: </b>In the second task, you need to create a line chart to show the sales trend from 2019 to 2022. 
![image](https://github.com/user-attachments/assets/70cac26a-eb36-4f8c-a92d-ec728dca7e8d)

<b>Task 3: </b>In the third task, you need to create a Bubble chart of sales for all customers. The chart should show the names of all customers. Once you roll over a bubble, the chart should show the name, profit and sale.
![image](https://github.com/user-attachments/assets/6e4eaaf7-e5a1-412a-9293-ba11d0b3b673)

<b>Task 4: </b>In this task, you need to compare the sales of the three different cuisines sold at Little Lemon. Create a Bar chart that shows the sales of the Turkish, Italian and Greek cuisines.
You need to display sales data for 2020, 2021, and 2022 only. Each bar should display the profit of each cuisine. 

![image](https://github.com/user-attachments/assets/a8e2427b-1841-4898-990b-5887f09f2665)

<b>Task 5: </b>In this final task, you need to create an interactive dashboard that combines the Bar chart called Customers sales and the Sales Bubble Chart. Once you click a bar, and roll over the related bubble, the name, sales and profit figures should be displayed in the Bubble chart as shown below.
![image](https://github.com/user-attachments/assets/39170dda-287b-44b3-bf37-06adbd29ec6f)
![image](https://github.com/user-attachments/assets/321f9573-91f3-48b6-8475-4505b45b3cb3)
<b>Module 3: </b> Exercise: Set up the client project / Exercise: Add query functions
![image](https://github.com/user-attachments/assets/709a6344-6308-408e-a32e-fc9b92fe852d)
