select u.username as 'User',
	(select user.username
	 from user
     where user.idUser = f.idFriend
    ) as 'Friend'
from user u
inner join friend f
on u.idUser = f.idUser
where u.username = 'goku'

union all

select u.username as 'User',
	(select user.username
	 from user
     where user.idUser = f.idFriend
    ) as 'Friend username'
from user u
inner join friend f
on u.idUser = f.idUser
where u.username = 'vegeta'

union all

select u.username as 'User',
	(select user.username
	 from user
     where user.idUser = f.idFriend
    ) as 'Friend username'
from user u
inner join friend f
on u.idUser = f.idUser
where u.username = 'gohan'

union all

select u.username as 'User',
	(select user.username
	 from user
     where user.idUser = f.idFriend
    ) as 'Friend username'
from user u
inner join friend f
on u.idUser = f.idUser
where u.username = 'bulma'; 
