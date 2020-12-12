-- drop database airport; 
create database airport;
use airport;

-- drop table PASAZER;
create table PASAZER(
id int not null auto_increment primary key,
imie varchar(20) not null,
nazwisko varchar(45) not null,
email varchar(25) not null,
bagaz int not null 
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
lot int not null,
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
model varchar(15) not null,
miejsce int not null
);

-- drop table SAMOLOT_MIEJSCE;
create table SAMOLOT_MIEJSCE(
id int not null auto_increment primary key,
nazwa varchar(10) not null,
klasa int not null,
rodzaj int not null
);

-- drop table SAMOLOT_MIEJSCE_KLASA;
create table SAMOLOT_MIEJSCE_KLASA(
id int not null auto_increment primary key,
nazwa varchar(20) not null,
mnoznik_cena double not null
);

-- drop table SAMOLOT_MIEJSCE_RODZAJ;
create table SAMOLOT_MIEJSCE_RODZAJ(
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


-- alter table PASAZER
-- drop foreign key FK_PASAZER_BAGAZ;
alter table PASAZER
add constraint FK_PASAZER_BAGAZ
foreign key (bagaz) references BAGAZ(id);

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
-- drop foreign key FK_BILET_LOT;
alter table BILET
add constraint FK_BILET_LOT
foreign key (lot) references LOT(id);

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

-- alter table SAMOLOT
-- drop foreign key FK_SAMOLOT_SAMOLOT_MIEJSCE;
alter table SAMOLOT
add constraint FK_SAMOLOT_SAMOLOT_MIEJSCE
foreign key (miejsce) references SAMOLOT_MIEJSCE(id);

-- alter table SAMOLOT_MIEJSCE
-- drop foreign key FK_SAMOLOT_MIEJSCE_SAMOLOT_MIEJSCE_KLASA;
alter table SAMOLOT_MIEJSCE
add constraint FK_SAMOLOT_MIEJSCE_SAMOLOT_MIEJSCE_KLASA
foreign key (klasa) references SAMOLOT_MIEJSCE_KLASA(id);

-- alter table SAMOLOT_MIEJSCE
-- drop foreign key FK_SAMOLOT_MIEJSCE_SAMOLOT_MIEJSCE_RODZAJ;
alter table SAMOLOT_MIEJSCE
add constraint FK_SAMOLOT_MIEJSCE_SAMOLOT_MIEJSCE_RODZAJ
foreign key (rodzaj) references SAMOLOT_MIEJSCE_RODZAJ(id);