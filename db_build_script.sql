-- drop database airport; 
create database airport;
use airport;

-- drop table PASAZER;
create table PASAZER(
id int not null auto_increment primary key,
imie varchar(20) not null,
nazwisko varchar(45) not null,
email varchar(25) not null 
);

-- drop table BAGAZ;
create table BAGAZ(
id int not null auto_increment primary key,
rodzaj int not null,
waga double not null
);

-- drop table BAGAZ_RODZAJ;
create table BAGAZ_RODZAJ(
id int not null auto_increment primary key,
nazwa varchar(20) not null,
mnoznik_cena double not null
);

-- drop table BILET;
create table BILET(
id int not null auto_increment primary key,
pasazer int not null,
bagaz int not null,
lot int not null,
miejsce int not null,
status int not null
);

-- drop table BILET_STATUS;
create table BILET_STATUS(
id int not null auto_increment primary key,
nazwa varchar(15) not null
);

-- drop table SAMOLOT;
create table SAMOLOT(
id int not null auto_increment primary key,
marka varchar(25) not null,
model varchar(15) not null
);

-- drop table MIEJSCE_SAMOLOT;
create table MIEJSCE_SAMOLOT(
id int not null auto_increment primary key,
samolot int not null,
nazwa varchar(10) not null,
klasa int not null,
rodzaj int not null
);

-- drop table MIEJSCE_SAMOLOT_KLASA;
create table MIEJSCE_SAMOLOT_KLASA(
id int not null auto_increment primary key,
nazwa varchar(20) not null,
mnoznik_cena double not null
);

-- drop table MIEJSCE_SAMOLOT_RODZAJ;
create table MIEJSCE_SAMOLOT_RODZAJ(
id int not null auto_increment primary key,
nazwa varchar(20) not null,
mnoznik_cena double not null
);

-- drop table LOT;
create table LOT(
id int not null auto_increment primary key,
lotnisko_wylot int not null,
lotnisko_przylot int not null,
data_wylot datetime not null,
samolot int not null,
cena_bazowa double not null
);

-- drop table LOTNISKO;
create table LOTNISKO(
id int not null auto_increment primary key,
nazwa varchar(50) not null,
miasto varchar(50) not null,
kraj varchar(45) not null,
kontynent varchar(25)
);

-- alter table BAGAZ
-- drop foreign key FK_BAGAZ_BAGAZ_RODZAJ
alter table BAGAZ
add constraint FK_BAGAZ_BAGAZ_RODZAJ
foreign key (rodzaj) references BAGAZ_RODZAJ(id);

-- alter table BILET
-- drop foreign key FK_BILET_PASAZER;
alter table BILET
add constraint FK_BILET_PASAZER
foreign key (pasazer) references PASAZER(id);

-- alter table BILET
-- drop foreign key FK_BILET_PASAZER;
alter table BILET
add constraint FK_BILET_BAGAZ
foreign key (bagaz) references BAGAZ(id);

-- alter table BILET
-- drop foreign key FK_BILET_LOT;
alter table BILET
add constraint FK_BILET_LOT
foreign key (lot) references LOT(id);

-- alter table BILET
-- drop foreign key FK_BILET_MIEJSCE;
alter table BILET
add constraint FK_BILET_MIEJSCE
foreign key (miejsce) references MIEJSCE_SAMOLOT(id);

-- alter table BILET
-- drop foreign key FK_BILET_BILET_STATUS;
alter table BILET
add constraint FK_BILET_BILET_STATUS
foreign key (status) references BILET_STATUS(id);

-- alter table LOT
-- drop foreign key FK_LOT_LOTNISKO_WYLOT;
alter table LOT
add constraint FK_LOT_LOTNISKO_WYLOT
foreign key (lotnisko_wylot) references LOTNISKO(id);

-- alter table LOT
-- drop foreign key FK_LOT_LOTNISKO_PRZYLOT;
alter table LOT
add constraint FK_LOT_LOTNISKO_PRZYLOT
foreign key (lotnisko_przylot) references LOTNISKO(id);

-- alter table LOT
-- drop foreign key FK_LOT_SAMOLOT;
alter table LOT
add constraint FK_LOT_SAMOLOT
foreign key (samolot) references SAMOLOT(id);

-- alter table MIEJSCE_SAMOLOT
-- drop foreign key FK_MIEJSCE_SAMOLOT_SAMOLOT;
alter table MIEJSCE_SAMOLOT
add constraint FK_MIEJSCE_SAMOLOT_SAMOLOT
foreign key (samolot) references SAMOLOT(id);

-- alter table MIEJSCE_SAMOLOT
-- drop foreign key FK_MIEJSCE_SAMOLOT_KLASA;
alter table MIEJSCE_SAMOLOT
add constraint FK_MIEJSCE_SAMOLOT_KLASA
foreign key (klasa) references MIEJSCE_SAMOLOT_KLASA(id);

-- alter table MIEJSCE_SAMOLOT
-- drop foreign key FK_MIEJSCE_SAMOLOT_RODZAJ;
alter table MIEJSCE_SAMOLOT
add constraint FK_MIEJSCE_SAMOLOT_RODZAJ
foreign key (rodzaj) references MIEJSCE_SAMOLOT_RODZAJ(id);

-- truncate table MIEJSCE_SAMOLOT_KLASA
insert into MIEJSCE_SAMOLOT_KLASA
(nazwa, mnoznik_cena) 
values
("ekonomiczna", 1),
("biznesowa", 1.75);

-- truncate table MIEJSCE_SAMOLOT_RODZAJ
insert into MIEJSCE_SAMOLOT_RODZAJ
(nazwa, mnoznik_cena) 
values
("okno", 1.5),
("srodek", 1.0),
("korytarz", 1.25);

-- truncate table BILET_STATUS
insert into BILET_STATUS
(nazwa) 
values
("stworzony"),
("zatwierdzony"),
("oplacony");

-- truncate table BAGAZ_RODZAJ
insert into BAGAZ_RODZAJ
(nazwa, mnoznik_cena)
values
("podreczny", 1.0),
("pokladowy", 2.25);

-- truncate table SAMOLOT
insert into SAMOLOT
(id, marka, model)
values
(1, "Boeing", "A-130"),
(2, "Weso", "AZW-17"),
(3,"Tupolew", "PLA-142");

-- truncate table LOTNISKO
insert into LOTNISKO 
(nazwa, miasto, kraj, kontynent)
values
("Chopin Warszawa", "Warszawa", "Polska", "Europa"),
("Lotnisko Radom", "Radom", "Polska", "Europa"),
("Lotnisko Katowice", "Katowice", "Polska", "Europa"),
("Berlin Brandenburg", "Berlin", "Niemcy", "Europa"),
("Wiedeńskie Lotnisko Międzynarodowe", "Wiedeń", "Austria", "Europa"),
("Port lotniczy Tokio-Haneda", "Tokio", "Japonia", "Azja"),
("Lotnisko Vancouver", "Kanada", "Vancouver" , "Ameryka Północna"),
("Port lotniczy Las Vegas-McCarran", "Las Vegas", "USA", "Ameryka Północna");

-- truncate table MIEJSCE_SAMOLOT
insert into MIEJSCE_SAMOLOT
(samolot, nazwa, klasa, rodzaj)
values
(1, "A-001", 1, 1),
(1, "A-002", 1, 2),
(1, "A-003", 1, 3),
(1, "A-004", 1, 1),
(1, "A-005", 1, 2),
(1, "A-006", 1, 3),
(1, "A-007", 1, 1),
(1, "A-008", 1, 2),
(1, "A-009", 1, 3),
(1, "A-010", 1, 1),
(1, "A-011", 1, 2),
(1, "A-012", 1, 3),
(1, "A-013", 1, 1),
(1, "A-014", 1, 2),
(1, "A-015", 1, 3),
(1, "A-016", 1, 1),
(1, "A-017", 1, 2),
(1, "A-018", 1, 3),
(1, "A-019", 1, 1),
(1, "A-020", 1, 2),
(1, "A-021", 1, 3),
(1, "A-022", 1, 1),
(1, "A-023", 1, 2),
(1, "A-024", 1, 3),
(1, "A-025", 1, 1),
(1, "A-026", 1, 2),
(1, "A-027", 1, 3),
(1, "A-028", 1, 1),
(1, "A-029", 1, 2),
(1, "A-030", 1, 3),
(1, "A-031", 1, 1),
(1, "A-032", 1, 2),
(1, "A-033", 1, 3),
(1, "A-034", 1, 1),
(1, "A-035", 1, 2),
(1, "A-036", 1, 3),
(1, "A-037", 1, 1),
(1, "A-038", 1, 2),
(1, "A-039", 1, 3),
(1, "A-040", 1, 1),
(1, "A-041", 1, 2),
(1, "A-042", 1, 3),
(1, "A-043", 1, 1),
(1, "A-044", 1, 2),
(1, "A-045", 1, 3),
(1, "A-046", 1, 1),
(1, "A-047", 1, 2),
(1, "A-048", 1, 3),
(1, "A-049", 1, 1),
(1, "A-050", 1, 2),
(1, "A-051", 1, 3),
(1, "A-052", 1, 1),
(1, "A-053", 1, 2),
(1, "A-054", 1, 3),
(1, "A-055", 1, 1),
(1, "A-056", 1, 2),
(1, "A-057", 1, 3),
(1, "A-058", 1, 1),
(1, "A-059", 1, 2),
(1, "A-060", 1, 3),
(1, "A-061", 2, 1),
(1, "A-062", 2, 2),
(1, "A-063", 2, 3),
(1, "A-064", 2, 1),
(1, "A-065", 2, 2),
(1, "A-066", 2, 3),
(1, "A-067", 2, 1),
(1, "A-068", 2, 2),
(1, "A-069", 2, 3),
(1, "A-070", 2, 1),
(1, "A-071", 2, 2),
(1, "A-072", 2, 3),
(1, "A-073", 2, 1),
(1, "A-074", 2, 2),
(1, "A-075", 2, 3),
(1, "A-076", 2, 1),
(1, "A-077", 2, 2),
(1, "A-078", 2, 3),
(1, "A-079", 2, 1),
(1, "A-080", 2, 2),
(1, "A-081", 2, 3),
(1, "A-082", 2, 1),
(1, "A-083", 2, 2),
(1, "A-084", 2, 3),
(1, "A-085", 2, 1),
(1, "A-086", 2, 2),
(1, "A-087", 2, 3),
(1, "A-088", 2, 1),
(1, "A-089", 2, 2),
(1, "A-090", 2, 3),
(2, "A-001", 1, 1),
(2, "A-002", 1, 2),
(2, "A-003", 1, 3),
(2, "A-004", 1, 1),
(2, "A-005", 1, 2),
(2, "A-006", 1, 3),
(2, "A-007", 1, 1),
(2, "A-008", 1, 2),
(2, "A-009", 1, 3),
(2, "A-010", 1, 1),
(2, "A-011", 1, 2),
(2, "A-012", 1, 3),
(2, "A-013", 1, 1),
(2, "A-014", 1, 2),
(2, "A-015", 1, 3),
(2, "A-016", 1, 1),
(2, "A-017", 1, 2),
(2, "A-018", 1, 3),
(2, "A-019", 1, 1),
(2, "A-020", 1, 2),
(2, "A-021", 1, 3),
(2, "A-022", 1, 1),
(2, "A-023", 1, 2),
(2, "A-024", 1, 3),
(2, "A-025", 1, 1),
(2, "A-026", 1, 2),
(2, "A-027", 1, 3),
(2, "A-028", 1, 1),
(2, "A-029", 1, 2),
(2, "A-030", 1, 3),
(2, "A-031", 1, 1),
(2, "A-032", 1, 2),
(2, "A-033", 1, 3),
(2, "A-034", 1, 1),
(2, "A-035", 1, 2),
(2, "A-036", 1, 3),
(2, "A-037", 1, 1),
(2, "A-038", 1, 2),
(2, "A-039", 1, 3),
(2, "A-040", 1, 1),
(2, "A-041", 1, 2),
(2, "A-042", 1, 3),
(2, "A-043", 1, 1),
(2, "A-044", 1, 2),
(2, "A-045", 1, 3),
(2, "A-046", 1, 1),
(2, "A-047", 1, 2),
(2, "A-048", 1, 3),
(2, "A-049", 1, 1),
(2, "A-050", 1, 2),
(2, "A-051", 1, 3),
(2, "A-052", 1, 1),
(2, "A-053", 1, 2),
(2, "A-054", 1, 3),
(2, "A-055", 1, 1),
(2, "A-056", 1, 2),
(2, "A-057", 1, 3),
(2, "A-058", 1, 1),
(2, "A-059", 1, 2),
(2, "A-060", 1, 3),
(2, "A-061", 2, 1),
(2, "A-062", 2, 2),
(2, "A-063", 2, 3),
(2, "A-064", 2, 1),
(2, "A-065", 2, 2),
(2, "A-066", 2, 3),
(2, "A-067", 2, 1),
(2, "A-068", 2, 2),
(2, "A-069", 2, 3),
(2, "A-070", 2, 1),
(2, "A-071", 2, 2),
(2, "A-072", 2, 3),
(2, "A-073", 2, 1),
(2, "A-074", 2, 2),
(2, "A-075", 2, 3),
(2, "A-076", 2, 1),
(2, "A-077", 2, 2),
(2, "A-078", 2, 3),
(2, "A-079", 2, 1),
(2, "A-080", 2, 2),
(2, "A-081", 2, 3),
(2, "A-082", 2, 1),
(2, "A-083", 2, 2),
(2, "A-084", 2, 3),
(2, "A-085", 2, 1),
(2, "A-086", 2, 2),
(2, "A-087", 2, 3),
(2, "A-088", 2, 1),
(2, "A-089", 2, 2),
(2, "A-090", 2, 3),
(3, "A-001", 1, 1),
(3, "A-002", 1, 2),
(3, "A-003", 1, 3),
(3, "A-004", 1, 1),
(3, "A-005", 1, 2),
(3, "A-006", 1, 3),
(3, "A-007", 1, 1),
(3, "A-008", 1, 2),
(3, "A-009", 1, 3),
(3, "A-010", 1, 1),
(3, "A-011", 1, 2),
(3, "A-012", 1, 3),
(3, "A-013", 1, 1),
(3, "A-014", 1, 2),
(3, "A-015", 1, 3),
(3, "A-016", 1, 1),
(3, "A-017", 1, 2),
(3, "A-018", 1, 3),
(3, "A-019", 1, 1),
(3, "A-020", 1, 2),
(3, "A-021", 1, 3),
(3, "A-022", 1, 1),
(3, "A-023", 1, 2),
(3, "A-024", 1, 3),
(3, "A-025", 1, 1),
(3, "A-026", 1, 2),
(3, "A-027", 1, 3),
(3, "A-028", 1, 1),
(3, "A-029", 1, 2),
(3, "A-030", 1, 3),
(3, "A-031", 1, 1),
(3, "A-032", 1, 2),
(3, "A-033", 1, 3),
(3, "A-034", 2, 1),
(3, "A-035", 2, 2),
(3, "A-036", 2, 3),
(3, "A-037", 2, 1),
(3, "A-038", 2, 2),
(3, "A-039", 2, 3),
(3, "A-040", 2, 1),
(3, "A-041", 2, 2),
(3, "A-042", 2, 3),
(3, "A-043", 2, 1),
(3, "A-044", 2, 2),
(3, "A-045", 2, 3),
(3, "A-046", 2, 1),
(3, "A-047", 2, 2),
(3, "A-048", 2, 3),
(3, "A-049", 2, 1),
(3, "A-050", 2, 2);

-- truncate table LOT
insert into LOT 
(lotnisko_wylot, lotnisko_przylot, data_wylot, samolot, cena_bazowa)
values
(8, 4, "2020-12-18 12:00", 2, 1572),
(5, 6, "2021-01-05 6:00", 2, 1050),
(1, 3, "2020-12-24 10:00", 3, 1567),
(4, 6, "2021-12-30 12:00", 1, 3240),
(4, 6, "2021-01-05 6:00", 2, 1050),
(1, 8, "2021-01-11 14:00", 3, 789),
(5, 8, "2021-01-11 14:00", 3, 789),
(3, 6, "2021-01-05 6:00", 2, 1050),
(3, 8, "2021-01-11 2:15", 3, 789),
(3, 6, "2021-12-30 12:00", 1, 3240),
(2, 5, "2020-12-24 17:00", 3, 1567),
(1, 4, "2021-12-30 11:00", 1, 3240),
(2, 6, "2021-12-30 12:00", 1, 3240),
(6, 2, "2020-12-11 9:00", 1, 1240),
(1, 2, "2020-12-11 9:00", 1, 1240),
(1, 5, "2021-01-05 10:00", 2, 1050),
(2, 4, "2020-12-18 12:00", 2, 1572),
(6, 4, "2021-12-30 11:00", 1, 3240),
(5, 7, "2021-01-08 4:30", 2, 2345),
(5, 6, "2021-01-08 23:00", 2, 2345),
(2, 6, "2021-01-05 6:00", 2, 1050),
(4, 5, "2020-12-24 17:00", 3, 1567),
(2, 8, "2021-01-11 2:15", 3, 789),
(5, 5, "2020-12-24 17:00", 3, 1567),
(7, 6, "2021-01-05 6:00", 2, 1050),
(6, 2, "2020-12-18 10:00", 2, 1572),
(7, 5, "2020-12-24 17:00", 3, 1567),
(1, 6, "2021-01-08 23:00", 2, 2345),
(1, 2, "2020-12-18 10:00", 2, 1572),
(8, 3, "2020-12-11 17:00", 1, 1240),
(4, 7, "2021-01-08 4:30", 2, 2345),
(3, 7, "2021-01-08 4:30", 2, 2345),
(4, 8, "2021-01-11 2:15", 3, 789),
(5, 6, "2021-12-30 12:00", 1, 3240),
(5, 3, "2020-12-11 17:00", 1, 1240),
(6, 3, "2020-12-24 10:00", 3, 1567),
(3, 5, "2020-12-24 17:00", 3, 1567),
(7, 6, "2021-12-30 12:00", 1, 3240),
(2, 3, "2020-12-11 17:00", 1, 1240),
(5, 8, "2021-01-11 2:15", 3, 789),
(2, 7, "2021-01-08 4:30", 2, 2345),
(8, 5, "2020-12-24 17:00", 3, 1567),
(5, 4, "2020-12-18 12:00", 2, 1572);

-- truncate table BAGAZ
insert into BAGAZ
(rodzaj, waga)
values 
(1, 0.31),
(2, 31.85),
(1, 3.33),
(2, 25.41),
(2, 35.76),
(2, 17.86),
(1, 4.65),
(2, 35.39),
(1, 7.36),
(2, 31.38),
(2, 40.27),
(2, 40.2),
(2, 43.26),
(2, 36.44),
(2, 28.34),
(2, 27.51),
(2, 30.1),
(2, 42.51),
(2, 27.46),
(2, 45.74),
(2, 34.34),
(2, 17.61),
(2, 36.25),
(2, 33.53),
(2, 34.27),
(2, 38.71),
(2, 32.54),
(2, 10.39),
(2, 44.63),
(2, 41.53),
(2, 41.48),
(2, 26.75),
(2, 38.2),
(1, 4.28),
(2, 33.09),
(1, 2.41),
(1, 9.19),
(1, 2.69),
(1, 7.28),
(1, 9.09),
(2, 39.37),
(2, 40.75),
(2, 15.68),
(2, 18.66),
(2, 15.74),
(1, 2.14),
(2, 37.26),
(2, 11.5),
(1, 6.2),
(2, 21.97),
(1, 3.49),
(1, 8.12),
(2, 38.76),
(2, 13.59),
(2, 12.01),
(2, 36.25),
(2, 27.98),
(1, 7.74),
(2, 43.93),
(2, 33.1),
(2, 19.08),
(2, 40.83),
(2, 36.71),
(1, 9.45),
(2, 13.43),
(2, 14.57),
(2, 35.34),
(2, 35.43),
(1, 2.5),
(2, 20.23),
(2, 25.37),
(2, 41.12),
(2, 28.28),
(1, 4.44),
(2, 36.58),
(2, 12.12),
(2, 40.99),
(1, 2.72),
(2, 12.48),
(2, 26.57),
(1, 9.5),
(2, 43.85),
(2, 36.86),
(2, 30.84),
(1, 1.42),
(1, 9.13),
(2, 27.51),
(2, 27.07),
(2, 32.69),
(1, 8.45),
(2, 12.59),
(2, 24.74),
(2, 22.22),
(2, 37.47),
(2, 12.76),
(2, 10.14),
(2, 18.3),
(1, 0.71),
(1, 7.42),
(2, 31.08),
(2, 12.72),
(2, 38.95),
(1, 0.3),
(2, 28.5),
(2, 44.63),
(2, 11.73),
(2, 46),
(2, 24.53),
(1, 1.85),
(2, 39.73),
(2, 46.18),
(2, 40.41),
(1, 4.49),
(2, 26.93),
(2, 21.92),
(2, 37.54),
(2, 27.89),
(2, 34.37),
(1, 8.35),
(2, 28.86),
(2, 37.57),
(2, 38.13),
(2, 20.63),
(1, 8.49),
(1, 8.04),
(2, 32),
(2, 25.35),
(1, 6.48),
(1, 8.18),
(1, 4.85),
(1, 1.87),
(2, 34.35),
(2, 25.57),
(1, 2.15),
(1, 0.47),
(1, 6.55),
(2, 23.96),
(2, 33.73),
(1, 4.47),
(1, 8.57),
(2, 21.54),
(2, 46.13),
(2, 30.26),
(1, 0.78),
(1, 8.15),
(2, 42.76),
(1, 6.11),
(2, 32.01),
(2, 26.97),
(2, 23.26),
(2, 23.62),
(2, 43.45),
(2, 13.44),
(2, 34.12),
(1, 4.08),
(2, 47.23),
(2, 16.45),
(2, 19.73),
(2, 28.55),
(1, 6.54),
(2, 25.79),
(1, 2.33),
(2, 36.02),
(2, 10.26),
(2, 29.79),
(1, 0.99),
(2, 20.86),
(2, 18.48),
(2, 37.65),
(1, 9.72),
(2, 23.53),
(2, 14.78),
(2, 20.3),
(2, 23.2),
(2, 46.28),
(1, 1.07),
(2, 40.45),
(2, 34.69),
(2, 30.49),
(2, 41.27),
(2, 40.39),
(1, 9.22),
(2, 44.07),
(2, 39.7),
(2, 22.34),
(2, 12.81),
(2, 38.16),
(1, 3.79),
(2, 45.58),
(2, 30.32),
(2, 32.51),
(2, 33.93),
(2, 38.04),
(2, 23.31),
(1, 9.4),
(2, 10.95),
(2, 28),
(1, 1.41),
(2, 32.75),
(2, 16.41),
(2, 39.37),
(2, 45.97),
(1, 6.44),
(2, 31.29),
(2, 39.28),
(2, 15.9),
(2, 31.13),
(1, 2.32),
(2, 28.78),
(1, 1.84),
(1, 8.72),
(1, 7.66),
(1, 6.09),
(2, 25.79),
(2, 11.81),
(1, 2.51),
(2, 15.8),
(1, 2.78),
(1, 3.46),
(2, 19.74),
(2, 22.07),
(2, 17.57),
(2, 14.03),
(1, 1.47),
(2, 22.76),
(2, 26.8),
(2, 16.36),
(2, 42.1),
(2, 45.04),
(1, 1.91),
(2, 19.98),
(1, 9.15),
(1, 8.26),
(2, 21.21),
(1, 6.38),
(2, 36.06),
(2, 45.05),
(1, 5.56),
(2, 40.82),
(2, 26.27),
(2, 12.4),
(2, 24.26),
(1, 5.88),
(2, 11.51),
(2, 33.68),
(2, 34.17),
(2, 38.32),
(2, 11.61),
(2, 24.62),
(1, 3.64),
(1, 2.43),
(2, 38.79),
(2, 44.93),
(2, 44.6),
(2, 27.81),
(1, 2.08),
(2, 38.98),
(2, 30.5),
(2, 45.84),
(2, 29.97),
(2, 12.55),
(2, 45.54),
(2, 40.78),
(1, 1.82),
(2, 46.16),
(2, 38.56),
(2, 15.72),
(2, 30.3),
(1, 3.73),
(1, 3.36),
(2, 43.57),
(2, 46.29),
(2, 18.64),
(2, 35.04),
(2, 18.77),
(2, 19.12),
(2, 31.26),
(2, 42.48),
(1, 2.28),
(2, 12.7),
(2, 39.02),
(1, 9.88),
(2, 43.22),
(2, 19.48),
(2, 14.82),
(1, 7.77),
(2, 29.72),
(2, 38.2),
(1, 6.57),
(2, 36.92),
(1, 1.43),
(2, 42.94),
(2, 38.05),
(2, 46.15),
(2, 43.04),
(2, 30.27),
(2, 16.55),
(2, 43.35),
(2, 18.61),
(1, 5.32),
(2, 32.5),
(2, 16.77),
(2, 29.34),
(1, 9.63),
(2, 37.01),
(1, 1.63),
(1, 2.54),
(2, 21.08),
(1, 9.29),
(1, 2.19),
(2, 22), 
(2, 33.53),
(2, 46.55),
(2, 42.09),
(2, 19.12),
(2, 27.55),
(2, 30.74),
(1, 7.44),
(1, 3.99),
(2, 10.3),
(2, 19.05),
(2, 45.92),
(2, 22.1),
(2, 16.74),
(1, 7.11),
(2, 42.12),
(1, 2.87),
(2, 18.63),
(1, 6.76),
(2, 33.61),
(2, 19.76),
(2, 26.26),
(1, 1.07),
(1, 2.82),
(2, 12.37),
(2, 18.65),
(1, 6.61),
(2, 42.57),
(1, 1.56),
(2, 10.86),
(2, 15.15),
(2, 36.06),
(2, 11.41),
(2, 29.4),
(2, 22.68),
(2, 45.17),
(2, 46.01),
(2, 10.6),
(2, 26.25),
(1, 1.16),
(1, 1.53),
(2, 28.87),
(2, 46.52),
(2, 18.56),
(1, 4.3),
(2, 28.13),
(2, 37.15),
(2, 19.84),
(2, 27.04),
(2, 15.32),
(2, 44.26),
(2, 22.44),
(2, 21.7),
(2, 15.6),
(2, 36.29),
(1, 2.52),
(1, 6.18),
(2, 16.05),
(2, 42.37),
(1, 7.44),
(2, 13.51),
(2, 45.53),
(2, 14.13),
(1, 9.13),
(1, 7.51),
(2, 34.95),
(1, 2.96),
(2, 11.87),
(2, 27.72),
(2, 38.8),
(2, 38.48),
(2, 38.55),
(2, 20.84),
(2, 43.66),
(2, 36.11),
(2, 18.7),
(1, 7.31),
(2, 34.79),
(1, 1.64),
(2, 30.48),
(2, 16.42),
(2, 38.33),
(2, 34.69),
(2, 43.45),
(1, 9.01),
(2, 37.09),
(1, 3.46),
(2, 12.9),
(2, 21.96),
(2, 42.12),
(2, 35.97),
(2, 16.66),
(2, 10.28),
(2, 41.45),
(2, 39.03),
(2, 18.48),
(2, 31.29),
(1, 2.11),
(2, 32.75),
(1, 8.53),
(2, 18.9),
(2, 23.17),
(2, 20.4),
(1, 5.46),
(2, 17.43),
(2, 43.14),
(2, 14.21),
(2, 10.1),
(2, 15.81),
(1, 4.33),
(1, 4.9),
(1, 1.89),
(2, 38.69),
(2, 27.18),
(2, 27.82),
(2, 23.77),
(1, 8.34),
(2, 16.97),
(2, 13.22),
(1, 7.76),
(1, 5.22),
(1, 6.94),
(1, 6.61),
(2, 39.94),
(2, 32.73),
(1, 4.77),
(2, 22.21),
(2, 37.67),
(1, 1.89),
(2, 12.36),
(2, 13.89),
(1, 8.23),
(2, 14.21),
(2, 29.9),
(1, 3.56),
(2, 43),
(2, 29.51),
(2, 31.67),
(2, 22.05),
(1, 4.96),
(2, 22.24),
(2, 29.99),
(2, 17.58),
(2, 19.32),
(1, 8.18),
(2, 27.82),
(2, 41.94),
(2, 37.73),
(2, 47.22),
(2, 36.47),
(2, 45.99),
(2, 30.13),
(1, 4.64),
(1, 0.56),
(2, 24.84),
(2, 17.93),
(2, 26.32),
(2, 27.17),
(2, 12.28),
(1, 2.89),
(2, 31.96),
(2, 34.64),
(1, 0.6),
(2, 14.58),
(2, 11.17),
(2, 13.43),
(1, 7.36),
(2, 41.43),
(2, 28.58),
(2, 19.7),
(2, 27.36),
(2, 17.1),
(1, 5.99),
(2, 15.45),
(1, 7.36),
(1, 6.91),
(2, 36.5),
(2, 20.77),
(2, 12.93),
(1, 5.43),
(2, 36.62),
(2, 18.79),
(2, 39.57),
(2, 30.3),
(1, 3.36),
(2, 30.3),
(2, 23.89),
(1, 8.89),
(1, 5.69),
(2, 21.45),
(1, 1.47),
(2, 38.99),
(2, 25.42),
(2, 16.11),
(1, 9.34),
(2, 35.8),
(2, 27.89),
(2, 16.71),
(2, 12.69),
(1, 6.95),
(2, 40.88),
(2, 38.39),
(2, 38.24),
(2, 45.7),
(2, 28.07),
(2, 30.61),
(2, 34.96),
(2, 16.44),
(2, 22.9),
(2, 40.43),
(2, 39.84),
(1, 1.79),
(2, 42.63),
(2, 45.23),
(1, 5.12),
(2, 23.54),
(2, 20.91),
(1, 3.45),
(2, 23.9),
(1, 5.27),
(2, 32.15),
(2, 31.53),
(2, 31.37),
(2, 17.16),
(1, 7.61),
(1, 7.8),
(2, 12.62),
(2, 38.13),
(2, 42.25),
(2, 28.29),
(2, 41.57),
(2, 31.46),
(2, 36.23),
(2, 16.2),
(1, 0.66),
(2, 12.33),
(2, 38.88),
(2, 45.2),
(2, 45.4),
(1, 8.58),
(2, 33.7),
(2, 35.58),
(2, 18.31),
(2, 22.34),
(2, 38.02),
(2, 36.35),
(1, 2.02),
(1, 2.12),
(2, 16.63),
(2, 27.98),
(1, 8.99),
(2, 45.64),
(2, 23.31),
(2, 12.75),
(2, 12.52),
(2, 12.94),
(2, 39.41),
(2, 10.44),
(1, 7.74),
(1, 8.79),
(1, 6.22),
(2, 11.18),
(2, 17.22),
(2, 29.73),
(1, 6.71),
(2, 26.86),
(2, 44.88),
(2, 16.24),
(2, 47.09),
(2, 29.17),
(2, 16.26),
(1, 3.47),
(2, 24.97),
(2, 40.23),
(2, 42.98),
(2, 34.44),
(2, 37.37),
(1, 5.74),
(2, 14.89),
(2, 39.69),
(2, 23.04),
(2, 43.68),
(2, 23.62),
(2, 43.84),
(1, 1.79),
(2, 14.24),
(2, 47.31),
(1, 4.38),
(2, 22.71),
(2, 24.28),
(1, 9.38),
(2, 39.1),
(2, 10.41),
(2, 47.47),
(1, 7.19),
(2, 35.08),
(1, 2.28),
(2, 29.24),
(2, 40.18),
(2, 30.84),
(1, 4.16),
(2, 31),
(2, 34.19),
(2, 41.35),
(2, 47.23),
(2, 46.36),
(2, 39.77),
(2, 10.63),
(1, 8.59),
(1, 7.28),
(2, 47.64),
(2, 12.92),
(2, 45.84),
(1, 1.27),
(1, 4.22),
(2, 45.58);

insert into PASAZER 
(imie, nazwisko, email)
values 
("Kaleigh Kassulke IV", "Zulauf", "harry.ruecker@gmail.com"),
("Prof. Noemy Miller", "Cummings", "fweber@gmail.com"),
("Pansy Morar", "Konopelski", "dewayne.romaguera@yahoo.c"),
("Jean O'Hara", "Hilpert", "melvina82@hotmail.com"),
("Idell 'Reilly", "Welch", "gracie61@hotmail.com"),
("Justyn Beahan", "Hettinger", "fnikolaus@hotmail.com"),
("Ms. Twila Von DVM", "Dickens", "ezequiel71@gmail.com"),
("Meagan Lueilwitz", "Stoltenberg", "gerald42@yahoo.com"),
("Maynard Strosin", "Lemke", "tmcclure@hotmail.com"),
("Deven Huel", "Feeney", "morar.claire@yahoo.com"),
("Gunnar VonRueden", "Huels", "wintheiser.edwin@yahoo.co"),
("Mary Herzog", "Von", "harmon35@yahoo.com"),
("Adelle Heathcote", "Gusikowski", "qlarson@yahoo.com"),
("Viviane Blick", "Lehner", "sporer.mason@hotmail.com"),
("Cesar Wintheiser", "Goyette", "schneider.hilda@yahoo.com"),
("Mr. Dee Osinski", "Cruickshank", "krenner@yahoo.com"),
("Garnett Gleason", "Emard", "abbott.arely@gmail.com"),
("Kurtis Murphy", "Heidenreich", "leone.crist@hotmail.com"),
("Haley Funk", "Schmitt", "modesta65@yahoo.com"),
("Shawna DuBuque", "Fisher", "gbarrows@hotmail.com"),
("Aaliyah Volkman", "Nikolaus", "jacey.orn@yahoo.com"),
("Stefan Pfannerstill", "Reichel", "mallie.hickle@gmail.com"),
("Heaven Kuvalis", "Tillman", "greenholt.jarod@yahoo.com"),
("Dr. Roslyn Walter II", "Herman", "christiansen.lyla@gmail.c"),
("Kody Conn", "Mayer", "nframi@hotmail.com"),
("Cielo Monahan", "Hirthe", "hills.shana@yahoo.com"),
("Herbert Barton", "Wolff", "brown.alessandro@yahoo.co"),
("Brionna Stroman Sr.", "Streich", "gilbert.klocko@yahoo.com"),
("Bailee Reichel II", "Mueller", "wtremblay@gmail.com"),
("Ulises Deckow", "Bernhard", "west.nannie@yahoo.com"),
("Ms. Rylee Fay", "Stokes", "xlangosh@yahoo.com"),
("Shanel Klocko", "Brown", "wiegand.marc@yahoo.com"),
("Prof. Brandi Moscisk", "Dach", "ankunding.joanie@gmail.co"),
("Dr. Darrell Hermann", "Feest", "vincenza67@yahoo.com"),
("Dr. Autumn Graham", "McGlynn", "horacio62@hotmail.com"),
("Olen Sauer", "Jaskolski", "spencer.sadye@yahoo.com"),
("Hoyt Spinka", "Waelchi", "jessie24@yahoo.com"),
("Aurelio Schmeler", "Heller", "xheaney@yahoo.com"),
("Alverta O'Hara Jr.", "Stehr", "edurgan@gmail.com"),
("Monroe Reynolds Sr.", "Beer", "xdickens@hotmail.com"),
("Yasmine Morissette", "McLaughlin", "zthompson@hotmail.com"),
("Mrs. Lorena Fisher", "Toy", "piper22@yahoo.com"),
("Dorothy Cremin PhD", "Kshlerin", "kmurphy@hotmail.com"),
("Euna Ziemann II", "Shields", "adelle.greenholt@hotmail."),
("Dr. Coby Gusikowski", "Littel", "kiarra.osinski@yahoo.com"),
("Zelma McKenzie", "Mohr", "robel.samanta@gmail.com"),
("Nakia Daugherty", "Becker", "urice@gmail.com"),
("Ms. Gloria Beer", "Muller", "lupe.schneider@gmail.com"),
("Keanu Lockman DVM", "Strosin", "silas.feest@yahoo.com"),
("Thad Zboncak", "Sauer", "enolan@gmail.com"),
("Ms. Aliza Lowe", "Block", "okirlin@gmail.com"),
("Cheyanne Larkin DVM", "Bartoletti", "dominic.hermann@gmail.com"),
("Prof. Larue Hahn IV", "Dooley", "evelyn93@hotmail.com"),
("Candace Jakubowski S", "Raynor", "genesis.schoen@hotmail.co"),
("Rick Roberts", "Powlowski", "virginie91@hotmail.com"),
("Stuart Ledner", "Brown", "vincent81@hotmail.com"),
("Mrs. Cydney Wilderma", "Schmitt", "cassidy.moen@hotmail.com"),
("Vada Kirlin", "Dach", "franecki.harley@yahoo.com"),
("Clare Heidenreich", "Durgan", "oconsidine@gmail.com"),
("Isadore Becker", "Hauck", "celia84@gmail.com"),
("Pascale O'Reilly", "Howell", "waltenwerth@yahoo.com"),
("Salvatore Gutmann", "Reichert", "myles17@yahoo.com"),
("Roberto Legros IV", "Weissnat", "langworth.noemy@hotmail.c"),
("Ignatius Hodkiewicz", "Goldner", "beatrice30@gmail.com"),
("Clarissa Bruen", "Gleichner", "weissnat.natasha@hotmail."),
("Mr. Haleigh Hermann", "Reinger", "fmcglynn@yahoo.com"),
("Edmond Kunde", "Christiansen", "sflatley@yahoo.com"),
("Ms. Ardella Langosh ", "Sanford", "toy.marvin@gmail.com"),
("Clair Grant", "Borer", "loma.heller@yahoo.com"),
("Jeffry Jacobs", "Gutmann", "sadye62@hotmail.com"),
("Miss Adaline Nolan J", "Mayer", "heaney.isabelle@yahoo.com"),
("Mr. Robbie Grady", "Volkman", "glen84@hotmail.com"),
("Adella Reynolds", "Swaniawski", "barton.xander@hotmail.com"),
("Golden Gislason V", "Bogan", "omcdermott@hotmail.com"),
("Dr. Dereck Powlowski", "Okuneva", "wmarquardt@gmail.com"),
("Camden Schneider", "DuBuque", "gmonahan@yahoo.com"),
("Remington Ebert", "Hettinger", "nberge@yahoo.com"),
("Loyal Cruickshank II", "Shanahan", "van.zieme@hotmail.com"),
("Miss Virginia Koss", "Feeney", "madisyn33@yahoo.com"),
("Mr. Jared Schaefer", "Prohaska", "joana56@gmail.com"),
("Ms. Sasha Koepp", "Abernathy", "jarrell.bins@yahoo.com"),
("Prof. Antonio Abshir", "Hand", "howell.melyna@hotmail.com"),
("Prof. Garnett Sauer ", "Gerlach", "stephen54@yahoo.com"),
("Rosalee Trantow V", "Bahringer", "swift.lennie@hotmail.com"),
("Prof. Garnet Auer I", "Brown", "daniella.bins@yahoo.com"),
("Dortha Nolan", "Murray", "beier.carli@hotmail.com"),
("Alanis Sipes", "Hills", "bergstrom.may@yahoo.com"),
("Mr. Constantin Pacoc", "Lowe", "katarina61@gmail.com"),
("Ruth Ortiz MD", "Gutkowski", "yundt.jaylan@yahoo.com"),
("Maeve Marks", "Feeney", "kayley12@hotmail.com"),
("Lysanne Douglas", "Kassulke", "boyle.hanna@yahoo.com"),
("Felicity Robel", "Balistreri", "jonas77@yahoo.com"),
("Caitlyn Willms", "Kling", "eva91@yahoo.com"),
("Dr. Anderson Toy", "Rice", "ierdman@hotmail.com");

-- truncate table BILET;
insert into BILET
(pasazer, bagaz, lot, miejsce, status)
values 
(24, 177, 4, 77, 2), 
(61, 490, 40, 208, 2), 
(86, 563, 9, 194, 1), 
(22, 89, 4, 4, 3), 
(46, 284, 31, 127, 2), 
(8, 77, 14, 3, 1), 
(45, 299, 8, 132, 1), 
(18, 75, 10, 21, 3), 
(36, 313, 16, 91, 1),
(77, 479, 40, 212, 3), 
(82, 461, 23, 224, 2), 
(25, 113, 15, 1, 1), 
(76, 544, 7, 217, 3), 
(58, 308, 32, 120, 2), 
(37, 215, 28, 125, 2), 
(72, 417, 36, 230, 3), 
(2, 62, 34, 77, 1), 
(85, 586, 36, 222, 2), 
(13, 54, 34, 37, 3), 
(63, 422, 22, 200, 2), 
(14, 91, 10, 73, 1), 
(73, 597, 24, 188, 3), 
(80, 499, 11, 204, 3), 
(52, 385, 2, 120, 2), 
(9, 119, 13, 1, 2), 
(51, 224, 41, 142, 3), 
(47, 282, 32, 161, 3), 
(79, 451, 11, 226, 3), 
(48, 294, 41, 101, 2), 
(81, 582, 24, 194, 3), 
(50, 387, 2, 147, 2), 
(44, 274, 25, 134, 2), 
(30, 182, 39, 20, 2),
(28, 82, 38, 2, 2), 
(10, 174, 13, 22, 2), 
(68, 480, 3, 220, 1), 
(49, 234, 29, 124, 3), 
(89, 521, 40, 197, 3), 
(84, 589, 23, 214, 2),
(20, 109, 12, 80, 2), 
(29, 102, 38, 33, 1), 
(62, 467, 33, 230, 1), 
(38, 391, 31, 114, 2), 
(33, 348, 2, 148, 3), 
(55, 263, 8, 179, 3), 
(41, 233, 41, 166, 1), 
(43, 392, 17, 151, 2), 
(15, 185, 15, 8, 2), 
(74, 445, 40, 222, 1), 
(66, 439, 37, 210, 3), 
(35, 266, 20, 106, 3), 
(53, 250, 1, 101, 2), 
(32, 370, 8, 130, 1), 
(34, 202, 29, 177, 2), 
(42, 331, 28, 95, 3), 
(19, 179, 13, 25, 3), 
(27, 191, 4, 13, 2), 
(12, 166, 4, 43, 2), 
(65, 407, 27, 185, 3), 
(1, 100, 34, 1, 3), 
(16, 164, 18, 47, 1), 
(69, 533, 3, 224, 1), 
(3, 192, 39, 1, 1), 
(57, 240, 25, 123, 1), 
(4, 88, 18, 13, 2), 
(78, 607, 40, 197, 1), 
(70, 542, 40, 229, 1), 
(92, 496, 37, 200, 2), 
(11, 125, 13, 55, 2), 
(71, 539, 33, 217, 1), 
(31, 334, 29, 127, 3), 
(54, 365, 8, 126, 1), 
(56, 253, 16, 91, 1), 
(21, 35, 18, 47, 1), 
(39, 243, 2, 120, 2), 
(40, 335, 25, 111, 1), 
(5, 90, 12, 48, 2), 
(88, 436, 22, 181, 1), 
(17, 194, 39, 49, 1), 
(67, 427, 40, 227, 3), 
(26, 60, 4, 19, 3), 
(87, 599, 11, 221, 3), 
(6, 31, 4, 9, 2), 
(7, 97, 34, 12, 2), 
(59, 278, 20, 91, 2), 
(91, 413, 7, 215, 3), 
(93, 525, 42, 221, 3), 
(75, 412, 9, 187, 1), 
(64, 593, 27, 204, 3), 
(83, 423, 33, 187, 1), 
(90, 534, 6, 191, 3), 
(23, 45, 39, 2, 2);