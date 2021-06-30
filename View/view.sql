show tables;

desc vwsalario_anual;

select * from VWSalario_Anual; 

create view VWSalario_Anual (codigo, nome, salario_anual) as select cd_revendedor, nm_vendedor, vl_salario*12
	from tb_revendedor;
    
select * from vwsalario_anual
	where salario_anual > 30000;
    
create view VWPedido_SubTotal as
select c.nm_cliente, cd.sg_uf, pr.nm_produto, i.qt_produto, i.qt_produto * pr.vl_produto as subtotal
from tb_cliente as c join tb_pedido as p
on c.cd_cliente = p.cd_cliente
join tb_cidade as cd
on c.cd_cidade = cd.cd_cidade
join item_pedido as i
on p.cd_pedido = i.cd_pedido
join tb_produto as pr
on i.cd_produto = pr.cd_produto;

select * from vwpedido_subtotal;
