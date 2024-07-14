-- Variables
-- User defined variables 
set @name_var = "swayam";
select @name_var;

use employeer;
select @max_salary := Max(salary) from workers;
select first_name, last_name,salary from workers where salary = @max_salary;

-- if undeclared values it will give null e.g:
select @var1;

-- Local Variables

DELIMITER //

CREATE PROCEDURE Test()  
BEGIN  
    DECLARE A INT DEFAULT 100;  
    DECLARE B INT;  
    DECLARE C INT;  
    DECLARE D INT;  
    
    SET B = 90;  
    SET C = 45;  
    SET D = A + B - C;  
    
    SELECT A, B, C, D;  
END //

DELIMITER ;
-- DELIMITER //: Changes the statement delimiter from ; to // to allow the use of semicolons within the procedure body.

call test();

-- SYSTEM VARIABLES

-- System variables are a special class to all program units, 
-- which contains predefined variables. MySQL contains various system variables that configure its operation, and each system variable contains a default value. 

SHOW VARIABLES;
-- SHOWS ALL THE SYSTEM VARIABLES PRESENT

