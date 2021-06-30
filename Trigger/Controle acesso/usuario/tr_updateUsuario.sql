delimiter $
create trigger tr_updateUsuario
	after update on tb_usuario
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Atualizou um usuário',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = old.cd_usuario;
	end $
    
drop trigger tr_updateUsuario;