create database transaction_db;
select database();
use transaction_db;
select database();

-- Create the Accounts Table
CREATE TABLE accounts (
    account_id VARCHAR(10) PRIMARY KEY,
    account_name VARCHAR(50),
    balance DECIMAL(10, 2)
);

-- Insert Sample Data into Accounts Table
INSERT INTO accounts (account_id, account_name, balance) VALUES
('A', 'John Doe', 1000.00),
('B', 'Jane Smith', 1500.00),
('C', 'Mike Johnson', 500.00);

-- Create the Inventory Table
CREATE TABLE inventory (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(50),
    quantity INT
);

-- Insert Sample Data into Inventory Table
INSERT INTO inventory (product_id, product_name, quantity) VALUES
('X', 'Product X', 20),
('Y', 'Product Y', 50),
('Z', 'Product Z', 30);

-- Create the Purchases Table
CREATE TABLE purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id VARCHAR(10),
    quantity INT,
    purchase_date DATETIME,
    FOREIGN KEY (product_id) REFERENCES inventory(product_id)
);

-- Insert Sample Data into Purchases Table
INSERT INTO purchases (product_id, quantity, purchase_date) VALUES
('X', 5, '2024-08-21 10:00:00'),
('Y', 10, '2024-08-21 11:00:00');

select * from accounts;

select * from inventory;

select * from purchases;

show tables;

select constraint_name, table_name, column_name, referenced_table_name, referenced_column_name from
information_schema.key_column_usage where 
referenced_column_name is not null and table_name="purchases" and table_schema="transaction_db";

select * from inventory;

select * from purchases;

delimiter $$

create procedure correct_purchase()

begin

      start transaction;
      
      update inventory
      set quantity=quantity+5 where product_id="X";
      
      delete from purchases
      where product_id="X" and quantity=5;
      
      update inventory
      set quantity=quantity-2 where product_id="X";
      
      insert into purchases(product_id, quantity, purchase_date) values
      ("X", 2, now());
      
      commit;

end $$

delimiter ;

call correct_purchase();

delimiter $$

create procedure process_purchase()

begin

      declare stock int;
      
      start transaction;
      
      select quantity into stock from inventory where product_id="Y";
      
      if stock>=25 then
      
         update inventory
		 set quantity=quantity-25 where product_id="Y";
         
         insert into purchases(product_id, quantity, purchase_date) values
         ("Y", 25, now());
         
         commit;
         
	  else 
      
         rollback;
         
	  end if;

end $$;

delimiter ;

call process_purchase();

select * from inventory;

select * from purchases;

delimiter $$

create procedure transfer_funds()

begin
 
       start transaction;
       
       update accounts set balance=balance-100 where account_id="A";
       
       savepoint savepoint1;
       
       update accounts set balance=balance-100 where account_id="B";
       
       rollback to savepoint1;
       
       commit;
       
end$$;

delimiter ;

call transfer_funds();

select * from accounts;