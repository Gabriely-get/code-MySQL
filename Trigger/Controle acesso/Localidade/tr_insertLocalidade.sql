delimiter $
create trigger tr_insertLocalidade
	after insert on tb_localidade
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Adicionou uma nova localidade',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = new.cd_localidade;
	end $
    
drop trigger tr_insertLocalidade;