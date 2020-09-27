/*
* I can't delete a person who bought a painting, because of referential integrity
*/
delete from Buyer
where dni = '75849302D'; 
