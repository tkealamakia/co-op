insert into authority values (1, 0, 'ROLE_USER', 'Default User');
insert into authority values (2, 0, 'ROLE_ADMIN', 'Admin User');
insert into ward values (1, 0, 'Default', 'Default');
insert into category values (1, 0, 1, 'Free Stuff');
insert into category values (2, 0, 2, 'For Sale');
insert into category values (3, 0, 3, 'For Rent');
insert into category values (4, 0, 4, 'For Trade');
insert into category values (5, 0, 5, 'Items Wanted');
insert into category values (6, 0, 6, 'Services');
insert into category values (7, 0, 7, 'Jobs / Hiring');
insert into category values (8, 0, 8, 'Share Resources');
insert into category values (9, 0, 9, 'Events');
alter table image modify image longblob;
alter table image modify thumbnail longblob;
