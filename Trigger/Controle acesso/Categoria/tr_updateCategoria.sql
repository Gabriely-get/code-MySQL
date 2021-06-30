delimiter $
create trigger tr_updateCategoria
	after update on tb_categoria_usuario
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Atualizou uma categoria',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = old.cd_categoria_usuario;
	end $
    
drop trigger tr_updateCategoria;