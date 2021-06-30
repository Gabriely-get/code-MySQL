delimiter $
	create procedure spPaga_comissao(
    in comissao float(4,2),
    in bonus decimal(6,2),
    in categoria char(1))
		begin
			select nm_revendedor, vl_salario, vl_salario * comissao + bonus
				from tb_revendedor
					where sg_categoria = categoria
						order by nm_revendedor;
		end $
        
call spPaga_comissao(1.5,200,'c'); -- parametro: pode variar | não usar like