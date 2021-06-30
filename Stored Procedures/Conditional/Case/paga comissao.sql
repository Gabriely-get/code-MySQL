delimiter $
create procedure spPaga_comissao(
in bonus decimal(9,2),
in comissao char(1)
)
begin
	declare perc float;
    case comissao
		when 'e' then 
			set perc = 1.2;
		when 'd' then
			set perc = 1.15;
		when 'c' then
			set perc = 1.1;
		when 'b' then
			set perc = 1.075;
		when 'a' then
			set perc = 1.05;
		else select 'Categoria inexistente';
	end case;
    select nm_vendedor as Vendedor, vl_salario as Salário, vl_salario * perc + bonus as 'Salário com Bônus'
		from tb_revendedor
			where sg_categoria = comissao
				order by nm_vendedor;
end $
