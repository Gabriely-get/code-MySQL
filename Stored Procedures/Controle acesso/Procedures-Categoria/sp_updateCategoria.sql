delimiter $
create procedure sp_updateCategoria(
in codigo int,
in descricao varchar(45))
begin
	
	declare cod int;
    select cd_categoria_usuario from tb_categoria_usuario where codigo = cd_categoria_usuario into cod;

	if exists(select cd_categoria_usuario from tb_categoria_usuario where cd_categoria_usuario = codigo) then 
		update tb_categoria_usuario
        set ds_usuario = descricao
        where cd_categoria_usuario = cod;
        
		select concat('Dados da categoria alterados com sucesso !') as Alert;
	else
		select concat('Categoria não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_updateCategoria;