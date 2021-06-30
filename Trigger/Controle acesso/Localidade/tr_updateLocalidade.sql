delimiter $
create trigger tr_updateLocalidade
	after update on tb_localidade
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Atualizou uma localidade',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = old.cd_localidade;
	end $
    
drop trigger tr_updateLocalidade;