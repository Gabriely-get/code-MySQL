delimiter $
create trigger tr_deleteLocalidade
	after delete on tb_localidade
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Excluiu uma localidade',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = old.cd_localidade;
	end $
    
drop trigger tr_deleteLocalidade;