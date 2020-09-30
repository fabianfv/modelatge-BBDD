select firstName, lastName, brandName, frameType, gradLeft as 'left graduation', gradRight as 'right graduation', price
from client c
inner join employee_glass eg
on c.idClient = eg.idClient
inner join glass g
on eg.idGlass = g.idGlass
inner join brand b
on g.idBrand = b.idBrand; 
