--insert into requestmap values (1, 0, 'ROLE_ADMIN', '/requestmap/**');
--insert into requestmap values (2, 0, 'ROLE_ADMIN', '/authority/**');
--insert into requestmap values (3, 0, 'ROLE_USER', '/image/**');
--insert into requestmap values (4, 0, 'ROLE_USER', '/main/**');
--insert into requestmap values (5, 0, 'ROLE_USER', '/person/**');
--insert into requestmap values (6, 0, 'ROLE_USER', '/post/**');
--insert into requestmap values (7, 0, 'ROLE_USER', '/invite/**');
--insert into requestmap values (8, 0, 'ROLE_USER', '/home/**');
insert into authority values (1, 0, 'ROLE_USER', 'Default User');
insert into authority values (2, 0, 'ROLE_ADMIN', 'Admin User');
insert into ward values (1, 0, 'Default');
insert into category values (1, 0, 1, 'Free Stuff');
insert into category values (2, 0, 2, 'For Rent');
insert into category values (3, 0, 3, 'For Sale');
insert into category values (4, 0, 4, 'Services For Hire');
insert into category values (5, 0, 5, 'Work Opportunities');
insert into category values (6, 0, 6, 'For Borrow');
insert into category values (7, 0, 7, 'Items Wanted');
insert into category values (8, 0, 8, 'Help Request');
insert into category values (9, 0, 9, 'Events');
alter table image modify image longblob;
