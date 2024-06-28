CREATE OR REPLACE PROCEDURE sp_archive_book_loaned_details()
LANGUAGE plpgsql
AS
$$
BEGIN
	INSERT INTO archive_book_loaned_details 
		SELECT * FROM book_loaned_details WHERE returned_date IS NOT NULL;
	
	DELETE FROM book_loaned_details WHERE returned_date IS NOT NULL;
END
$$;