create table tb_auditoria_salario(
usuario varchar(45),
codigo int,
acao varchar(25),
data_acao date,
hora_acao time,
salario_antigo float(9,2),
salario_novo float(9,2)
);

drop table tb_auditoria_salario;

select * from tb_revendedor;
select * from tb_auditoria_salario;

update tb_revendedor
	set vl_salario = 2500.00
		where cd_revendedor = 60;
        
update tb_revendedor
	set vl_salario = vl_salario * 1.05;
    
set sql_safe_updates = 1;