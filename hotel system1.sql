
CREATE DATABASE HotelSystem
use HotelSystem
--table room--
create table room(
room_num int primary key,
room_type char(20) not null)
insert into room values(1,'single')
insert into room values(2,'single')
insert into room values(5,'double')
insert into room values(7,'double')
insert into room values(10,'single')
insert into room values(3,'double')
insert into room values(6,'single')
insert into room values(11,'single')
insert into room values(13,'single')
insert into room values(12,'single')
insert into room values(14,'double')
insert into room values(15,'double')
insert into room values(16,'double')
--table guest--
create table guest_info(
guest_id int primary key,
name char(40) not null,
age int not null,
phone int not null unique,
countery char(30) not null)
insert into guest_info values(303022,'shahdyounis',20,01234567,'egypt')
insert into guest_info values(303023,'menna osama',21,01256784,'korea')
insert into guest_info values(303032,'dina mohamed',21,01227860,'America')
insert into guest_info values(303045,'malakyounis',23,01256233,'America')
insert into guest_info values(303055,'norhan tamer',22,01217809,'egypt')
insert into guest_info values(303088,'shahdmohamed',30,01214325,'egypt')
insert into guest_info values(303034,'doha ismail',33,01213675,'egypt')

--table services--
create table services_info(
name char(20) primary key,
price int not null)
insert into services_info values('breakfast',300)
insert into services_info values('lunch',800)
insert into services_info values('dinner',300)
insert into services_info values('Cleaning clothes',600)

-- table booking--
create table booking(
book_id int primary key)

insert into booking values(200)
insert into booking values(201)
insert into booking values(203)
insert into booking values(204)
insert into booking values(205)
insert into booking values(206)
insert into booking values(207)

-- table book result from relation ship between room, booking,guest
create table book(
room_num int references room(room_num),
guest_id int references guest_info(guest_id),
book_id int references booking(book_id),
date_book char(20) not null,
duration_dayes int not null,
cost_book int not null,
primary key(room_num,guest_id,book_id))

insert into book values(1,303022,200,'20-12-2024',5,5000)
insert into book values(5,303022,200,'20-12-2024',5,8000)
insert into book values(7,303045,203,'21-12-2024',4,5000)
insert into book values(10,303045,203,'21-12-2024',4,3000)
insert into book values(11,303023,204,'30-12-2024',3,2500)
insert into book values(3,303032,205,'27-12-2024',2,3000)
insert into book values(12,303055,206,'23-12-2024',3,2500)
insert into book values(6,303088,207,'20-12-2024',6,6000)
insert into book values(2,303034,201,'20-12-2024',7,7000)

--table services_guest result from relation ship between services_info, guest_info
create table services_guest(
guest_id int references guest_info(guest_id),
name char(20) references services_info(name),
number_of_services int not null,
total_cost_services int not null,
primary key(guest_id,name))
insert into services_guest values(303022,'breakfast',5,2000)
insert into services_guest values(303022,'dinner',5,2000)
insert into services_guest values(303023,'breakfast',3,1000)
insert into services_guest values(303045,'breakfast',2,600)
insert into services_guest values(303055,'dinner',2,2000)
insert into services_guest values(303043,'lunch',5,3000)
insert into services_guest values(303088,'cleaning clothes',5,2000)

--to calculate totalcost of services that the guest_id=303055 used
select sum(total_cost_services) as cost_of_services from services_guest where guest_id=303055

--tocalculate the number of guest that booked in the hotel
select count(*) as number_of_guest from guest_info


   
-- to calc the billing of the guest ,the billing is dividedinto two cost 1-cost of bookroom 2- cost of services that the guest are uesd--

SELECT 
    gi.name AS guest_name, 
    (SELECT SUM(b.cost_book)
     FROM book b
     WHERE b.guest_id = gi.guest_id) AS total_booking_cost,
    (SELECT SUM(sg.total_cost_services)
     FROM services_guest sg
     WHERE sg.guest_id = gi.guest_id) AS total_services_cost,
    (SELECT SUM(b.cost_book)
     FROM book b
     WHERE b.guest_id = gi.guest_id) + 
    (SELECT SUM(sg.total_cost_services)
     FROM services_guest sg
     WHERE sg.guest_id = gi.guest_id) AS total_cost
FROM 
    guest_info gi
WHERE 
    gi.guest_id = 303022;



--to calc the number of room that are booked
select count(*) as number_room from book 













