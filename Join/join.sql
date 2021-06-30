select * from tb_pedido;

select c.nm_cliente, p.cd_pedido, r.nm_vendedor, i.qt_produto
from tb_pedido as p join tb_cliente as c
on p. cd_cliente = c.cd_cliente
join tb_revendedor as r
on p.cd_revendedor = r.cd_revendedor
join item_pedido as i 
on i.cd_pedido = p.cd_pedido
where i.qt_produto > 30;

select c.nm_cliente, p.cd_pedido, r.nm_vendedor, i.qt_produto, i.qt_produto * pr.vl_produto as Subtotal
from tb_pedido as p join tb_cliente as c
on p.cd_cliente = c.cd_cliente
join tb_revendedor as r
on p.cd_revendedor = r.cd_revendedor
join item_pedido as i 
on i.cd_pedido = p.cd_pedido
join tb_produto as pr
on pr.cd_produto = i.cd_produto
where i.qt_produto > 30;