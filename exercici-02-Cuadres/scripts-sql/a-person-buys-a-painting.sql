select idPainting from Painting
where author = 'Buonarroti';
/* -> 5 */

/*
* A person buys a painting
*/

UPDATE Painting
SET Painting.idBuyer =
	(SELECT idBuyer
		FROM Buyer
        WHERE dni = '75849302D'
	)
WHERE Painting.idPainting = 5; 
