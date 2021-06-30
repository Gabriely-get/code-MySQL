create database db_cpr; ##criando a base de dados

use db_cpr; ##ativando a base de dados para utilização

create table tb_cliente(
cd_cliente int not null,
nm_cliente varchar(80),
nm_endereco varchar(80),
cd_cep char(8),
cd_cpf char(11),
constraint pk_cliente primary key(cd_cliente)); ##comando utilizado para nomear o indice da chave (restrição)

create table tb_comissao(
sg_comissao char(1) not null,
ds_comissao varchar(30),
constraint pk_comissao primary key(sg_comissao));

desc tb_comissao; ##descrever tabela
alter table tb_comissao change ds_comissao ds_comissao varchar(30); ##alterar tabela -add adiciona e drop apaga

create table tb_unidade(
sg_unidade varchar(3) not null,
nm_unidade varchar(20),
constraint pk_unidade primary key(sg_unidade));

show tables; ##mostra tabelas criadas

create table tb_revendedor(
cd_revendedor int not null,
nm_vendedor varchar(80),
sg_categoria char(1) not null,
constraint pk_revendedor 
	primary key(cd_revendedor),
constraint fk_revendedor_comissao 
	foreign key(sg_categoria) 
		references tb_comissao(sg_comissao)); 
        
	show tables;
    
create table tb_produto(
cd_produto int not null,
nm_produto varchar(80),
sg_unidade varchar(3),
vl_produto decimal(7,2),
constraint pk_produto primary key(cd_produto),
constraint fk_produto_unidade foreign key(sg_unidade) references tb_unidade(sg_unidade));

create table tb_pedido(
cd_pedido int not null,
dt_pedido date,
cd_cliente int,
cd_revendedor int,
constraint pk_pedido primary key(cd_pedido),
constraint fk_pedido_cliente foreign key(cd_cliente) references tb_cliente(cd_cliente),
constraint fk_pedido_revendedor foreign key(cd_revendedor) references tb_revendedor(cd_revendedor));

create table item_pedido(
cd_pedido int,
cd_produto int,
qt_produto int(2),
constraint fk_item_pedido foreign key(cd_pedido) references tb_pedido(cd_pedido),
constraint fk_item_produto foreign key(cd_produto) references tb_produto(cd_produto));