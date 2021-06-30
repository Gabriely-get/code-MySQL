show tables;

select * from tb_cliente;
select * from tb_revendedor;
select * from tb_cidade;
select * from tb_uf;
select * from tb_produto;

select nm_vendedor Revendedor, sg_categoria Categoria, vl_salario Salario from tb_revendedor;
select nm_vendedor as Revendedor, sg_categoria as Categoria, vl_salario as Salario from tb_revendedor;

select nm_vendedor Revendedor, sg_categoria Categoria, vl_salario Salario from tb_revendedor where vl_salario > 3000;
select nm_cliente, cd_cpf from tb_cliente where nm_cliente = 'jose';
select * from tb_cliente where cd_cep is null;
select nm_cliente, cd_cpf, cd_cep from tb_cliente where cd_cep >= '30000000' && cd_cep <= '39999999';
select nm_cliente, cd_cpf, cd_cep from tb_cliente where cd_cep >= 30000000 && cd_cep <= 39999999;
select nm_produto, sg_unidade, vl_produto from tb_produto where vl_produto <=1 && vl_produto >= 0.5 || sg_unidade = 'g';
select nm_produto, sg_unidade, vl_produto from tb_produto where not sg_unidade = 'm';
select nm_produto, sg_unidade, vl_produto from tb_produto where vl_produto between 1 and 2;
select nm_produto, sg_unidade, vl_produto from tb_produto where vl_produto not between 1 and 2;
select nm_vendedor, sg_categoria, vl_salario from tb_revendedor where sg_categoria in('a', 'b');

select 8*(9-4)/((586+56)*3);
select acos(0.5);
select asin(0.5);
select atan(0.5);
select degrees(asin(0.5));
select mod(5, 2);
select round(1.3);
select round(1.7);
select ceil(1.3);
select sqrt(25);
select bin(255255254);
select hex(255255254);

select nm_produto, vl_produto as 'Preco Atual', vl_produto * 1.15 as 'Novo Preco' from tb_produto where sg_unidade in ('l','g');
select nm_vendedor as Revendedor, 
sg_categoria as Categoria, 
concat('R$ ', vl_salario) as 'Salario Bruto',
concat('R$ ', vl_salario * 1.15 + 400) as 'Salario Comissionado'
from tb_revendedor 
where sg_categoria = 'c';

select datediff(curdate(), '1973-09-07') / 7;
select datediff(curdate(), '1973-09-07') / 30;
select datediff(curdate(), '1973-09-07') / 365; 

select dt_pedido, datediff(curdate(), dt_pedido) / 360 as anos from tb_pedido;
select dt_pedido, datediff(curdate(), dt_pedido) as dias from tb_pedido;
select dt_pedido, datediff(curdate(), dt_pedido) from tb_pedido;

select dt_pedido, day(dt_pedido), month(dt_pedido), year(dt_pedido) from tb_pedido;
select dt_pedido, dayname(dt_pedido), monthname(dt_pedido), year(dt_pedido), dayofweek(dt_pedido) from tb_pedido;

select dt_pedido, dt_pedido + interval '4' day as 'Intervalo' from tb_pedido;
select dt_pedido, dt_pedido + interval '4' month as 'Intervalo' from tb_pedido;
select dt_pedido, dt_pedido + interval '4' month, dt_pedido + interval '5' day from tb_pedido;

select * from tb_revendedor where nm_vendedor like 'j%';
select * from tb_revendedor where nm_vendedor like '%e%';
select * from tb_revendedor where nm_vendedor like '___a%';

select nm_cliente, position('a' in nm_cliente) from tb_cliente;

select nm_cliente, instr(nm_cliente, 'a') from tb_cliente;

select nm_cliente, length(nm_cliente) from tb_cliente;

select nm_cliente, substring(nm_cliente from 1 for 1) from tb_cliente;

select nm_cliente, substr(nm_cliente, 1, 1) from tb_cliente;

select nm_cliente, replace(nm_cliente, 'ma' , 'ab') from tb_cliente;

