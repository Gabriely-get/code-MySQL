delimiter $
create procedure sp_deleteCategoria(
in codigo int)
begin
	
	declare cod int;
    select cd_categoria_usuario from tb_categoria_usuario where  cd_categoria_usuario = codigo into cod;

	if exists(select cd_categoria_usuario from tb_categoria_usuario where cd_categoria_usuario = codigo) then 
		delete from tb_categoria_usuario
        where cd_categoria_usuario = cod;
        
		select concat('Categoria excluida com sucesso !') as Alert;
	else
		select concat('Categoria não existente') as ATENÇÃO;
    end if;
end $

drop procedure sp_deleteCategoria;