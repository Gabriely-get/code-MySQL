delimiter $
create trigger tr_insertOcorrencia
	after insert on tb_ocorrencia
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Adicionou uma nova ocorrência',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = new.cd_ocorrencia;
	end $
    
drop trigger tr_insertOcorrencia;