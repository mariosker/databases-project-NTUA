---- constraints for table products --------

ALTER TABLE products
ADD CONSTRAINT CHK_category CHECK (category = 'Φρέσκα Προϊόντα' OR category = 'Είδη Ψυγείου', category = 'Είδη Κάβας' OR category = 'Είδη Προσωπικής Περιποίησης' OR category = 'Είδη Σπιτιού' OR category = 'Προϊόντα για Κατοικίδια')
;
---- constraints for table products --------

ALTER TABLE store
ADD CONSTRAINT CHK_city CHECK (city = 'Αθήνα' OR city = 'Βέροια' OR city = 'Θεσσαλονίκη')