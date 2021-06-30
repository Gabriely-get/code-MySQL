show tables;

create table tb_auditoria(
usuario varchar(45),
acao varchar(15),
data_acao date,
hora_acao time,
codigo int
);

insert into tb_revendedor values
(60, 'Marinalva', 'B', 6798.90, '98765432112');

select * from tb_auditoria;
select * from tb_revendedor;
desc tables;