select Seat.idSeat, Plane.model, Plane.capacity
from Plane inner join Seat
    on Plane.idPlane = Seat.idPlane
where Plane.model = "LATIN-V7";

select Seat.idSeat, Plane.model, Plane.capacity
from Plane inner join Seat
    on Plane.idPlane = Seat.idPlane
where Plane.model = "QUERTY-S5";
