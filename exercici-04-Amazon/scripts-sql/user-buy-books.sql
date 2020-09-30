start transaction;
	insert into invoice (idInvoice, invoiceNumber, `date`, idUser, total)
		values (1, 345682092, '2019-05-25', 1, 0.00);

	insert into detail (idBook, idInvoice, amount, subtotal) values
		(1, 1, 2, 35.70);
	insert into detail (idBook, idInvoice, amount, subtotal) values
		(2, 1, 1, 24.90);
commit; 

start transaction;
	insert into invoice (idInvoice, invoiceNumber, `date`, idUser, total) values
		(2, 345682093, '2019-05-25', 2, 0.00);

	insert into detail (idBook, idInvoice, amount, subtotal) values
		(3, 2, 2, 29.90);

	insert into detail (idBook, idInvoice, amount, subtotal) values
		(4, 2, 1, 17.90);
commit; 
