---- constraints for table products --------

ALTER TABLE products
ADD CONSTRAINT CHK_category CHECK (category = 'Φρέσκα Προϊόντα' OR category = 'Είδη Ψυγείου', category = 'Είδη Κάβας' OR category = 'Είδη Προσωπικής Περιποίησης' OR category = 'Είδη Σπιτιού' OR category = 'Προϊόντα για Κατοικίδια')
;
---- constraints for table products --------

ALTER TABLE store
ADD CONSTRAINT CHK_city CHECK (city = 'Αθήνα' OR city = 'Βέροια' OR city = 'Θεσσαλονίκη')

---- customer age trigger -----
---IF (YEAR(new.birth_date) > (YEAR(CURRENT_DATE) - 18)) 
---THEN SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'The customer should be older than 18 years old.';
---END IF