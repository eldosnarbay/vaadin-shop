CREATE TABLE users (
  id bigint auto_increment,
  birth_day timestamp,
  email varchar(255) not null,
  name varchar(50) not null,
  phone_number varchar(255),
  password varchar(255),
  primary key (id));

INSERT INTO users (id,name,birth_day,email,password) VALUES (10,'Dale Todd','1994-08-17','enim@gravida.org','123');
INSERT INTO users (id,name,birth_day,email,password) VALUES (20,'Keane Marshall','1988-11-21','egestas@cursus.com','123');
INSERT INTO users (id,name,birth_day,email,password) VALUES (30,'Colton Skinner','1991-03-10','facilisi@vitae.org','123');
INSERT INTO users (id,name,birth_day,email,password) VALUES (40,'Hashim Justice','1990-01-24','tincidunt.aliquam.arcu@augueeu.org','123');
INSERT INTO users (id,name,birth_day,email,password) VALUES (50,'Lev Salas','1989-12-10','Cum.sociis@Maurisvelturpis.org','123');
INSERT INTO users (id,name,birth_day,email,password) VALUES (60,'Blaze Kemp','1989-04-27','tortor.Integer.aliquam@elementumategestas.net','123');
INSERT INTO users (id,name,birth_day,email,password) VALUES (70,'Silas Slater','1990-12-25','vestibulum@massanonante.com','123');
INSERT INTO users (id,name,birth_day,email,password) VALUES (80,'Thane Adkins','1992-01-26','id@vel.co.uk','123');
INSERT INTO users (id,name,birth_day,email,password) VALUES (90,'Eaton Reyes','1994-10-29','turpis.In.condimentum@in.edu','123');
INSERT INTO users (id,name,birth_day,email,password) VALUES (100,'Lyle Ingram','1986-11-14','Donec.consectetuer.mauris@parturient.ca','123');

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    parent_id integer,
    primary key (id));                

INSERT INTO categories (id, name, parent_id) VALUES (19, 'Двигатель', NULL);
INSERT INTO categories (id, name, parent_id) VALUES (20, 'Аксессуары', 19);
INSERT INTO categories (id, name, parent_id) VALUES (21, 'ДВС', 19);
INSERT INTO categories (id, name, parent_id) VALUES (22, 'Питание', 19);
INSERT INTO categories (id, name, parent_id) VALUES (23, 'Фильтры', 19);
INSERT INTO categories (id, name, parent_id) VALUES (24, 'КПП', NULL);
INSERT INTO categories (id, name, parent_id) VALUES (25, 'Разное', NULL);
INSERT INTO categories (id, name, parent_id) VALUES (26, 'Уплотнения', 25);
INSERT INTO categories (id, name, parent_id) VALUES (27, 'Экстерьер', NULL);
INSERT INTO categories (id, name, parent_id) VALUES (28, 'Отопление', 25);
INSERT INTO categories (id, name, parent_id) VALUES (29, 'Тормоза', NULL);
INSERT INTO categories (id, name, parent_id) VALUES (30, 'Пневматика', 29);
INSERT INTO categories (id, name, parent_id) VALUES (31, 'Патрубки', 25);
INSERT INTO categories (id, name, parent_id) VALUES (32, 'Механика', 29);
INSERT INTO categories (id, name, parent_id) VALUES (33, 'Универсальные', 25);
INSERT INTO categories (id, name, parent_id) VALUES (34, 'Ремни', 25);
INSERT INTO categories (id, name, parent_id) VALUES (35, 'Шасси', NULL);
INSERT INTO categories (id, name, parent_id) VALUES (36, 'Гидравлика', 35);
INSERT INTO categories (id, name, parent_id) VALUES (37, 'Кузов.', 35);
INSERT INTO categories (id, name, parent_id) VALUES (38, 'Подшипники', 35);
INSERT INTO categories (id, name, parent_id) VALUES (39, 'Мосты', 35);
INSERT INTO categories (id, name, parent_id) VALUES (40, 'Подвеска', 35);
INSERT INTO categories (id, name, parent_id) VALUES (41, 'Рулевое', 35);
INSERT INTO categories (id, name, parent_id) VALUES (42, 'Электрика', NULL);  
    
CREATE TABLE item (
  id bigint auto_increment,
  name varchar(250),
  description varchar(255),
  amount numeric(10,2),
  oem character varying(200),
  capacity character varying(100),
  weight character varying(50),  
  usage character varying(50),
  code character(8),
  category_id integer references categories(id),
  primary key (id));
  
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18702, 41, '3408010A8E', NULL, '0.00 кг', 0.00, 'Бачок ГУР FAW', 'FAW', '04233   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18703, 27, NULL, '0.26244 м3', '17.00 кг', 63277.20, 'Бампер CAMC металлический', 'CAMC', '05924   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18704, 30, 'AZ2203250010', '0.00076 м3', '0.80 кг', 12171.60, 'Клапан воздушный КПП SINOTRUK повышенной ,пониженной передачи', 'SINOTRUK', '06541   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18705, 42, 'EG21VM-24-A', '0.00018 м3', '0.10 кг', 0.00, 'Амперметр SHANTUI SD16', 'SHANTUI', '10600   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18706, 41, 'WG9719470033', '0.00563 м3', '1.70 кг', 10120.00, 'Бачок ГУР HOWO', 'HOWO', '00065   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18707, 39, 'AZ0100413007', '0.644 м3', '468.00 кг', 0.00, 'Балка передняя 850MM HOWO 2009 в сборе', 'HOWO', '10457   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18708, 38, NULL, NULL, '0.00 кг', 0.00, 'Вал среднего моста SHAANXI Tong Li межосевого проходной', 'PENGXIANG', '05826   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18709, 42, 'DL-93305A', '0.00025 м3', '0.11 кг', 3600.00, 'Амперметр XCMG ZL50G', 'XCMG', '06941   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18710, 37, '*340L', NULL, '0.00 кг', 0.00, 'Бак топливный алюминиевый', 'F2000', '05558   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18711, 40, '29AD-05010', NULL, '0.00 кг', 0.00, 'Амортизатор CAMC  передний NANJINGZHENGDA', 'CAMC', '09750   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18712, 30, '81.52120.6081', '0.0003 м3', '0.31 кг', 14720.00, 'Клапан воздушный предохранительный 2х контурный SHAANXI F3000/HOWO', 'DL/HOWO', '08509   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18713, 27, NULL, NULL, '0.00 кг', 0.00, 'Бампер DONG FENG  металлический', 'DF', '05930   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18714, 26, '0X9-00032098', '0.00204 м3', '0.60 кг', 4500.00, 'Кольца уплотнительные (желтый набор)', 'TY', '00893   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18715, 34, '10*850', '0.00014 м3', '0.06 кг', 1080.00, 'Ремень   10 * 850 клиновой', 'TY', '05151   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18716, 30, '3515A6DP5-010', '0.00206 м3', '1.10 кг', 8100.00, 'Клапан воздушный предохранительный 4х контурный CAMC', 'CAMC', '00780   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18717, 32, 'TZ3501075TSLA', '0.04639 м3', '39.40 кг', 45208.80, 'Барабан тормозной CAMC передний (мост Taizhou)', 'CAMC', '00041   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18718, 40, '2905010-371', '0.00428 м3', '4.83 кг', 10522.04, 'Амортизатор CAMC 6*4/FAW/JAC/DONG FENG 153/ передний', 'CAMC', '00002   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18719, 33, '10*100*1.5', '2.0E-5 м3', '0.05 кг', 0.00, 'болт  под шестигранник 10*100*1.5', 'TY', '09651   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18720, 37, NULL, '0.00018 м3', '0.50 кг', 1800.00, 'Болт зуба ковша CHANGLIN погрузчик 24*85 (круглый)', 'CHANGLIN', '08638   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18721, 42, 'QD1315B-600', '0.00048 м3', '0.61 кг', 0.00, 'Бендикс стартера 11 зубьев 12 шлицов', '农用车', '11319   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18722, 38, '*0634..', '0.00039 м3', '0.00 кг', 54.00, 'Иголка подшипника бортового редуктора  NORD BENZ', 'MB', '07454   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18723, 36, NULL, NULL, '0.00 кг', 0.00, '*', 'не задана', '06000   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18724, 39, 'AZ9719410109', '0.03053 м3', '134.00 кг', 0.00, 'Балка передняя 850MM HOWO 6*4/8*4', 'HOWO', '04400   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18725, 28, NULL, '0.00055 м3', '0.20 кг', 23920.00, 'Блок управления автономной печи Hongye', '宏业', '00106   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18726, 28, 'JD11', NULL, '0.00 кг', 0.00, 'Блок управления автономной печи Hongye JD11', '宏业', '05882   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18727, 41, 'WG9725470060', '0.01083 м3', '2.80 кг', 11960.00, 'Бачок ГУР HOWO (2 крепёжных лапы)', 'HOWO', '00061   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18728, 39, 'DZ9100410058', '0.07429 м3', '94.00 кг', 0.00, 'Балка передняя 880MM SHAANXI F2000 6*4/8*4', 'F2000', '05252   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18729, 38, NULL, NULL, '0.01 кг', 144.00, 'Иголка подшипника бортового редуктора  XCMG ZL50G', 'XCMG', '06852   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18730, 42, '*2745.', '0.00115 м3', '1.05 кг', 9000.00, 'Бендикс стартера 2745 Changsha', 'STR', '00079   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18731, 37, NULL, '1.0E-5 м3', '0.45 кг', 1800.00, 'Болт зуба ковша LINGON погрузчик 24*90 (квадратный)', 'LINGONG', '08639   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18732, 36, NULL, '0.00144 м3', '0.80 кг', 8505.00, 'Активатор клапана гидравлики распределительного', 'FST', '09264   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18733, 33, '10*30', '1.0E-5 м3', '0.02 кг', 540.00, 'болт  под шестигранник 10*30', 'TY', '06579   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18734, 20, 'VG1540080293', '0.0078 м3', '0.50 кг', 5220.00, 'Балансир привода ТНВД HOWO Euro II', 'HOWO', '00028   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18735, 21, '615600020010..', '0.00314 м3', '12.20 кг', 34776.00, 'Балансир коленвала передний на WD615/WP10 двигателя', 'WD615', '08971   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18736, 40, '29ADP5-05010', '0.00396 м3', '4.58 кг', 12171.60, 'Амортизатор CAMC 8*4 передний', 'CAMC', '00003   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18737, 23, 'AZ9625190019+001', '0.075 м3', '8.40 кг', 26864.00, 'Картридж пылеуловителя HOWO (в сборе )', 'HOWO', '00771   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18738, 30, NULL, NULL, '0.00 кг', 0.00, 'Клапан воздушный предохранительный 4х контурный DONG FENG', 'DF', '00781   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18739, 24, NULL, NULL, '0.00 кг', 0.00, '*', 'не задана', '06030   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18741, 22, NULL, '0.00035 м3', '0.25 кг', 0.00, 'Венчик на форсунку FAW', 'FAW', '08693   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18742, 32, '3502014C', '0.0529 м3', '46.00 кг', 0.00, 'Барабан тормозной FAW (мост 290) задний', 'FAW290', '00044   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18743, 34, '10*715', '0.00012 м3', '0.06 кг', 900.00, 'Ремень   10* 715', 'TY', '02287   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18744, 26, '3104065-AOE', '0.00024 м3', '0.03 кг', 0.00, 'Кольцо уплотнительное бортового редуктора FAW 300', 'FAW300', '05466   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18745, 31, 'AS2474', '0.00077 м3', '0.35 кг', 0.00, 'Воздушно масляный сепаратор AS2474 CUMMINS', 'CUMMINS', '08362   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18746, 27, '2803010-436', '0.1458 м3', '14.20 кг', 0.00, 'Бампер FAW CA3252', 'FAW', '00030   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18747, 26, 'AZ9003077200', NULL, '0.00 кг', 0.00, 'Кольцо уплотнительное бортового редуктора HOWO 70T AC26', 'HOWO/70矿', '10606   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18748, 20, '90003962020.', NULL, '0.00 кг', 0.00, 'Болт WD615 Euro II A14x25x9x1.5 D07604', 'WD615', '03878   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18749, 31, '1003042-29D', '0.00054 м3', '0.20 кг', 0.00, 'Кольцо уплотнительное крышки клапанов FAW 29D (резиновое коническое)', 'FAW29D', '05307   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18750, 30, '23123412', '0.00255 м3', '0.93 кг', 11040.00, 'Клапан воздушный предохранительный 4х контурный DONGFENG TIANLONG', 'DF', '06372   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18751, 33, '10*35', '1.0E-5 м3', '0.03 кг', 0.00, 'болт  под шестигранник 10*35', 'TY', '06580   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18752, 40, '29ADP5-05010', NULL, '0.00 кг', 0.00, 'Амортизатор CAMC 8*4 передний NANJINGZHENGDA', 'CAMC', '08955   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18753, 23, 'AZ9625190019+001', '0.04235 м3', '4.75 кг', 11960.00, 'Картридж пылеуловителя HOWO (верхняя часть )', 'HOWO', '00772   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18754, 32, '3502471E260.', '0.05502 м3', '45.50 кг', 33672.00, 'Барабан тормозной FAW (мост 457) задний', 'FAW457', '00045   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18755, 21, 'CA6DL1(29D)CA3252', '0.24564 м3', '210.00 кг', 0.00, 'Блок двигателя FAW290', 'FAW29D', '07877   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18756, 37, '500F/500K', '9.0E-5 м3', '0.30 кг', 720.00, 'Болт зуба ковша XCMG ZL50G нового типа 20*75 (квадратный)', 'XCMG', '00134   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18757, 24, 'QH50', '0.00025 м3', '0.50 кг', 0.00, 'Активатор клапана Коробка отбора мощности (для КПП FAST)', 'FST', '11090   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18758, 34, '10*763', '0.00012 м3', '0.05 кг', 900.00, 'Ремень   10* 763', 'TY', '02288   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18759, 22, '612600081585..', '9.0E-5 м3', '0.06 кг', 0.00, 'Датчик топливной рейки SHAANXI F3000 WP12', 'WP12', '08331   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18760, 42, '*2745.', '0.00115 м3', '1.05 кг', 9000.00, 'Бендикс стартера 2745 Wuhua', 'STR', '00080   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18761, 38, '50M.01-06', NULL, '0.00 кг', 0.00, 'Кольцо распорное ведомой шестерни задней моста XCMG LW521F', 'XCMG', '05757   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18762, 36, '*', NULL, '0.00 кг', 0.00, 'Бак гидравлики SHAANXI F2000  (самосвал)', 'F2000', '05822   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18763, 39, 'DZ9100410054/0071', '0.07429 м3', '94.00 кг', 0.00, 'Балка передняя 880MM SHAANXI F2000 6*4/8*4 новый модель (оригинал)', 'F2000', '08690   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18764, 28, 'YJD16FC-2.0', '0.00087 м3', '0.39 кг', 46000.00, 'Блок управления автономной печи Hongye YJD16FC-2.0', '宏业', '06107   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18765, 41, 'WG9100470252', '0.01083 м3', '3.00 кг', 11960.00, 'Бачок ГУР HOWO (4 крепёжных лапы)', 'HOWO', '00062   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18766, 36, 'ZL40 50', '0.01069 м3', '14.00 кг', 48360.00, 'Блок клапанов LIUGONG ZL30.40.50', 'LIUGONG', '07235   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18767, 28, 'YJR-1.0', '0.3058 м3', '0.22 кг', 0.00, 'Блок управления автономной печи Hongye YJR-1.0', '南风', '06112   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18768, 38, '18*47', '5.0E-5 м3', '0.11 кг', 2700.00, 'Крестовина 18*47 привода рулевого управления FAW СА3252', 'TY', '04822   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18769, 39, 'DZ9100410058', '0.05 м3', '118.00 кг', 0.00, 'Балка передняя 880MM SHAANXI F2000 6*4/8*4 старый мадель(оригинал)', 'F2000', '08994   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18770, 42, '276.', '0.00045 м3', '0.80 кг', 4500.00, 'Бендикс стартера 276 (FAW36D)12 зубьев 10 шлицов', 'FAW29D', '00082   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18771, 37, 'ZL50G/LW300F', '9.0E-5 м3', '0.30 кг', 720.00, 'Болт зуба ковша XCMG ZL50G старого типа 20*80 (круглый)', 'XCMG', '05336   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18772, 33, '10*40', '1.0E-5 м3', '0.03 кг', 630.00, 'болт  под шестигранник 10*40', 'TY', '06581   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18773, 20, '90003802523.', '1.0E-5 м3', '0.02 кг', 180.00, 'Болт WD615 Euro II M10x25 D00933', 'WD615', '03915   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18774, 21, 'WD615 EVB', '0.32787 м3', '305.00 кг', 0.00, 'Блок двигателя WD615 Euro II  (2 клапана на цилинд)', 'WD615', '06325   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18775, 40, NULL, NULL, '0.00 кг', 0.00, 'Амортизатор DONGFENG', 'DF', '08557   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18776, 23, 'WG9725190055', '0.1827 м3', '17.00 кг', 52080.00, 'Картридж пылеуловителя HOWO 2010 (в сборе )', 'HOWO/10', '05177   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18778, 30, '3515025-385', '0.00255 м3', '0.93 кг', 9000.00, 'Клапан воздушный предохранительный 4х контурный FAW', 'FAW', '00782   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18779, 22, '36AD-10510', '0.00486 м3', '0.65 кг', 18400.00, 'Датчик уровня топлива CAMC', 'CAMC', '04226   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18780, 32, '3501071-4E', '0.04838 м3', '39.10 кг', 41731.20, 'Барабан тормозной FAW457 передний', 'FAW457', '00047   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18781, 34, '10*800', '0.00012 м3', '0.10 кг', 1440.00, 'Ремень   10* 800 генератора NORD BENZ/HOWO', 'HOWO', '02289   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18782, 31, '10*1000', '0.0004 м3', '0.25 кг', 0.00, 'Патрубок 10*1000', 'TY', '07173   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18783, 26, '2406033.', '0.00138 м3', '0.30 кг', 540.00, 'Кольцо уплотнительное бортового редуктора SHAANXI большо', 'FAW290', '00965   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18784, 27, '2803010-367', NULL, '0.00 кг', 0.00, 'Бампер FAW CA4252', 'FAW', '00031   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18785, 31, '100*1000', '0.01 м3', '2.20 кг', 11040.00, 'Патрубок 100*1000', 'TY', '04423   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18786, 26, 'MB/MAN/FAW290', '0.00012 м3', '0.03 кг', 360.00, 'Кольцо уплотнительное бортового редуктора SHAANXI/ NORD BENZ/MAN/FAW малое', 'FAW290', '00966   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18787, 34, '10*800', '0.00036 м3', '0.06 кг', 0.00, 'Ремень   10* 800 генератора NORD BENZ/HOWO дешево', 'HOWO', '10720   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18788, 22, '36AD-10560', '0.00591 м3', '0.85 кг', 23920.00, 'Датчик уровня топлива CAMC  350 л.', 'CAMC', '00611   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18789, 32, 'WG9231342006', '0.06912 м3', '55.00 кг', 30360.00, 'Барабан тормозной HOWO  HC16 2009 задний', 'HOWO', '00048   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18790, 24, '1605AD-010', '0.00179 м3', '0.05 кг', 4500.00, 'Бачок расширительный сцепления CAMC', 'CAMC', '08467   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18791, 30, 'WG9000360523', '0.00215 м3', '0.75 кг', 9000.00, 'Клапан воздушный предохранительный 4х контурный HOWO 2008', 'HOWO', '00783   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18792, 23, 'WG9719190001', '0.15447 м3', '12.70 кг', 57660.00, 'Корпус воздушного фильтра HOWO 0001', 'HOWO', '04718   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18793, 40, 'CA3310', '0.00129 м3', '2.80 кг', 8505.00, 'Амортизатор FAW J6 передний', 'FAW J6', '06110   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18794, 21, '6500010383.', '0.30719 м3', '320.00 кг', 604800.00, 'Блок двигателя WD615 Euro II 12 клапанов', 'SINOTRUK', '00092   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18795, 20, '90003802561.', '0.00016 м3', '0.60 кг', 540.00, 'Болт WD615 Euro II M10x75 D00933', 'WD615', '04083   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18796, 33, '10*50', '1.0E-5 м3', '0.03 кг', 540.00, 'болт  под шестигранник 10*50', 'TY', '06582   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18797, 37, NULL, '0.00036 м3', '0.02 кг', 0.00, 'Болт зуба ковша экскаватора XCMG XE230C', 'XCMG', '04556   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18798, 42, '2801/11', '0.00074 м3', '0.25 кг', 9000.00, 'Бендикс стартера 2801 BOSCH 11 зубьев', 'BOSCH', '00083   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18799, 38, '24*63', '0.0001 м3', '0.27 кг', 0.00, 'Крестовина 24*63 привода рулевого управления DONGFENG 140*153', 'DF', '10807   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18800, 36, 'GR165/180/215', '0.00961 м3', '12.00 кг', 0.00, 'Блок клапанов XCMG GR165/180/215', 'XCMG', '06391   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18801, 39, NULL, '0.0552 м3', '49.00 кг', 0.00, 'Балка передняя DONGFENG Q02', 'DF', '10128   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18802, 28, 'NF-B01-03051-1500010', '0.00144 м3', '0.30 кг', 38640.00, 'Блок управления автономной печи NF', 'NF', '00107   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18803, 41, 'WG69100470033-1', '0.0094 м3', '2.35 кг', 11960.00, 'Бачок ГУР HOWO 2010', 'HOWO', '00063   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18804, 28, '8.1', '0.00134 м3', '0.35 кг', 0.00, 'Блок управления автономной печи NF 8.1', '南风', '11381   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18805, 39, '2300132', '2.0E-5 м3', '0.04 кг', 0.00, 'Болт  для крепления якоря заднего тормоза FAW 290', 'FAW290', '07800   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18806, 36, 'ZL20-039000X2', '0.01212 м3', '13.50 кг', 114000.00, 'Блок клапанов XCMG LW300F', 'XCMG', '07314   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18807, 38, NULL, '0.00134 м3', '3.50 кг', 0.00, 'Крестовина 246', NULL, '07993   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18808, 42, NULL, '0.0004 м3', '1.00 кг', 9000.00, 'Бендикс стартера 2816 (CUMMINS)12 зубьев 15 шлицов', 'CUMMINS', '00085   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18809, 37, NULL, '2.0E-5 м3', '0.02 кг', 0.00, 'Болт на Подкова седло', 'TY', '09294   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18810, 33, '12*30', '2.0E-5 м3', '0.04 кг', 540.00, 'болт  под шестигранник 12*30', 'TY', '06583   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18811, 20, '90003800571.', '1.0E-5 м3', '0.06 кг', 360.00, 'Болт WD615 Euro II M10x80 D00931', 'WD615', '04081   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18812, 21, '61800010109.', '0.322 м3', '308.00 кг', 1000000.00, 'Блок двигателя WD618 Euro II 12 клапанов', 'WD618', '00095   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18813, 40, '2905010-369', '0.004 м3', '3.80 кг', 8505.00, 'Амортизатор FAW передний', 'FAW', '00004   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18814, 30, 'WG9000360523', '0.00234 м3', '0.80 кг', 9000.00, 'Клапан воздушный предохранительный 4х контурный HOWO/SHAAN', 'HOWO', '00784   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18815, 23, 'DZ9114190150', '0.15188 м3', '12.30 кг', 53940.00, 'Корпус воздушного фильтра SHAANXI 0150', 'DL', '04719   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18816, 24, '1602100-362', '0.00125 м3', '0.10 кг', 0.00, 'Бачок расширительный сцепления FAW', 'FAW29D', '00078   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18817, 22, '1103010-242', '0.00274 м3', '0.25 кг', 0.00, 'Датчик уровня топлива FAW', 'FAW', '04778   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18818, 32, 'WG9970340081', '0.09983 м3', '78.00 кг', 0.00, 'Барабан тормозной HOWO 70T задний', 'HOWO/70矿', '09908   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18819, 34, '10*815', '0.00014 м3', '0.06 кг', 1440.00, 'Ремень   10* 815 генератора SHAANXI', 'DL', '02290   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18820, 26, '99012340029.', '0.00014 м3', '0.05 кг', 360.00, 'Кольцо уплотнительное бортового редуктора STEYR большое', 'STR', '00967   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18821, 31, 'DZ91259535601', '0.00173 м3', '0.28 кг', 2700.00, 'Патрубок 100*125', 'TY', '07104   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18822, 27, '2803010-436', NULL, '0.00 кг', 0.00, 'Бампер FAW СА 3252 металлический', 'FAW', '04497   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18823, 31, '1424211900003.', '0.00303 м3', '0.53 кг', 5760.00, 'Патрубок 100*250', 'TY', '07106   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18824, 26, '199012340027.', '0.00012 м3', '0.03 кг', 270.00, 'Кольцо уплотнительное бортового редуктора STEYR малое', 'STR', '00968   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18825, 32, 'AZ9970440001', '0.09075 м3', '83.00 кг', 0.00, 'Барабан тормозной HOWO 70T передний', 'HOWO/70矿', '09909   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18826, 34, '10*825', NULL, '0.00 кг', 0.00, 'Ремень   10* 825', 'TY', '08463   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18827, 22, '3806040-60A', NULL, '0.00 кг', 0.00, 'Датчик уровня топлива FAW J6  400L', 'FAW J6', '07913   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18828, 30, 'A 006 431 40 06', NULL, '0.00 кг', 0.00, 'Клапан воздушный предохранительный 4х контурный NORD BENZ', 'MB', '00785   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18829, 24, 'CP1930EA010', '0.00176 м3', '0.80 кг', 13800.00, 'Блок клапанов КПП вспомогательных FAST 9/12', 'FST', '00097   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18830, 23, 'DZ9118190230', '0.19125 м3', '14.00 кг', 70680.00, 'Корпус воздушного фильтра SHAANXI 0230', 'DL', '04717   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18831, 40, 'WG9100680001', '0.00365 м3', '2.90 кг', 0.00, 'Амортизатор HOWO 8*4 передний NANJINGZHENGDA', 'HOWO', '09072   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18832, 21, 'WP10 1729', NULL, '0.00 кг', 0.00, 'Блок двигателя WP10Euro II (2 клапана на цилинд)', 'WP10/EGR', '06326   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18833, 33, '12*40', '2.0E-5 м3', '0.04 кг', 630.00, 'болт  под шестигранник 12*40', 'TY', '06584   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18834, 37, NULL, '7.0E-5 м3', '0.12 кг', 0.00, 'Болт Нож отвала средний 16*60 XCMG GR215', 'XCMG', '10032   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18835, 20, '90003802576.', '2.0E-5 м3', '0.05 кг', 540.00, 'Болт WD615 Euro II M10x90 D00933', 'WD615', '04094   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18836, 42, NULL, '0.00047 м3', '1.00 кг', 0.00, 'Бендикс стартера 2816A CUMMINS 12 зубьев', 'CUMMINS', '08914   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18837, 38, '39*118 141', '0.00058 м3', '1.40 кг', 4500.00, 'Крестовина 39*118', NULL, '04723   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18838, 36, 'ZL50/ZL30E', '0.019 м3', '19.50 кг', 0.00, 'Блок клапанов АКПП LIUGONG ZL50/ZL30', 'LIUGONG', '04998   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18839, 39, '14*29*1.5', '0.0002 м3', '0.05 кг', 0.00, 'Болт  редуктор среднего моста FAW290 14*30*1.5', 'FAW290', '09096   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18840, 28, NULL, NULL, '0.00 кг', 0.00, 'Блок управления автономной печи SHENGWEI', '胜威', '00108   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18841, 41, '207 460 00 02', '0.00588 м3', '1.60 кг', 10488.00, 'Бачок ГУР NORD BENZ', 'MB', '07398   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18842, 28, NULL, '0.00063 м3', '0.25 кг', 38640.00, 'Блок управления автономной печи TIANWEI', '天威', '08084   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18843, 39, '14*39*1.5', '3.0E-5 м3', '0.06 кг', 0.00, 'Болт  редуктор среднего моста FAW290 14*35*1.5', 'FAW290', '09097   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18844, 36, '403700.', '0.01069 м3', '13.00 кг', 38640.00, 'Блок клапанов АКПП ZL50', 'XCMG', '00096   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18845, 38, '22*55', NULL, '0.00 кг', 0.00, 'Крестовина кардана 22*55 ZL16', 'ZL16', '03868   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18846, 42, NULL, '0.00045 м3', '0.80 кг', 9000.00, 'Бендикс стартера 2816G (CUMMINS)12 зубьев 14 шлицов', 'CUMMINS', '00086   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18847, 37, NULL, '9.0E-5 м3', '0.24 кг', 0.00, 'Болт Нож отвала средний 20*72 SHANTUI SD23', 'SHANTUI', '10034   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18848, 33, '12*50', '2.0E-5 м3', '0.05 кг', 720.00, 'болт  под шестигранник 12*50', 'TY', '06585   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18849, 20, '90003802321.', NULL, '0.01 кг', 180.00, 'Болт WD615 Euro II M6xl6D 00933', 'WD615', '03839   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18850, 21, 'WP10 90029', NULL, '0.00 кг', 0.00, 'Блок двигателя WP10Euro III (2 клапана на цилинд)', 'WP10/欧3', '06327   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18851, 40, 'WG9114680004', '0.00422 м3', '4.50 кг', 0.00, 'Амортизатор HOWO/STEYR передний', 'HOWO', '00005   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18852, 30, 'WG9000360366', '0.00126 м3', '1.10 кг', 8100.00, 'Клапан воздушный предохранительный 4х контурный STEYR', 'STR', '00786   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18853, 23, 'DZ9325190040', '0.2663 м3', '20.00 кг', 89280.00, 'Корпус воздушного фильтра SHAANXI F3000  0040', 'F2000', '05911   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18854, 24, 'F99588', '7.0E-5 м3', '0.15 кг', 4500.00, 'Блок КПП переключающий 1 и 2 передачи FAST', 'FST', '00098   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18855, 22, 'WG9112550128/1', '0.00666 м3', '0.58 кг', 11040.00, 'Датчик уровня топлива HOWO 200L', 'HOWO', '00612   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18856, 32, '346 423 03 01', '0.06406 м3', '49.00 кг', 27600.00, 'Барабан тормозной NORD BENZ задний 180 мм (старая модель)', 'MB', '00053   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18857, 34, '*1040*10', '0.00017 м3', '0.08 кг', 1080.00, 'Ремень   10*1040', 'HOWO', '02291   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18858, 26, '50M.01-03', NULL, '0.00 кг', 0.00, 'Крышка сальник XCMG LW521F хвостовика заднего моста', 'XCMG', '05759   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18859, 31, 'DZ91259535606', '0.00396 м3', '0.71 кг', 5940.00, 'Патрубок 100*270', 'DL', '07105   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18860, 27, 'WG1641240001', '0.13796 м3', '7.00 кг', 13910.40, 'Бампер HOWO 2007  (самосвал)пластиковый', 'HOWO/07', '00032   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18861, 31, '110*1000', '0.121 м3', '2.30 кг', 12880.00, 'Патрубок 110*1000', 'TY', '03828   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18862, 26, '612600010928.', '0.0009 м3', '0.85 кг', 0.00, 'Крышка сальника лобового HOWO WD615 Euro II', 'WD615', '03922   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18863, 34, '10*1070', '0.00034 м3', '0.08 кг', 1800.00, 'Ремень   10*1070 CAMC', 'CAMC', '07607   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18864, 22, 'WG9112550131/1', '0.00823 м3', '0.56 кг', 18400.00, 'Датчик уровня топлива HOWO 350L', 'HOWO', '00613   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18865, 32, '505 423 04 01', '0.0529 м3', '46.00 кг', 30360.00, 'Барабан тормозной NORD BENZ задний 220 мм (новая модель)', 'MB', '00054   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18866, 39, '90003802721..', '2.0E-5 м3', '0.06 кг', 374.40, 'Болт вала конической пары ср.моста STEYR 14*30', 'STR', '00126   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18867, 24, 'F99589', '0.00017 м3', '0.35 кг', 5040.00, 'Блок КПП переключающий 3 и 4 передачи FAST', 'FST', '00099   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18868, 28, NULL, NULL, '0.00 кг', 0.00, 'Датчик кондиционера SHAANXI F3000', 'F3000', '09234   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18869, 23, 'ZL40.3.200A', '0.00468 м3', '4.40 кг', 0.00, 'Корпус фильтра АКПП в сборе с фильтром XCMG ZL50G', 'XCMG', '09154   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18870, 41, 'DZ91189470033', '0.00563 м3', '1.70 кг', 8100.00, 'Бачок ГУР SHAANXI', 'DL', '06317   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18871, 40, 'WG9114680004', '0.00356 м3', '4.20 кг', 8100.00, 'Амортизатор HOWO/STEYR передний (двухсторонний)', 'HOWO', '05474   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18872, 38, '27*82', NULL, '0.00 кг', 0.00, 'Крестовина кардана 27*82 ZL16', 'ZL16', '03783   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18873, 20, '90003802493.', '2.0E-5 м3', '0.05 кг', 540.00, 'Болт WD615 Euro II M8x110 DIN933', 'WD615', '03802   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18874, 33, '12*60', '4.0E-5 м3', '0.06 кг', 720.00, 'болт  под шестигранник 12*60', 'TY', '06586   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18875, 36, '9309739.', NULL, '0.00 кг', 0.00, 'Вал привода главный гидронасос XCMG LW521F/LW500F/LW500K', 'XCMG', '06842   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18876, 42, NULL, '0.00061 м3', '1.13 кг', 9000.00, 'Бендикс стартера 281G QD2816 (XCMG 955)12 зубьев', 'CUMMINS', '06115   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18877, 37, NULL, '0.00011 м3', '0.35 кг', 0.00, 'Болт Нож отвала средний 22*86 SHANTUI SD32', 'SHANTUI', '10033   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18878, 28, NULL, '4.0E-5 м3', '0.04 кг', 6840.00, 'Датчик огня отопителя Hongye (мелкая резьба)', '宏业', '00579   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18879, 30, '3516015-367', '0.00145 м3', '0.60 кг', 7560.00, 'Клапан воздушный предохранительный FAW CA3252', 'FAW', '00787   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18880, 21, 'WP12 900045', NULL, '0.00 кг', 0.00, 'Блок двигателя WP12Euro III (2 клапана на цилинд)', 'WP12', '06328   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18881, 39, 'CQ1601475S', '7.0E-5 м3', '0.10 кг', 0.00, 'Болт дифференциала FAW 457 14*76', 'FAW457', '04964   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18882, 36, 'ZL40A.30-9', '0.01004 м3', '5.45 кг', 29808.00, 'Вал привода главный гидронасос XCMG ZL50G', 'XCMG', '06333   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18883, 38, '33*93', '0.00036 м3', '0.85 кг', 4500.00, 'Крестовина кардана 33*93 JAC', 'JAC', '01059   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18884, 42, NULL, '0.00042 м3', '0.80 кг', 9000.00, 'Бендикс стартера FAW 10 зубьев 12 шлицов', 'FAW', '04821   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18885, 37, 'AZ1642430071', '0.0002 м3', '0.56 кг', 0.00, 'Болт торсиона кабины (сайлентблока) HOWO 24*145', 'HOWO', '00188   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18886, 33, '12*70*1.75', '4.0E-5 м3', '0.07 кг', 0.00, 'болт  под шестигранник 12*70*1.75', 'TY', '10359   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18887, 20, '90003802424.', NULL, '0.01 кг', 180.00, 'Болт WD615 Euro II M8x25 D00933', 'WD615', '03836   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18888, 21, 'WP12 10009', NULL, '0.00 кг', 0.00, 'Блок двигателя WP12Euro III (4 клапана на цилинд)', 'WP12', '06329   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18889, 40, 'WG9114680004', '0.00365 м3', '4.00 кг', 9936.00, 'Амортизатор HOWO/STEYR передний (двухсторонний) NANJINGZHENGDA', 'HOWO', '08972   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18890, 23, '1109510-385', '0.06642 м3', '3.10 кг', 0.00, 'Корпус фильтра воздушного FAW 2337', 'FAW', '08728   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18891, 30, 'WG9000360519', '0.00068 м3', '0.32 кг', 0.00, 'Клапан воздушный предохранительный HOWO', 'HOWO', '11253   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18892, 24, '*', '0.01276 м3', '12.30 кг', 53940.00, 'Блок шестерен задней скорости XCMG ZL50G', 'XCMG', '06863   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18893, 22, 'WG9112550129/1', '0.00871 м3', '0.56 кг', 11040.00, 'Датчик уровня топлива HOWO 380L', 'HOWO', '00614   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18894, 32, '346 421 03 01', '0.0576 м3', '45.00 кг', 24840.00, 'Барабан тормозной NORD BENZ передний', 'MB', '07631   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18895, 34, '10*1075', '0.00017 м3', '0.08 кг', 1440.00, 'Ремень   10*1075 генератора HOWO', 'HOWO', '02292   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18896, 26, 'VG2600010934', '2.0E-5 м3', '0.01 кг', 0.00, 'Прокладка крышки лобового сальника HOWO WD615 Euro II', 'WD615', '04090   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18897, 31, '51611ZG1109051', '0.00219 м3', '0.36 кг', 3600.00, 'Патрубок 110*120', 'TY', '07112   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18898, 27, NULL, '0.294 м3', '16.00 кг', 0.00, 'Бампер HOWO 2007 (тягач) металлический', 'HOWO/07', '10719   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18899, 31, '12*1000', '0.0004 м3', '0.30 кг', 0.00, 'Патрубок 12*1000', 'TY', '07174   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18900, 26, NULL, '2.0E-5 м3', '0.01 кг', 0.00, 'проставка на форсунку', NULL, '08965   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18901, 34, '10*1200', '0.00018 м3', '0.08 кг', 1260.00, 'Ремень   10*1200', 'TY', '02293   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18902, 32, '81.50110.0144', '0.0685 м3', '55.00 кг', 30360.00, 'Барабан тормозной SHAANXI (мост MAN)задний', 'DL', '00055   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18903, 24, '2BS315AB6', '0.01116 м3', '13.50 кг', 161500.00, 'Блок шестерен задней скорости XCMG ZL50G 2009', 'XCMG', '07341   ');
INSERT INTO item (id, category_id, oem, capacity, weight, amount, name, usage, code) VALUES (18904, 22, 'DZ91189551031', '0.00787 м3', '0.65 кг', 13800.00, 'Датчик уровня топлива SHAANXI 200L', 'DL', '00615   ');

CREATE TABLE user_order (
  id bigint auto_increment,
  user_id bigint references users(id),
  order_date timestamp,
  city varchar(255),
  address varchar(255),
  primary key (id));
  
CREATE TABLE ordered_Item (
  id bigint auto_increment,
  user_order_id bigint references user_order(id),
  item_id bigint references item(id),
  quantity integer,
  primary key (id));
