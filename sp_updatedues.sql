CREATE OR REPLACE PROCEDURE sp_updateDues()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE borrower_details as b 
	set due_amount=b.due_amount + s.books_exceded_dd*5
	FROM (SELECT student_id,sum(books_exceded_dd) as books_exceded_dd FROM 
		  (SELECT book_id,student_id,sum(Current_date-due_date) as books_exceded_dd 
		  FROM book_loaned_details 
		  WHERE due_date<(SELECT CURRENT_DATE) and returned_date is NULL
		  GROUP BY book_id,student_id) GROUP BY student_id) as s
	where b.student_id=s.student_id;
END;$$