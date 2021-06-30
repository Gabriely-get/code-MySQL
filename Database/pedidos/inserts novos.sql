create table tb_uf(
sg_uf char(2) not null,
nm_uf varchar(30),
constraint pk_uf primary key(sg_uf));

create table tb_cidade(
cd_cidade int not null,
nm_cidade varchar(40),
sg_uf char(2),
constraint pk_cidade primary key(cd_cidade),
constraint fk_cidade_uf foreign key(sg_uf) references tb_uf(sg_uf));

desc tb_cliente;

alter table tb_cliente add cd_cidade int;

alter table tb_cliente add constraint fk_cliente_cidade foreign key(cd_cidade) references tb_cidade(cd_cidade);

select * from tb_uf;

insert into tb_uf values
('AC', 'Acre'),
('AL', 'Alagoas'),
('AM', 'Amazonas'),
('AP', 'Amapá'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espirito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MG', 'Minas Gerais'),
('MS', 'Mato Grosso do Sul'),
('MT', 'Mato Grosso'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('PR', 'Paraná'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('RS', 'Rio Grande do Sul'),
('SC', 'Santa Catarina'),
('SE', 'Sergipe'),
('SP', 'São Paulo'),
('TO', 'Tocantins');

insert into tb_cidade values
(101, 'São Paulo', 'SP'),
(102, 'Belo Horizonte', 'MG'),
(103, 'Florianopolis', 'SC'),
(104, 'Londrina', 'PR'),
(105, 'Rio de Janeiro', 'RJ'),
(106, 'Niterói', 'RJ'),
(107, 'Curitiba', 'PR'),
(108, 'Salvador', 'BA'),
(109, 'Uberaba', 'MG'),
(110, 'Brasilia', 'DF');

select * from tb_cliente;

update tb_cliente set cd_cidade = 106 where cd_cliente = 720;
update tb_cliente set cd_cidade = 101 where cd_cliente = 870;
update tb_cliente set cd_cidade = 107 where cd_cliente = 110;
update tb_cliente set cd_cidade = 102 where cd_cliente = 222;
update tb_cliente set cd_cidade = 101 where cd_cliente = 830;
update tb_cliente set cd_cidade = 105 where cd_cliente = 103;
update tb_cliente set cd_cidade = 105 where cd_cliente = 410;
update tb_cliente set cd_cidade = 101 where cd_cliente = 201;
update tb_cliente set cd_cidade = 104 where cd_cliente = 157;
update tb_cliente set cd_cidade = 103 where cd_cliente = 180;
update tb_cliente set cd_cidade = 106 where cd_cliente = 260;
update tb_cliente set cd_cidade = 101 where cd_cliente = 290;
update tb_cliente set cd_cidade = 109 where cd_cliente = 390;
update tb_cliente set cd_cidade = 110 where cd_cliente = 234;
update tb_cliente set cd_cidade = 108 where cd_cliente = 130;

alter table tb_revendedor add cd_cpf char(11);
alter table tb_revendedor add vl_salario decimal(9,2);

select * from tb_revendedor;

update tb_revendedor set cd_cpf = '12345678989', vl_salario = 4556.89 where cd_revendedor = 011;
update tb_revendedor set cd_cpf = '98765432134', vl_salario = 5674.34 where cd_revendedor = 240;
update tb_revendedor set cd_cpf = '98543213476', vl_salario = 1675.14 where cd_revendedor = 720;
update tb_revendedor set cd_cpf = '34987654321', vl_salario = 1124.34 where cd_revendedor = 213;
update tb_revendedor set cd_cpf = '87634932154', vl_salario = 4324.19 where cd_revendedor = 101;
update tb_revendedor set cd_cpf = '15487634932', vl_salario = 2724.20 where cd_revendedor = 310;
update tb_revendedor set cd_cpf = '63415932487', vl_salario = 3241.25 where cd_revendedor = 250;

select * from tb_revendedor;

select nm_vendedor, sg_categoria, vl_salario 
from tb_revendedor;

select nm_vendedor as nm_revendedor
from tb_revendedor;

select nm_vendedor, sg_categoria from tb_revendedor where vl_salario > 3000;