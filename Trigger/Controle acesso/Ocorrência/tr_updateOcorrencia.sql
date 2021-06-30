delimiter $
create trigger tr_updateOcorrencia
	after update on tb_ocorrencia
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Atualizou uma ocorrência',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = old.cd_ocorrencia;
	end $
    
drop trigger tr_updateOcorrencia;