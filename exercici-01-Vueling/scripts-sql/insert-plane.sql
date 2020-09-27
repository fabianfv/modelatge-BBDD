/*
* Avoiding auto increment
*/

INSERT INTO `Exercise_1_Vueling`.`Plane` (`idPlane`, `capacity`,`model`) VALUES ('1', 5, 'QUERTY-S5');
INSERT INTO `Exercise_1_Vueling`.`Plane` (`idPlane`, `capacity`,`model`) VALUES ('2', 7, 'LATIN-V7');

/*
* Truly INT?
*/

INSERT INTO `Exercise_1_Vueling`.`Plane` (`idPlane`, `capacity`,`model`) VALUES ('-7', 11, 'QUERTY-B11');


INSERT INTO `Exercise_1_Vueling`.`Plane` (`idPlane`, `capacity`,`model`) VALUES (0, 15, 'LATIN-V15');
INSERT INTO `Exercise_1_Vueling`.`Plane` (`idPlane`, `capacity`,`model`) VALUES ('6', 18, 'QUERTY-F18');


/*
* Using auto increment
*/

INSERT INTO `Exercise_1_Vueling`.`Plane` (`capacity`,`model`) VALUES (1734, 'Enterprise-V8');
INSERT INTO `Exercise_1_Vueling`.`Plane` (`capacity`,`model`) VALUES (380, 'AMPLE-Z4');

