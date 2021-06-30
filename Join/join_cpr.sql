show tables;

select * from tb_revendedor;

select * from tb_cliente join tb_pedido on tb_cliente.cd_cliente = tb_pedido.cd_cliente;

select * from tb_cliente , tb_pedido where tb_cliente.cd_cliente = tb_pedido.cd_cliente;

select * from tb_cliente as c join tb_pedido as p on c.cd_cliente = p.cd_cliente;

select p.cd_cliente, c.nm_cliente, p.dt_pedido from tb_cliente as c join tb_pedido as p on c.cd_cliente = p.cd_cliente;

select p.cd_cliente, c.nm_cliente, p.dt_pedido, cc.nm_cidade, cc.sg_uf from tb_cliente as c join tb_pedido as p on c.cd_cliente = p.cd_cliente join tb_cidade as cc on c.cd_cidade = cc.cd_cidade;

select p.cd_cliente, c.nm_cliente, p.dt_pedido, cc.nm_cidade, cc.sg_uf from tb_cliente as c join tb_pedido as p on c.cd_cliente = p.cd_cliente join tb_cidade as cc on c.cd_cidade = cc.cd_cidade order by nm_cliente;

select p.cd_cliente, c.nm_cliente, p.dt_pedido, cc.nm_cidade, cc.sg_uf from tb_cliente as c join tb_pedido as p on c.cd_cliente = p.cd_cliente join tb_cidade as cc on c.cd_cidade = cc.cd_cidade order by nm_cliente desc;

select * from tb_cliente as c, tb_pedido as p, tb_cidade as cc, tb_revendedor as r where c.cd_cliente = p.cd_cliente and c.cd_cidade = cc.cd_cidade and p.cd_revendedor = r.cd_revendedor;

select p.cd_cliente, c.nm_cliente, p.dt_pedido, cc.nm_cidade, cc.sg_uf, r.nm_vendedor from tb_cliente as c, tb_pedido as p, tb_cidade as cc, tb_revendedor as r where c.cd_cliente = p.cd_cliente and c.cd_cidade = cc.cd_cidade and p.cd_revendedor = r.cd_revendedor;

select p.cd_cliente, c.nm_cliente, p.dt_pedido, cc.nm_cidade, cc.sg_uf, r.nm_vendedor from tb_cliente as c, tb_pedido as p, tb_cidade as cc, tb_revendedor as r where c.cd_cliente = p.cd_cliente and c.cd_cidade = cc.cd_cidade and p.cd_revendedor = r.cd_revendedor order by nm_vendedor;

select p.cd_cliente, c.nm_cliente, p.dt_pedido, cc.nm_cidade, cc.sg_uf, r.nm_vendedor from tb_cliente as c, tb_pedido as p, tb_cidade as cc, tb_revendedor as r where c.cd_cliente = p.cd_cliente and c.cd_cidade = cc.cd_cidade and p.cd_revendedor = r.cd_revendedor and nm_vendedor like 'a%' order by nm_vendedor;

select * from tb_cliente as c left join tb_pedido as p on c.cd_cliente = p.cd_cliente where cd_pedido is null;

select * from tb_cliente as c right join tb_pedido as p on c.cd_cliente = p.cd_cliente;

select * from tb_produto;

select tb_cliente.nm_cliente, tb_cidade.sg_uf, tb_produto.nm_produto, item_pedido.qt_produto 
from tb_cliente join tb_uf join tb_cidade on tb_uf.sg_uf = tb_cidade.sg_uf join tb_pedido on tb_cliente.cd_cliente = tb_pedido.cd_cliente join item_pedido on tb_pedido.cd_pedido = item_pedido.cd_pedido join tb_produto on item_pedido.cd_produto = tb_produto.cd_produto 
where tb_produto.cd_produto = 25 and tb_cidade.sg_uf = 'RJ';

select cc.nm_cidade, count(c.nm_cliente) as 'No. Pedidos'
from tb_cliente as c, tb_pedido as p, tb_cidade as cc, tb_revendedor as r
where r.sg_categoria in ('c', 'b') and c.cd_cliente = p.cd_cliente and c.cd_cidade = cc.cd_cidade and p.cd_revendedor = r.cd_revendedor
group by cc.nm_cidade;
