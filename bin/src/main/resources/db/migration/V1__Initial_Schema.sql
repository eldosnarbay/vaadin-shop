CREATE TABLE person (
  id bigint auto_increment,
  birth_day timestamp,
  email varchar(255) not null,
  name varchar(50) not null,
  phone_number varchar(255),
  primary key (id));

INSERT INTO person (id,name,birth_day,email) VALUES (1,'Elmo Herring','1991-01-20','dolor.Donec@enimconsequatpurus.net'),(2,'Malcolm Blankenship','1993-06-29','eu.placerat.eget@lacusQuisque.com'),(3,'Jack Prince','1991-06-11','sodales@loremluctusut.edu'),(4,'Hamilton Ortiz','1987-06-14','Aliquam@nec.com'),(5,'Amir Rocha','1987-11-30','Nunc.pulvinar@facilisisSuspendissecommodo.co.uk'),(6,'Tanner Chambers','1988-07-05','ligula@lacusQuisque.net'),(7,'Randall Day','1990-02-17','nisi@consectetuercursus.ca'),(8,'Vladimir Estes','1987-04-10','sed.sapien.Nunc@estcongue.net'),(9,'Hakeem Lambert','1994-01-26','Sed.congue@temporaugue.net'),(10,'Dale Todd','1994-08-17','enim@gravida.org');
INSERT INTO person (id,name,birth_day,email) VALUES (11,'Tate Velasquez','1987-07-19','Aenean@tristique.ca'),(12,'Basil Pratt','1986-07-19','sit.amet@hendrerit.net'),(13,'Chase Tanner','1988-04-11','consequat@mattisvelitjusto.com'),(14,'Dalton Kane','1994-01-06','arcu.et.pede@nec.com'),(15,'Slade Pickett','1989-12-30','aliquam.eros@Fuscediamnunc.com'),(16,'Donovan Raymond','1991-09-26','ipsum@euaugueporttitor.ca'),(17,'Dane Boyd','1992-01-11','vitae.semper.egestas@elementumloremut.co.uk'),(18,'Moses Kirkland','1991-05-27','Proin@interdumCurabitur.ca'),(19,'Paki William','1988-08-19','arcu.Sed@idlibero.net'),(20,'Keane Marshall','1988-11-21','egestas@cursus.com');
INSERT INTO person (id,name,birth_day,email) VALUES (21,'Elliott Lawson','1990-05-16','orci.tincidunt.adipiscing@tempusrisus.net'),(22,'Marsden Ewing','1987-12-26','eu.enim.Etiam@ipsumPhasellusvitae.ca'),(23,'Kareem Goodwin','1992-09-20','justo.Proin.non@ridiculus.edu'),(24,'Elton Munoz','1993-05-07','tempus.lorem.fringilla@Duisrisus.org'),(25,'Kirk Montgomery','1993-06-04','nec.euismod.in@semsemper.net'),(26,'Declan Carter','1991-12-31','mauris.id.sapien@ornareliberoat.ca'),(27,'Curran Porter','1989-12-08','ac.facilisis.facilisis@dolor.co.uk'),(28,'Quamar Burks','1991-06-08','non.enim.Mauris@Nullatincidunt.co.uk'),(29,'Seth Buckley','1993-03-16','nec.luctus.felis@fringillaeuismod.com'),(30,'Colton Skinner','1991-03-10','facilisi@vitae.org');
INSERT INTO person (id,name,birth_day,email) VALUES (31,'Ishmael Potts','1989-08-15','orci.Ut.semper@Namacnulla.co.uk'),(32,'Samuel Becker','1987-09-30','arcu.et.pede@Aliquamornarelibero.ca'),(33,'Kasper Prince','1994-05-02','sem.Pellentesque.ut@perinceptos.ca'),(34,'Aristotle Pate','1991-06-16','faucibus.ut@ligulaNullam.com'),(35,'Slade Key','1989-01-15','lorem.fringilla@fringilla.org'),(36,'Kaseem Miranda','1986-12-29','leo.elementum@consequat.com'),(37,'Daquan Browning','1994-12-16','tristique@vitaemauris.org'),(38,'Elmo Kirk','1991-03-30','Quisque.ac.libero@ridiculusmus.net'),(39,'Oleg Case','1986-02-22','pharetra.Quisque@nec.ca'),(40,'Hashim Justice','1990-01-24','tincidunt.aliquam.arcu@augueeu.org');
INSERT INTO person (id,name,birth_day,email) VALUES (41,'Hedley Cotton','1992-01-30','metus@odiovelest.net'),(42,'Forrest Maxwell','1987-12-29','sagittis.semper.Nam@Phasellus.edu'),(43,'Arden Stafford','1995-02-02','et.ultrices@atpretium.edu'),(44,'Hu Goff','1993-05-29','eget.odio@at.com'),(45,'Harrison Best','1992-04-13','Etiam.vestibulum.massa@enimsit.edu'),(46,'Benjamin Shepard','1992-05-08','Maecenas.libero@euultrices.co.uk'),(47,'Jin Lee','1990-12-03','erat.Sed@consectetueradipiscingelit.co.uk'),(48,'Brian Singleton','1986-05-25','molestie@id.edu'),(49,'Tyrone Daugherty','1993-12-21','metus@urnasuscipit.edu'),(50,'Lev Salas','1989-12-10','Cum.sociis@Maurisvelturpis.org');
INSERT INTO person (id,name,birth_day,email) VALUES (51,'Gil Farrell','1994-05-21','sit.amet.luctus@ultricies.co.uk'),(52,'Bradley Morse','1989-11-19','Integer.vitae@id.edu'),(53,'Kuame Trujillo','1988-02-14','mi@quisturpisvitae.co.uk'),(54,'Colorado Simon','1990-11-16','neque.Sed.eget@porttitorvulputate.co.uk'),(55,'Amos Lindsey','1992-10-31','Pellentesque.habitant@Suspendissesagittis.com'),(56,'Magee Valentine','1990-01-20','Suspendisse@rhoncus.co.uk'),(57,'Caleb Hunt','1987-09-07','netus.et.malesuada@Sednulla.org'),(58,'Rashad Haynes','1988-07-27','ac@eumetus.ca'),(59,'Lawrence Steele','1993-09-17','nunc.sed@convallisconvallis.net'),(60,'Blaze Kemp','1989-04-27','tortor.Integer.aliquam@elementumategestas.net');
INSERT INTO person (id,name,birth_day,email) VALUES (61,'Daquan Bell','1992-02-20','eget@temporestac.edu'),(62,'Ciaran Walters','1989-01-29','lorem@euismodestarcu.edu'),(63,'Aidan Downs','1987-08-03','Aliquam.tincidunt.nunc@semelit.ca'),(64,'Stewart Riddle','1990-06-06','sagittis.Duis@auctor.co.uk'),(65,'Clayton Green','1992-08-31','Donec.egestas@congueInscelerisque.ca'),(66,'Ahmed Aguirre','1990-06-04','posuere.cubilia@loremvehicula.co.uk'),(67,'Nash Guthrie','1993-07-10','ultricies.sem@enimmitempor.co.uk'),(68,'Dennis Cortez','1989-11-07','magna.Sed.eu@justo.edu'),(69,'Porter Rosa','1987-05-08','consectetuer.adipiscing.elit@mauris.ca'),(70,'Silas Slater','1990-12-25','vestibulum@massanonante.com');
INSERT INTO person (id,name,birth_day,email) VALUES (71,'Walter Hopper','1990-08-10','nonummy.ut@luctuslobortis.com'),(72,'Macaulay Rollins','1989-04-02','Aenean.eget.metus@risusDonecegestas.net'),(73,'Aidan Prince','1987-03-02','eleifend.nec.malesuada@sapiengravida.net'),(74,'Baxter Reed','1988-02-02','vitae.risus.Duis@dolorelitpellentesque.com'),(75,'Moses Maddox','1991-05-14','cursus.non.egestas@Namac.net'),(76,'Omar Knowles','1991-09-29','ipsum.Suspendisse.non@egetmassa.edu'),(77,'Tarik Mcdaniel','1988-04-27','elit@euelit.net'),(78,'Devin Williams','1986-11-18','Donec.egestas.Aliquam@fringilla.edu'),(79,'Phelan Castro','1990-10-28','Suspendisse.tristique.neque@vitaesemperegestas.com'),(80,'Thane Adkins','1992-01-26','id@vel.co.uk');
INSERT INTO person (id,name,birth_day,email) VALUES (81,'Buckminster Sanders','1990-02-12','aliquam.iaculis.lacus@Donecnibh.ca'),(82,'Stuart Rodriguez','1993-07-25','ut.pellentesque@non.ca'),(83,'Kieran Aguirre','1988-01-25','vehicula.et@massarutrum.com'),(84,'Stephen Graham','1992-12-06','eu@imperdietdictummagna.org'),(85,'Reece Luna','1987-10-16','auctor.ullamcorper@sociisnatoque.co.uk'),(86,'Wing Cochran','1986-05-12','interdum@natoquepenatibus.edu'),(87,'Theodore Franks','1994-05-16','elementum.lorem@Maurisblanditenim.net'),(88,'Ishmael Herrera','1987-06-18','consequat.auctor.nunc@in.com'),(89,'Elton Shields','1989-06-10','hendrerit.Donec@vitaeorci.net'),(90,'Eaton Reyes','1994-10-29','turpis.In.condimentum@in.edu');
INSERT INTO person (id,name,birth_day,email) VALUES (91,'Cairo Monroe','1990-07-12','dolor.Donec@maurisIntegersem.ca'),(92,'Bradley Zimmerman','1989-03-12','commodo@aliquetPhasellus.ca'),(93,'Raymond Oliver','1994-01-30','per.conubia@lectusquismassa.ca'),(94,'Julian Case','1990-10-04','magna.Cras.convallis@Sedpharetra.net'),(95,'Kaseem Cotton','1995-02-22','adipiscing.Mauris@etliberoProin.com'),(96,'Paul Michael','1994-03-15','tempor@eu.edu'),(97,'Isaac Hatfield','1987-05-30','mus@imperdietnonvestibulum.org'),(98,'Keaton Grimes','1990-06-13','Phasellus.nulla@ornareFusce.net'),(99,'Forrest Hamilton','1994-09-12','Sed.nulla@nec.net'),(100,'Lyle Ingram','1986-11-14','Donec.consectetuer.mauris@parturient.ca');

CREATE TABLE item (
  id bigint auto_increment,
  description varchar(255),
  name varchar(50),
  price numeric,
  primary key (id));

CREATE TABLE user_order (
  id bigint auto_increment,
  user_order_id bigint,
  city varchar(255),
  name varchar(50),
  order_date timestamp,
  street varchar(255),
  zip varchar(255),
  primary key (id));
  
CREATE TABLE ordered_item (
  id bigint auto_increment,
  user_order_id bigint,
  item_id bigint,
  quantity integer,
  primary key (id));