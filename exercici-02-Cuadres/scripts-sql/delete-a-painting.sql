/*
* I can delete a Painting even if it has a buyer
*/

delete from Painting
where idPainting = 5;

/*
* Restoring the row
*/
insert into Painting(idPainting, price, author, idBuyer) values
	(5, 385000, 'Buonarroti',
        (SELECT idBuyer
            FROM Buyer
            WHERE dni = '75849302D'
        )
	); 
