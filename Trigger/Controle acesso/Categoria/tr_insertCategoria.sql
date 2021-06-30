delimiter $
create trigger tr_insertCategoria
	after insert on tb_categoria_usuario
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Adicionou uma nova categoria',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = new.cd_categoria_usuario;
	end $
    
drop trigger tr_insertCategoria;