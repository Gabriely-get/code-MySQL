delimiter $
create trigger tr_insertUsuario
	after insert on tb_usuario
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Cadastrou um usuário',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = new.cd_usuario;
	end $
    
drop trigger tr_insertUsuario;