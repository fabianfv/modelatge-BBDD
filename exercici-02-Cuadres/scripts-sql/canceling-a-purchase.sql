/*
* Canceling a purchase
*/

UPDATE Painting
SET idBuyer = null
WHERE idPainting = 5; 
