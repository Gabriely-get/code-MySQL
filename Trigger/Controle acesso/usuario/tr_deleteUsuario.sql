delimiter $
create trigger tr_deleteUsuario
	after delete on tb_usuario
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Excluiu um usuário',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = old.cd_usuario;
	end $
    
drop trigger tr_deleteUsuario;