create database db_controleacesso;

use db_controleacesso;

create table tb_nivel_acesso(
cd_nivel_acesso int not null,
ds_nivel_acesso varchar(45),
constraint pk_nivel_acesso primary key(cd_nivel_acesso));

create table tb_empresa(
cd_empresa int not null,
nm_empresa varchar(45),
cd_cnpj char(14),
cd_cep char(8),
nm_endereco varchar(45),
nm_bairro varchar(45),
nm_cidade varchar(45),
nm_uf varchar(45),
nm_complemento varchar(45),
nm_email varchar(45),
constraint pk_empresa primary key(cd_empresa));

create table tb_jornada_trabalho(
cd_jornada_trabalho int not null,
ds_jornada_trabalho varchar(45),
hr_inicio_jornada_trabalho time,
hr_fim_jornada_trabalho time,
constraint pk_jornada_trabalho primary key(cd_jornada_trabalho));

create table tb_categoria_usuario(
cd_categoria_usuario int not null,
ds_usuario varchar(45),
constraint pk_categoria_usuario primary key(cd_categoria_usuario));

create table tb_ocorrencia(
cd_ocorrencia int not null,
nm_ocorrencia varchar(45),
ds_ocorrencia varchar(45),
constraint pk_ocorrencia primary key(cd_ocorrencia));

create table tb_tipo_data(
sg_data char(2) not null,
ds_tipo_data varchar(35),
constraint pk_tipo_data primary key(sg_data)); 

create table tb_calendario(
cd_data int not null,
sg_data char(2),
ds_data varchar(35),
dt_data date,
constraint pk_calendario primary key(cd_data),
constraint fk_calendario_tipo foreign key(sg_data) references tb_tipo_data(sg_data));

create table tb_localidade(
cd_localidade int not null,
cd_nivel_acesso int,
ds_localidade varchar(45),
constraint pk_localidade primary key(cd_localidade),
constraint fk_localidade_nivel foreign key(cd_nivel_acesso) references tb_nivel_acesso(cd_nivel_acesso));

create table tb_usuario(
cd_usuario int not null,
nm_usuario varchar(45),
cd_rg char(10),
cd_cpf char(11),
cd_telefone varchar(11),
cd_categoria_usuario int,
cd_empresa int,
cd_nivel_acesso int,
cd_jornada_trabalho int,
constraint pk_usuario primary key(cd_usuario),
constraint fk_usuario_jornada foreign key(cd_jornada_trabalho) references tb_jornada_trabalho(cd_jornada_trabalho),
constraint fk_usuario_categoria foreign key(cd_categoria_usuario) references tb_categoria_usuario(cd_categoria_usuario),
constraint fk_usuario_nivel foreign key(cd_nivel_acesso) references tb_nivel_acesso(cd_nivel_acesso),
constraint fk_usuario_empresa foreign key(cd_empresa) references tb_empresa(cd_empresa));

create table tb_movimentacao(
cd_movimentacao int not null,
dt_entrada date,
dt_saida date,
hr_entrada time,
hr_saida time,
cd_data int,
cd_ocorrencia int,
cd_usuario int,
constraint pk_movimentacao primary key(cd_movimentacao),
constraint fk_movimento_ocorrencia foreign key(cd_ocorrencia) references tb_ocorrencia(cd_ocorrencia),
constraint fk_movimento_usuario foreign key(cd_usuario) references tb_usuario(cd_usuario),
constraint fk_movimento_calendario foreign key(cd_data) references tb_calendario(cd_data));

create table tb_banco_hora(
cd_banco_horas int not null,
cd_movimentacao int,
dt_trabalhada date,
hr_trabalhada int(10),
constraint pk_banco_hora primary key(cd_banco_horas),
constraint fk_banco_hora_movimentacao foreign key(cd_movimentacao) references tb_movimentacao(cd_movimentacao));

show tables;

-------------------- novos ----------------- é isso????

-- setor

create table tb_setor(
cd_setor int not null,
ds_setor varchar(45)
);

alter table tb_setor
	add constraint pk_setor primary key(cd_setor);

alter table tb_usuario	
	add cd_setor INT;
    
alter table tb_usuario
	add constraint fk_usuario_setor foreign key(cd_setor) references tb_setor(cd_setor);
    

    
set foreign_key_checks=0;
    
    desc tb_usuario;
    
-- status

