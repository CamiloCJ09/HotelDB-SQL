create table Hotel(
  hotelNo integer primary key,
  hotelName varchar(25),
  city varchar(25)
);
  
-- create table 

select * from Hotel;

create table Room(
    roomNo integer,
    hotelNo integer,
    type varchar(20),
    price integer,
    primary key(roomNo, hotelNo),
    foreign key(hotelNo) references Hotel(hotelNo),
    check(type in ('Single','Double','Family')),
    check(price > 9 and price < 101),
    check(roomNo > 0 and roomNo < 121)
);

create table Guest(
    guestNo integer,
    guestName varchar(30),
    guestAddress varchar(45),
    primary key(guestNo)
);

create table Booking(
    hotelNo integer,
    guestNo integer,
    dateFrom date,
    dateTo date,
    roomNo integer,
    -- CONSTRAINT dateFrom check(dateFrom > cast(current_date as date) AND dateTo > cast(current_date as date) AND dateTo > dateFrom),
     check(dateFrom > current_date and dateTo > current_date),
    primary key(hotelNo, guestNo, dateFrom),
    foreign key(hotelNo) references Hotel(hotelNo),
    foreign key(roomNo) references Room(roomNo),
    foreign key(guestNo) references Guest(guestNo)
);


-- inserts 

insert into Guest values (1, "John", "Cali");
insert into Guest values (2, "Jane", "Cali");
insert into Guest values (3, "Jack", "Cali");
insert into Guest values (4, "Jill", "Cali");
insert into Guest values (5, "Jim", "Cali");
insert into Guest values (6, "Jenny", "Cali");
insert into Guest values (7, "Juan", "Cali");
insert into Guest values (8, "Jenny", "Cali");
insert into Guest values (9, "Jenny", "Bogota");
insert into Guest values (10, "Jenny", "Bogota");


insert into Hotel values (1, "Hotel 1", "Cali");
insert into Hotel values (2, "Hotel 2", "Cali");
insert into Hotel values (3, "Hotel 3", "Cali");
insert into Hotel values (4, "Hotel 4", "Cali");
insert into Hotel values (5, "Hotel 5", "Cali");
insert into Hotel values (6, "Hotel 6", "Cali");
insert into Hotel values (7, "Hotel 7", "Cali");
insert into Hotel values (8, "Hotel 8", "Cali");
insert into Hotel values (9, "Hotel 9", "Cali");
insert into Hotel values (10, "Hotel 10", "Cali");


insert into Room values (1, 1, 'Single', 10);
insert into Room values (2, 1, 'Family', 27);
insert into Room values (3, 1, 'Single', 15);
insert into Room values (4, 1, 'Double', 20);
insert into Room values (5, 1, 'Single', 10);
insert into Room values (6, 1, 'Family', 27);
insert into Room values (7, 1, 'Single', 15);
insert into Room values (8, 1, 'Double', 20);
insert into Room values (9, 1, 'Single', 10);
insert into Room values (10, 1, 'Family', 27);


insert into Booking values (1, 1, '2022-06-01', '2022-06-02', 1);
insert into Booking values (1, 2, '2022-06-03', '2022-06-04', 2);
insert into Booking values (1, 3, '2022-06-05', '2022-06-06', 5);
insert into Booking values (1, 4, '2022-06-07', '2022-06-08', 6);
insert into Booking values (1, 5, '2022-06-09', '2022-06-10', 7);
insert into Booking values (1, 6, '2022-06-11', '2022-06-12', 8);
insert into Booking values (1, 7, '2022-06-13', '2022-06-14', 9);
insert into Booking values (1, 8, '2022-06-15', '2022-06-16', 4);
insert into Booking values (1, 9, '2022-06-17', '2022-06-18', 3);
insert into Booking values (1, 10, '2022-06-19', '2022-06-20', 2);
-- insert not added because the date
insert into Booking values (1, 8, '2021-01-29', '2021-01-30', 4);


select * from Hotel;
select * from Guest;
select * from Room;
select * from Booking;
select current_date;
-- select * from Booking where dateFrom > current_date;