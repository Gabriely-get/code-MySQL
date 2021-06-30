insert into tb_nivel_acesso values
(1,'AL = Área Livre'),
(2,'AC = Área Controlada'),
(3,'AR = Área Restrita');

insert into tb_empresa values
(11,'Petrobras',00000000000001,00000001,'Avenida Presidente Kennedy, 480','Aviação','Praia Grande','São Paulo',null,'Petrobras@gmail.com'),
(12,'Ultra Farma',00000000000002,00000002,'Avenida Presidente Kennedy, 1207','Ocian','Praia Grande','São Paulo',null,'Ultrafarma@gmail.com'),
(13,'Banco do Brasil',00000000000003,00000003,'Avenida Presidente Kennedy, 12','Forte','Praia Grande','São Paulo',null,'Bancodobrasil@gmail.com'),
(14,'Extra',00000000000004,00000004,'Avenida Presidente Kennedy, 215','Vila Sônia','Praia Grande','São Paulo',null,'Extra@gmail.com'),
(15,'Sabesp',00000000000005,00000005,'Rua das mantiqueiras, 22','Gonzaga','Santos','São Paulo',null,'Sabesp@gmail.com');

insert into tb_jornada_trabalho values
(21,'horário comercial','09:00:00','18:00:00'),
(22,'horário flexível','14:00:00','22:00:00'),
(23,'primeiro turno','00:00:00','06:00:00'),
(24,'segundo turno','06:00:00','12:00:00'),
(25,'terceiro turno','12:00:00','18:00:00'),
(26,'quarto turno','18:00:00','00:00:00');

insert into tb_categoria_usuario values
(31,'funcionário'),
(32,'terceiro'),
(33,'visitante'),
(34,'estagiário'),
(35,'fornecedor'),
(36,'cliente');

insert into tb_ocorrencia values
(41,'hora extra','jornada ultrapassa tempo pre-estabelecido'),
(42,'insalubridade','beneficio pago quando há riscos'),
(43,'adicional noturno','para quem trabalha entre 22h e 5h'),
(44,'sobreaviso','estar disponivel no descanso para o trabalho'),
(45,'atraso','entrada após inicio da jornada');

insert into tb_tipo_data values
('FE','Feriado Nacional'),
('FR','Férias'),
('WE','Final de Semana'),
('FU','Data Facultativa');

insert into tb_calendario values
(51,'FU','é facultativo do natal','2019/12/24'),
(52,'FR','o funcionário estava de férias','2019/01/11'),
(53,'FE','é o natal','2019/12/25'),
(54,'WE','é final de semana','2019/08/03'),
(55,'FR','o funcionário estava de férias','2019/03/02'),
(56,'FE','a confraternização universal','2019/01/01'),
(57,'FR','o funcionário estava de férias','2019/03/12'),
(58,'FE','é páscoa','2019/04/14'),
(59,'FE','independência do Brasil','2019/09/07'),
(60,'WE','é final de semana','2019/08/10');

insert into tb_localidade values
(71,1,'refeitório'),
(72,2,'escritórios'),
(73,3,'laboratorios'),
(74,2,'sala de reuniões'),
(75,2,'sala de audiovisual');

insert into tb_usuario values
(101,'Alex Pagliari',0000000101,00000000101,13974152490,31,11,1,21),
(102,'Paula Damiana',0000000102,00000000102,13974152491,32,12,2,22),
(103,'Alisson Marques',0000000103,00000000103,13974152492,33,13,3,23),
(104,'Marcos Augusto',0000000104,00000000104,13974152493,34,14,1,24),
(105,'Lauren Jauregui',0000000105,00000000105,13974152494,35,15,2,25),
(106,'Camila Cabello',0000000106,00000000106,13974152495,36,11,3,26),
(107,'Dinah Jane',0000000107,00000000107,13974152496,32,12,1,22),
(108,'Camila Queiroz',0000000108,00000000108,13974152497,34,13,2,24),
(109,'Luisa Sonza',0000000109,00000000109,13974152499,36,14,3,26),
(110,'Luana Piovanni',0000000110,00000000110,13974152410,33,15,2,23);

insert into tb_movimentacao values
(81, '2019/07/31', '2019/07/31', '09:00:00', '12:00:00', 51, 41, 101),
(82, '2019/07/31', '2019/07/31', '12:00:00', '15:00:00', 52, 42, 102),
(83, '2019/07/31', '2019/07/31', '15:00:00', '18:00:00', 53, 43, 103),
(84, '2019/07/31', '2019/07/31', '18:00:00', '21:00:00', 54, 44, 104),
(85, '2019/07/31', '2019/07/31', '21:00:00', '00:00:00', 55, 45, 105),
(86, '2019/07/31', '2019/07/31', '00:00:00', '03:00:00', 56, 41, 106),
(87, '2019/07/31', '2019/07/31', '03:00:00', '06:00:00', 57, 42, 107),
(88, '2019/07/31', '2019/07/31', '06:00:00', '09:00:00', 58, 43, 108),
(89, '2019/07/31', '2019/07/31', '08:00:00', '10:00:00', 59, 44, 109),
(90, '2019/07/31', '2019/07/31', '10:00:00', '12:00:00', 60, 45, 110);

insert into tb_banco_hora values
(91,81,'2019/07/31',240),
(92,82,'2019/07/31',280),
(93,83,'2019/07/31',320),
(94,84,'2019/07/31',180),
(95,85,'2019/07/31',240),
(96,86,'2019/07/31',400),
(97,87,'2019/07/31',100),
(98,88,'2019/07/31',120),
(99,89,'2019/07/31',410),
(100,90,'2019/07/31',150);

-- é isso?????

insert into tb_setor values
(201,'Administrativo'),
(202,'Financeiro'),
(203,'Recursos Humanos'),
(204,'Setor Comercial');

insert into tb_status values
(301,'On'),
(301, 'Off');