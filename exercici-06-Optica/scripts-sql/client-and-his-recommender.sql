select concat(c1.firstName, ' ', c1.lastName) as 'Client', concat(c2.firstName, ' ', c2.lastName) as 'Recommender'
from client c1
left outer join client c2
on c2.idClient = c1.recommendedBy_idClient; 
