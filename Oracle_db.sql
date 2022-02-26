
create table HOTEL(
 hotelNo integer ,
 hotelName varchar2(25),
 city varchar2(25),
 constraint pk_hotel primary key(hotelNo)
);


create table ROOM(
    roomNo integer,
    hotelNo integer,
    type varchar2(20),
    price integer,
    constraint pk_room primary key (roomNo,hotelNo),  
    constraint fk_room_hotelNo foreign key (hotelNo) 
      references HOTEL (hotelNo),
    constraint ck_type check(type in ('Single','Double','Family')),
    constraint ck_price check(price > 9 AND price < 101),
    constraint ck_roomNo check(roomNo > 0 AND roomNo < 121)
);

create table GUEST(
  guestNo integer,
  guestName varchar2(30),
  guestAddress varchar2(45),
  constraint pk_guest primary key(guestNo)
  
);



create table BOOKING(
    roomNo integer,
    hotelNo integer,
    guestNo integer,
    datefrom Date,
    dateTo Date,
    constraint pk_booking primary key(hotelNo,guestNo,dateFrom),
    constraint fk_booking_hotel foreign key (hotelNo) references HOTEL (hotelNo),
    constraint fk_booking_guest foreign key (guestNo)  references GUEST (guestNo),
    constraint fk_booking_roomNo foreign key (roomNo,hotelNo) references Room(roomNo,hotelNo)
);

CREATE OR REPLACE TRIGGER trg_check_dates
 BEFORE INSERT OR UPDATE ON BOOKING
  FOR EACH ROW
BEGIN
  IF( :NEW.dateFrom <= SYSDATE )
  THEN
    RAISE_APPLICATION_ERROR( -20001, 
          'Invalid dateFrom: Datefrom must be greater than the current date - value = ' || 
          to_char( :NEW.dateFrom, 'YYYY-MM-DD HH24:MI:SS' ) );
  END IF;
 
  IF( :NEW.dateTo <= SYSDATE )
  THEN
    RAISE_APPLICATION_ERROR( -20002, 
           'Invalid dateTo: DateTo must be greater than the current date - value = ' || 
          to_char( :NEW.dateTo, 'YYYY-MM-DD HH24:MI:SS' ) );
  END IF;
END;
/


insert into HOTEL values(1,'Hotel1','London');
insert into HOTEL values(2,'Hotel2','Paris');
insert into HOTEL values(3,'Hotel3','New York');
insert into HOTEL values(4,'Hotel4','Tokyo');
insert into HOTEL values(5,'Hotel5','Rome');
insert into HOTEL values(6,'Hotel6','Berlin');
insert into HOTEL values(7,'Hotel7','Madrid');
insert into HOTEL values(8,'Hotel8','Barcelona');
insert into HOTEL values(9,'Hotel9','Milan');
insert into HOTEL values(10,'Hotel10','Amsterdam');


insert into ROOM values(1,1,'Single',50);
insert into ROOM values(2,1,'Single',10);
insert into ROOM values(3,1,'Family',10);
insert into ROOM values(4,1,'Family',11);
insert into ROOM values(5,2,'Single',70);
insert into ROOM values(6,2,'Single',100);
insert into ROOM values(7,2,'Family',10);
insert into ROOM values(8,2,'Family',90);
insert into ROOM values(9,3,'Double',10);
insert into ROOM values(10,3,'Double',10);


insert into GUEST values(1,'John','London');
insert into GUEST values(2,'Peter','Paris');
insert into GUEST values(3,'Paul','New York');
insert into GUEST values(4,'Mary','Tokyo');
insert into GUEST values(5,'Sophia','Rome');
insert into GUEST values(6,'Linda','Berlin');
insert into GUEST values(7,'John','Madrid');
insert into GUEST values(8,'Peter','Barcelona');
insert into GUEST values(9,'Paul','Milan');
insert into GUEST values(10,'Mary','Amsterdam');


insert into BOOKING values(1,1,1,to_date('2029-01-01','yyyy-mm-dd'),to_date('2029-01-02','yyyy-mm-dd'));
insert into BOOKING values(2,1,2,to_date('2029-01-01','yyyy-mm-dd'),to_date('2029-01-02','yyyy-mm-dd'));
insert into BOOKING values(3,1,3,to_date('2022-07-01','yyyy-mm-dd'),to_date('2029-07-31','yyyy-mm-dd'));
insert into BOOKING values(4,1,4,to_date('2029-01-01','yyyy-mm-dd'),to_date('2029-01-02','yyyy-mm-dd'));
insert into BOOKING values(5,2,5,to_date('2029-01-01','yyyy-mm-dd'),to_date('2029-01-02','yyyy-mm-dd'));
insert into BOOKING values(6,2,6,to_date('2029-01-01','yyyy-mm-dd'),to_date('2029-01-02','yyyy-mm-dd'));
insert into BOOKING values(7,2,7,to_date('2029-01-01','yyyy-mm-dd'),to_date('2029-01-02','yyyy-mm-dd'));
insert into BOOKING values(8,2,8,to_date('2029-01-01','yyyy-mm-dd'),to_date('2029-01-02','yyyy-mm-dd'));
insert into BOOKING values(9,3,9,to_date('2029-01-01','yyyy-mm-dd'),to_date('2029-01-02','yyyy-mm-dd'));
insert into BOOKING values(10,3,10,to_date('2029-01-01','yyyy-mm-dd'),to_date('2029-01-02','yyyy-mm-dd'));




Select * from HOTEL;
Select * from ROOM;
Select * from GUEST;
Select * from BOOKING;

