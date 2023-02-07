-- inserts for cities
insert into cities (id, name, province, population) values (1, 'St. John''s', 'Newfoundland', '500000');
insert into cities (id, name, province, population) values (2, 'Carbonear', 'Newfoundland', '10000');
insert into cities (id, name, province, population) values (3, 'Corner Brook', 'Newfoundland', '51000');
insert into cities (id, name, province, population) values (4, 'Grandfalls ', 'Newfoundland', '5400');
insert into cities (id, name, province, population) values (5, 'Deer Lake', 'Newfoundland', '67000');
insert into cities (id, name, province, population) values (6, 'Gander', 'Newfoundland', '85000');
insert into cities (id, name, province, population) values (7, 'Bay Roberts', 'Newfoundland', '10345');
insert into cities (id, name, province, population) values (8, 'Labrador City', 'Newfoundland', '34000');
insert into cities (id, name, province, population) values (9, 'Goose Bay', 'Newfoundland', '78000');
insert into cities (id, name, province, population) values (10, 'Perrys Cove', 'Newfoundland', '25000');

-- Insets for passengers
insert into passengers (id, first_name, last_name, phone_number) values (1, 'Jordan', 'Kelloway', '709-555-1111');
insert into passengers (id, first_name, last_name, phone_number) values (2, 'Jim', 'Smith', '709-565-2222');
insert into passengers (id, first_name, last_name, phone_number) values (3, 'Bob', 'Harris', '709-575-3333');
insert into passengers (id, first_name, last_name, phone_number) values (4, 'Nathan', 'Greene', '709-585-4444');
insert into passengers (id, first_name, last_name, phone_number) values (5, 'Cameroon', 'Damico', '709-595-5555');
insert into passengers (id, first_name, last_name, phone_number) values (6, 'Luke', 'Jones', '709-510-6666');
insert into passengers (id, first_name, last_name, phone_number) values (7, 'Steven', 'Dwyer', '709-511-7777');
insert into passengers (id, first_name, last_name, phone_number) values (8, 'Lucas', 'Nowak', '709-512-8888');
insert into passengers (id, first_name, last_name, phone_number) values (9, 'Laura', 'Kelloway', '709-513-9999');
insert into passengers (id, first_name, last_name, phone_number) values (10, 'Arthur', 'Boyd', '709-514-1010');

-- Inserts for airport
insert into airports (id, name, airport_code)  values (1, 'St Johns Internationl','yyt');
insert into airports (id, name, airport_code)  values (11, 'St Johns Municiple','yyt');
insert into airports (id, name, airport_code)  values (2, 'Carbonear Municiple','yyt');
insert into airports (id, name, airport_code)  values (3, 'Cornerbrook Regional','yyt');
insert into airports (id, name, airport_code)  values (4, 'Gander International','yyt');
insert into airports (id, name, airport_code)  values (5, 'Bay Roberts Municiple','yyt');
insert into airports (id, name, airport_code)  values (6, 'Goosebay Regional','yyt');
insert into airports (id, name, airport_code)  values (7, 'Labrador Regional','yyt');
insert into airports (id, name, airport_code)  values (8, 'Deerlake International','yyt');
insert into airports (id, name, airport_code)  values (9, 'Perrys Cove Community ','yyt');
insert into airports (id, name, airport_code)  values (10, 'Grandfalls Municiple','yyt');
insert into airports (id, name, airport_code)  values (13, 'granfalls International','yit');

-- Inserts For aircraft table
insert into aircraft (id, type, airline_name,passanger_capicity)  values (1, 'Big Plane','Air Canada',200);
insert into aircraft (id, type, airline_name,passanger_capicity)  values (2, 'Small Plane','Air Labrador',20);
insert into aircraft (id, type, airline_name,passanger_capicity)  values (3, 'Medium Plane','Provinical Airways',100);
insert into aircraft (id, type, airline_name,passanger_capicity)  values (4, 'XL Plane','Porter',400);
insert into aircraft (id, type, airline_name,passanger_capicity)  values (5, 'Big Plane','Westjet',200);
insert into aircraft (id, type, airline_name,passanger_capicity)  values (6, 'Big Plane','Sunwing',200);
insert into aircraft (id, type, airline_name,passanger_capicity)  values (7, 'Large Plane','Cargo Service',10);
insert into aircraft (id, type, airline_name,passanger_capicity)  values (8, 'XXL Plane','Airbus',600);
insert into aircraft (id, type, airline_name,passanger_capicity)  values (9, 'Military Plane','Canadian Air Force',310);
insert into aircraft (id, type, airline_name,passanger_capicity)  values (10, 'Medical Plane','Air Newfoundland',5);


-- inserts for the join table
insert into city_airports (city_id, airport_id) values (1, 1);
insert into city_airports (city_id, airport_id) values (2, 2);
insert into city_airports (city_id, airport_id) values (3, 3);
insert into city_airports (city_id, airport_id) values (4, 10);
insert into city_airports (city_id, airport_id) values (5, 8);
insert into city_airports (city_id, airport_id) values (6, 4);
insert into city_airports (city_id, airport_id) values (7, 5);
insert into city_airports (city_id, airport_id) values (8, 7);
insert into city_airports (city_id, airport_id) values (9, 6);
insert into city_airports (city_id, airport_id) values (10, 9);
insert into city_airports (city_id, airport_id) values (1, 11);
insert into city_airports (city_id, airport_id) values (2, 12);
insert into city_airports (city_id, airport_id) values (4, 13);


-- Shows What Citys Have What Airports with condition for name 
select * from airports a, cities c, city_airports ca
where ca.city_id = c.id
and ca.airport_id = a.id
and c.name = 'Carbonear'
order by c.id

-- Shows All The Citys and their airports 
select * from cities c,airports a,  city_airports ca
where ca.city_id = c.id
and ca.airport_id = a.id
order by c.id

-- Same as above I just switched cities and airports position
select * from cities c, airports a,  city_airports ca
where ca.city_id = c.id
and ca.airport_id = a.id
order by c.id



-- This shows all passengers that live in city with id 
select * from passengers  p, cities c
where p.city_id = c.id
and p.id = 8

-- Insert For passenger_plane table 
insert into passenger_plane (passenger_id, aircraft_id) values (1, 1);
insert into passenger_plane (passenger_id, aircraft_id) values (1, 2);
insert into passenger_plane (passenger_id, aircraft_id) values (1, 3);
insert into passenger_plane (passenger_id, aircraft_id) values (1, 4);
insert into passenger_plane (passenger_id, aircraft_id) values (1, 5);
insert into passenger_plane (passenger_id, aircraft_id) values (2, 1);
insert into passenger_plane (passenger_id, aircraft_id) values (2, 2);
insert into passenger_plane (passenger_id, aircraft_id) values (3, 1);
insert into passenger_plane (passenger_id, aircraft_id) values (4, 2);
insert into passenger_plane (passenger_id, aircraft_id) values (5, 3);
insert into passenger_plane (passenger_id, aircraft_id) values (6, 4);
insert into passenger_plane (passenger_id, aircraft_id) values (7, 5);
insert into passenger_plane (passenger_id, aircraft_id) values (8, 6);
insert into passenger_plane (passenger_id, aircraft_id) values (9, 7);
insert into passenger_plane (passenger_id, aircraft_id) values (10, 8);
insert into passenger_plane (passenger_id, aircraft_id) values (1, 9);
insert into passenger_plane (passenger_id, aircraft_id) values (1, 10);
insert into passenger_plane (passenger_id, aircraft_id) values (2, 9);
insert into passenger_plane (passenger_id, aircraft_id) values (2, 10);

select * from passenger_plane
-- Select to see which aircraft passengers flew on 
select *from passengers p, aircraft a,  passenger_plane pa
where pa.passenger_id = p.id
and pa.aircraft_id = a.id
-- and p.first_name = 'Jordan'

order by p.first_name






select * from aircraft a , passengers p
where a.passenger_id = p.id 
and p.id = 6

select * from passengers p,aircraft a  
where a.passenger_id = p.id 
and p.id = 6




insert into passenger_airport (passenger_id, airport_id) values (1, 1);
insert into passenger_airport (passenger_id, airport_id) values (1, 2);
insert into passenger_airport (passenger_id, airport_id) values (1, 3);
insert into passenger_airport (passenger_id, airport_id) values (1, 4);
insert into passenger_airport (passenger_id, airport_id) values (2, 2);
insert into passenger_airport (passenger_id, airport_id) values (2, 3);
insert into passenger_airport (passenger_id, airport_id) values (3, 3);
insert into passenger_airport (passenger_id, airport_id) values (3, 4);
insert into passenger_airport (passenger_id, airport_id) values (3, 5);
insert into passenger_airport (passenger_id, airport_id) values (4, 6);
insert into passenger_airport (passenger_id, airport_id) values (5, 7);
insert into passenger_airport (passenger_id, airport_id) values (6, 8);
insert into passenger_airport (passenger_id, airport_id) values (7, 9);
insert into passenger_airport (passenger_id, airport_id) values (8, 10);
insert into passenger_airport (passenger_id, airport_id) values (9, 11);
insert into passenger_airport (passenger_id, airport_id) values (10, 12);
insert into passenger_airport (passenger_id, airport_id) values (2, 13);

insert into passenger_airport (passenger_id, airport_id) values (1, 5);
insert into passenger_airport (passenger_id, airport_id) values (1, 6);
insert into passenger_airport (passenger_id, airport_id) values (1, 7);
insert into passenger_airport (passenger_id, airport_id) values (1, 8);
insert into passenger_airport (passenger_id, airport_id) values (1, 9);
insert into passenger_airport (passenger_id, airport_id) values (1, 10);
insert into passenger_airport (passenger_id, airport_id) values (1, 11);
insert into passenger_airport (passenger_id, airport_id) values (1, 12);
insert into passenger_airport (passenger_id, airport_id) values (1, 13);

insert into passenger_airport (passenger_id, airport_id) values (2, 5);
insert into passenger_airport (passenger_id, airport_id) values (2, 6);
insert into passenger_airport (passenger_id, airport_id) values (2, 7);






-- This Shows Which Airports Passengers Used 
select *from passengers p, airports a,  passenger_airport pa
where pa.passenger_id = p.id
and pa.airport_id = a.id

order by a.name








select * from aircraft_airport

-- Inserts For Aircraft Airport Table
insert into aircraft_airport (aircraft_id, airport_id) values (1, 1);
insert into aircraft_airport (aircraft_id, airport_id) values (2, 2);
insert into aircraft_airport (aircraft_id, airport_id) values (3, 3);
insert into aircraft_airport (aircraft_id, airport_id) values (4, 5);
insert into aircraft_airport (aircraft_id, airport_id) values (5, 4);
insert into aircraft_airport (aircraft_id, airport_id) values (6, 8);
insert into aircraft_airport (aircraft_id, airport_id) values (7, 7);
insert into aircraft_airport (aircraft_id, airport_id) values (7, 6);
insert into aircraft_airport (aircraft_id, airport_id) values (8, 10);
insert into aircraft_airport (aircraft_id, airport_id) values (9, 8);
insert into aircraft_airport (aircraft_id, airport_id) values (10, 9);
insert into aircraft_airport (aircraft_id, airport_id) values (1, 11);
insert into aircraft_airport (aircraft_id, airport_id) values (2, 12);
insert into aircraft_airport (aircraft_id, airport_id) values (6, 13);

insert into aircraft_airport (aircraft_id, airport_id) values (1, 13);
insert into aircraft_airport (aircraft_id, airport_id) values (1, 9);
insert into aircraft_airport (aircraft_id, airport_id) values (1, 8);
insert into aircraft_airport (aircraft_id, airport_id) values (1, 7);



-- Shows which aircraft can land at what airports
select *from aircraft ac, airports a,  aircraft_airport aa
where aa.aircraft_id = ac.id
and aa.airport_id = a.id

order by ac.id

























