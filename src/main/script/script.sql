CREATE TABLE Postcode (
    code char(10),
    city char(20),
    country char(50),
    PRIMARY KEY (code)
);

create table Geolocation (
    longitude NUMERIC(7, 4),
    latitude NUMERIC(7, 4),
    streetNumber char(50),
    postcode char(10),
    primary key (latitude, longitude),
    foreign key (postcode) references  Postcode on delete no action
);

create table CovidCase(
    id serial,
    longitude NUMERIC(7, 4),
    latitude NUMERIC(7, 4),
    caseType char(10),
    primary key (id)
);

create table Contributor(
    id serial,
    username varchar,
    password varchar,
    primary key (id)
);

create table PublicArea(
    id serial,
    longitude NUMERIC(7, 4),
    latitude NUMERIC(7, 4),
    name char(50),
    primary key (id),
    foreign key (latitude, longitude) references Geolocation (latitude, longitude) on delete no action
);

create table AppUser(
    id serial,
    username varchar,
    password varchar,
    displayName varchar,
    gender char(10),
    age serial,
    email varchar,
    acceptedRiskLevel serial,
    notificationMethod char(10),
    primary key (id),
    unique(email)
);

create table MakeComment(
    id serial,
    ccontent varchar,
    upvote serial,
    downvote serial,
    longitude NUMERIC(7, 4) not null,
    latitude NUMERIC(7, 4) not null,
    userId serial not null,
    primary key (id),
    foreign key (latitude, longitude) references Geolocation(latitude, longitude) on delete no action,
    foreign key (userId) references AppUser on delete no action
);

create table Suggestion(
    id serial,
    content varchar,
    timestamp char(50),
    primary key (id)
);

create table GiveSuggestion(
    userId serial,
    suggestionId serial,
    primary key (userId, suggestionId),
    foreign key (userId) references AppUser on delete cascade,
    foreign key (suggestionId) references Suggestion on delete no action
);

create table Producer(
    name varchar,
    phone char(20),
    email varchar,
    primary key (name)
);

create table SafetyEquipment(
    id serial,
    type char(20),
    producerName char(50),
    description varchar,
    primary key (id),
    foreign key (producerName) references Producer on delete no action
);

create table ProvideEquipment(
    publicAreaId serial,
    equipmentId serial,
    primary key (publicAreaId, equipmentId),
    foreign key (publicAreaId) references PublicArea on delete cascade,
    foreign key (equipmentId) references SafetyEquipment on delete no action
);

insert into Postcode(code, city, country) values('V6R2H7', 'Vancouver', 'Canada');
insert into Postcode(code, city, country) values('V6T1E2', 'Vancuuver', 'Canada');
insert into Postcode(code, city, country) values('V6R4R8', 'Vancouver', 'Canada');
insert into Postcode(code, city, country) values('V5Z1M9', 'Vancouver', 'Canada');
insert into Postcode(code, city, country) values('V6X1A2', 'Richmond', 'Canada');
insert into Postcode(code, city, country) values('V5G2X6', 'Burnaby', 'Canada');
insert into Postcode(code, city, country) values('V7L2L7', 'North Vancouver', 'Canada');
insert into Postcode(code, city, country) values('V3H3W9', 'Port Moody', 'Canada');
insert into Postcode(code, city, country) values('V6Z1Y6', 'Vancouver', 'Canada');
insert into Postcode(code, city, country) values('V5T3N4', 'Vancouver', 'Canada');

insert into Geolocation(latitude, longitude,  streetnumber, postcode) values('49.2649', '-123.2034', '4314 W 10th Ave', 'V6R2H7');
insert into Geolocation(latitude, longitude, streetnumber, postcode) values('49.2750', '-123.2422', '5495 Chancellor Blvd', 'V6T1E2');
insert into Geolocation(latitude, longitude, streetnumber, postcode) values('49.2643', '-123.2071', '4434 W 9th Ave', 'V6R4R8');
insert into Geolocation(latitude, longitude, streetnumber, postcode) values('49.2617', '-123.1237', '889 W 12th Ave', 'V5Z1M9');
insert into Geolocation(latitude, longitude, streetnumber, postcode) values('49.1689', '-123.1469', '7000 Westminster Hwy', 'V6X1A2');
insert into Geolocation(latitude, longitude, streetnumber, postcode) values('49.2494', '-123.0162', '3935 Kincaid St', 'V5G2X6');
insert into Geolocation(latitude, longitude, streetnumber, postcode) values('49.3210', '-123.0680', '231 15th St E', 'V7L2L7');
insert into Geolocation(latitude, longitude, streetnumber, postcode) values('49.2914', '-122.8185', '475 Guildford Way', 'V3H3W9');
insert into Geolocation(latitude, longitude, streetnumber, postcode) values('49.2880', '-123.1271', '1081 Burrard St', 'V6Z1Y6');
insert into Geolocation(latitude, longitude, streetnumber, postcode) values('49.2585', '-123.0905', '3080 Prince Edward St', 'V5T3N4');

insert into CovidCase(id, latitude, longitude, casetype) values(1, '49.2649', '-123.2034', 'suspected');
insert into CovidCase(id, latitude, longitude, casetype) values(2, '48.2649', '-123.2034', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(3, '50.2649', '-123.2034', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(4, '47.2649', '-123.2034', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(5, '49.2749', '-123.2034', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(6, '49.2648', '-123.2034', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(7, '49.2585', '-123.0905', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(8, '49.2585', '-123.0905', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(9, '49.2585', '-123.0905', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(10, '49.2585', '-123.0905', 'suspected');
insert into CovidCase(id, latitude, longitude, casetype) values(11, '49.2585', '-123.0905', 'recovered');
insert into CovidCase(id, latitude, longitude, casetype) values(12, '49.2585', '-123.0905', 'recovered');
insert into CovidCase(id, latitude, longitude, casetype) values(13, '49.2585', '-123.0905', 'death');
insert into CovidCase(id, latitude, longitude, casetype) values(14, '49.2880', '-123.1271', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(15, '49.2880', '-123.1271', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(16, '49.2880', '-123.1271', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(17, '49.2880', '-123.1271', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(18, '49.2880', '-123.1271', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(19, '49.2880', '-123.1271', 'recovered');
insert into CovidCase(id, latitude, longitude, casetype) values(20, '49.2880', '-123.1271', 'death');
insert into CovidCase(id, latitude, longitude, casetype) values(21, '49.2880', '-123.1271', 'death');
insert into CovidCase(id, latitude, longitude, casetype) values(22, '49.2914', '-122.8185', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(23, '49.2914', '-122.8185', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(24, '49.2914', '-122.8185', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(25, '49.2914', '-122.8185', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(26, '49.2914', '-122.8185', 'suspected');
insert into CovidCase(id, latitude, longitude, casetype) values(27, '49.2914', '-122.8185', 'recovered');
insert into CovidCase(id, latitude, longitude, casetype) values(28, '49.3210', '-123.0680', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(29, '49.3210', '-123.0680', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(30, '49.3210', '-123.0680', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(31, '49.3210', '-123.0680', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(32, '49.3210', '-123.0680', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(33, '49.3210', '-123.0680', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(34, '49.3210', '-123.0680', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(35, '49.3210', '-123.0680', 'death');
insert into CovidCase(id, latitude, longitude, casetype) values(36, '49.3210', '-123.0680', 'suspected');
insert into CovidCase(id, latitude, longitude, casetype) values(37, '49.3210', '-123.0680', 'recovered');
insert into CovidCase(id, latitude, longitude, casetype) values(38, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(39, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(40, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(41, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(42, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(43, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(44, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(45, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(46, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(47, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(48, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(49, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(50, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(51, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(52, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(53, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(54, '49.2494', '-123.0162', 'confirmed');
insert into CovidCase(id, latitude, longitude, casetype) values(55, '49.2494', '-123.0162', 'confirmed');

insert into appuser(id, username, password, displayname, gender, age, email, acceptedRiskLevel, notificationMethod) values(1, 'johnWick', 'fakepassword', 'jwick', 'male', 40, 'jw@johnwick.com', 5, 'Text');
insert into appuser(id, username, password, displayname, gender, age, email, acceptedRiskLevel, notificationMethod) values(2, 'fake user2', 'fakepassword', 'fake name2', 'male', 17, 'fake email1', 2, 'Email');
insert into appuser(id, username, password, displayname, gender, age, email, acceptedRiskLevel, notificationMethod) values(3, 'fake user3', 'fakepassword', 'fake name3', 'male', 22, 'fake email2', 3, 'Phone');
insert into appuser(id, username, password, displayname, gender, age, email, acceptedRiskLevel, notificationMethod) values(4, 'fake user4', 'fakepassword', 'fake name4', 'male', 23, 'fake email3', 4, 'Text');
insert into appuser(id, username, password, displayname, gender, age, email, acceptedRiskLevel, notificationMethod) values(5, 'fake user5', 'fakepassword', 'fake name5', 'male', 51, 'fake email4', 1, 'Email');
insert into appuser(id, username, password, displayname, gender, age, email, acceptedRiskLevel, notificationMethod) values(6, 'fake user6', 'fakepassword', 'fake name6', 'male', 6, 'fake email5', 5, 'Phone');
insert into appuser(id, username, password, displayname, gender, age, email, acceptedRiskLevel, notificationMethod) values(7, 'fake user7', 'fakepassword', 'fake name7', 'male', 78, 'fake email6', 1, 'Text');
insert into appuser(id, username, password, displayname, gender, age, email, acceptedRiskLevel, notificationMethod) values(8, 'fake user8', 'fakepassword', 'fake name8', 'male', 33, 'fake email7', 4, 'Email');
insert into appuser(id, username, password, displayname, gender, age, email, acceptedRiskLevel, notificationMethod) values(9, 'fake user9', 'fakepassword', 'fake name9', 'male', 40, 'fake email8', 3, 'Phone');
insert into appuser(id, username, password, displayname, gender, age, email, acceptedRiskLevel, notificationMethod) values(10, 'fake user10', 'fake password', 'fake name10', 'male', 32, 'fake email9', 2, 'Email');

insert into contributor(id, username, password) values(1, 'contributor1', 'password');
insert into contributor(id, username, password) values(2, 'contributor2', 'password');
insert into contributor(id, username, password) values(3, 'contributor3', 'password');
insert into contributor(id, username, password) values(4, 'contributor4', 'password');
insert into contributor(id, username, password) values(5, 'contributor5', 'password');
insert into contributor(id, username, password) values(6, 'contributor6', 'password');
insert into contributor(id, username, password) values(7, 'contributor7', 'password');
insert into contributor(id, username, password) values(8, 'contributor8', 'password');
insert into contributor(id, username, password) values(9, 'contributor9', 'password');
insert into contributor(id, username, password) values(10, 'contributor10', 'password');
insert into contributor(id, username, password) values(11, 'contributor11', 'password');

insert into publicarea(id, latitude, longitude, name) values(1, '49.2649', '-123.2034', 'West Point Grey');
insert into publicarea(id, latitude, longitude, name) values(2, '49.2750', '-123.2422', 'UBC');
insert into publicarea(id, latitude, longitude, name) values(3, '49.2643', '-123.2071', 'West Point Grey');
insert into publicarea(id, latitude, longitude, name) values(4, '49.2617', '-123.1237', 'Vancouver General Hospital');
insert into publicarea(id, latitude, longitude, name) values(5, '49.1689', '-123.1469', 'Richmond Hospital');
insert into publicarea(id, latitude, longitude, name) values(6, '49.2494', '-123.0162', 'Burnaby Hospital');
insert into publicarea(id, latitude, longitude, name) values(7, '49.3210', '-123.0680', 'Lions Gate Hospital');
insert into publicarea(id, latitude, longitude, name) values(8, '49.2880', '-123.1271', 'St Paul Hospital');
insert into publicarea(id, latitude, longitude, name) values(9, '49.2914', '-122.8185', 'Eagle Ridge Hospital');
insert into publicarea(id, latitude, longitude, name) values(10, '49.2585', '-123.0905', 'Mt Saint Joseph Hospital');

insert into makecomment(id, ccontent, upvote, downvote, latitude, longitude, userid) values(1, 'hello', 0, 0, '49.2649', '-123.2034', 4);
insert into makecomment(id, ccontent, upvote, downvote, latitude, longitude, userid) values(2, 'whats up 2', 0, 0, '49.2649', '-123.2034', 1);
insert into makecomment(id, ccontent, upvote, downvote, latitude, longitude, userid) values(3, 'whats up 3', 0, 0, '49.1689', '-123.1469', 1);
insert into makecomment(id, ccontent, upvote, downvote, latitude, longitude, userid) values(4, 'whats up 4', 0, 0, '49.2649', '-123.2034', 1);
insert into makecomment(id, ccontent, upvote, downvote, latitude, longitude, userid) values(5, 'whats up 5', 0, 0, '49.2649', '-123.2034', 1);
insert into makecomment(id, ccontent, upvote, downvote, latitude, longitude, userid) values(6, 'whats up 6', 0, 0, '49.2494', '-123.0162', 1);
insert into makecomment(id, ccontent, upvote, downvote, latitude, longitude, userid) values(7, 'whats up 7', 0, 0, '49.2649', '-123.2034', 1);
insert into makecomment(id, ccontent, upvote, downvote, latitude, longitude, userid) values(8, 'whats up 8', 0, 0, '49.2649', '-123.2034', 1);
insert into makecomment(id, ccontent, upvote, downvote, latitude, longitude, userid) values(9, 'whats up 9', 0, 0, '49.2649', '-123.2034', 1);
insert into makecomment(id, ccontent, upvote, downvote, latitude, longitude, userid) values(10, 'whats up 10', 0, 0, '49.2649', '-123.2034', 1);


insert into suggestion(id, content, timestamp) values(1, 'Do not go out!', '2020-6-19 10:23:54');
insert into suggestion(id, content, timestamp) values(2, 'Keep social distancing!', '2020-6-19 10:23:54');
insert into suggestion(id, content, timestamp) values(3, 'Stay at home!', '2020-6-19 10:23:54');
insert into suggestion(id, content, timestamp) values(4, 'Be safe!', '2020-6-19 10:23:54');
insert into suggestion(id, content, timestamp) values(5, 'No gathering!', '2020-6-19 10:23:54');
insert into suggestion(id, content, timestamp) values(6, 'Do not go out!', '2020-6-19 10:23:54');
insert into suggestion(id, content, timestamp) values(7, 'Do not go out!', '2020-6-19 10:23:54');
insert into suggestion(id, content, timestamp) values(8, 'Do not go out!', '2020-6-19 10:23:54');
insert into suggestion(id, content, timestamp) values(9, 'Do not go out!', '2020-6-19 10:23:54');
insert into suggestion(id, content, timestamp) values(10, 'Do not go out!', '2020-6-19 10:23:54');

insert into givesuggestion(userId, suggestionId) values(1, 1);
insert into givesuggestion(userId, suggestionId) values(1, 2);
insert into givesuggestion(userId, suggestionId) values(1, 3);
insert into givesuggestion(userId, suggestionId) values(1, 4);
insert into givesuggestion(userId, suggestionId) values(1, 5);
insert into givesuggestion(userId, suggestionId) values(1, 6);
insert into givesuggestion(userId, suggestionId) values(1, 7);
insert into givesuggestion(userId, suggestionId) values(1, 8);
insert into givesuggestion(userId, suggestionId) values(1, 9);
insert into givesuggestion(userId, suggestionId) values(1, 10);

insert into producer(name, phone, email) values('Nike', '778-xxx-xxxx', 'xxx@gmail.com');
insert into producer(name, phone, email) values('Adidas', '778-xxx-xxxx', 'xxx@gmail.com');
insert into producer(name, phone, email) values('Sony', '778-xxx-xxxx', 'xxx@gmail.com');
insert into producer(name, phone, email) values('Nikon', '778-xxx-xxxx', 'xxx@gmail.com');
insert into producer(name, phone, email) values('Fuji', '778-xxx-xxxx', 'xxx@gmail.com');
insert into producer(name, phone, email) values('Converse', '778-xxx-xxxx', 'xxx@gmail.com');
insert into producer(name, phone, email) values('Vans', '778-xxx-xxxx', 'xxx@gmail.com');
insert into producer(name, phone, email) values('Gucci', '778-xxx-xxxx', 'xxx@gmail.com');
insert into producer(name, phone, email) values('Amarni', '778-xxx-xxxx', 'xxx@gmail.com');
insert into producer(name, phone, email) values('Prada', '778-xxx-xxxx', 'xxx@gmail.com');
insert into producer(name, phone, email) values('3M', '778-xxx-xxxx', 'xxx@gmail.com');

insert into safetyequipment(id, type, producername, description) values(1, 'shoes', 'Nike', 'You jump higher');
insert into safetyequipment(id, type, producername, description) values(2, 'shoes', 'Adidas', 'You run faster');
insert into safetyequipment(id, type, producername, description) values(3, 'clothes', 'Nike', 'Wearbles');
insert into safetyequipment(id, type, producername, description) values(4, 'goggles', 'Nike', 'Nice kicks');
insert into safetyequipment(id, type, producername, description) values(5, 'glasses', 'Gucci', 'You look cool');
insert into safetyequipment(id, type, producername, description) values(6, 'mask', '3M', 'It actually saves your life');
insert into safetyequipment(id, type, producername, description) values(7, 'mask', '3M', 'It actually saves your life');
insert into safetyequipment(id, type, producername, description) values(8, 'gloves', 'Gucci', 'Protects you from bacteria');
insert into safetyequipment(id, type, producername, description) values(9, 'mask', '3M', 'It actually saves your life');
insert into safetyequipment(id, type, producername, description) values(10, 'mask', '3M', 'It actually saves your life');

insert into ProvideEquipment(publicareaid, equipmentid) values(1, 1);
insert into ProvideEquipment(publicareaid, equipmentid) values(1, 2);
insert into ProvideEquipment(publicareaid, equipmentid) values(1, 3);
insert into ProvideEquipment(publicareaid, equipmentid) values(1, 4);
insert into ProvideEquipment(publicareaid, equipmentid) values(1, 5);
insert into ProvideEquipment(publicareaid, equipmentid) values(2, 3);
insert into ProvideEquipment(publicareaid, equipmentid) values(2, 4);
insert into ProvideEquipment(publicareaid, equipmentid) values(2, 5);
insert into ProvideEquipment(publicareaid, equipmentid) values(2, 6);
insert into ProvideEquipment(publicareaid, equipmentid) values(2, 7);
insert into ProvideEquipment(publicareaid, equipmentid) values(2, 8);
insert into ProvideEquipment(publicareaid, equipmentid) values(3, 3);
insert into ProvideEquipment(publicareaid, equipmentid) values(3, 1);
insert into ProvideEquipment(publicareaid, equipmentid) values(3, 2);
insert into ProvideEquipment(publicareaid, equipmentid) values(4, 6);
insert into ProvideEquipment(publicareaid, equipmentid) values(4, 7);
insert into ProvideEquipment(publicareaid, equipmentid) values(5, 8);
insert into ProvideEquipment(publicareaid, equipmentid) values(5, 9);
insert into ProvideEquipment(publicareaid, equipmentid) values(5, 10);
insert into ProvideEquipment(publicareaid, equipmentid) values(6, 8);
insert into ProvideEquipment(publicareaid, equipmentid) values(6, 7);
insert into ProvideEquipment(publicareaid, equipmentid) values(7, 1);
insert into ProvideEquipment(publicareaid, equipmentid) values(7, 5);
insert into ProvideEquipment(publicareaid, equipmentid) values(7, 6);
insert into ProvideEquipment(publicareaid, equipmentid) values(8, 10);
insert into ProvideEquipment(publicareaid, equipmentid) values(9, 9);
insert into ProvideEquipment(publicareaid, equipmentid) values(10, 10);

