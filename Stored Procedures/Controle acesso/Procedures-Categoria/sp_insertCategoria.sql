delimiter $
create procedure sp_insertCategoria(
in descricao varchar(45))
begin
	if exists(select cd_categoria_usuario from tb_categoria_usuario where ds_usuario = descricao) then 
		select concat('Categoria já existente') as ATENÇÃO;
	else
		insert into tb_categoria_usuario
		select max(cd_categoria_usuario) +1, descricao from tb_categoria_usuario;
    
		select concat('Categoria Cadastrada com sucesso!') as Alert;
    end if;
end $

drop procedure sp_insertCategoria;