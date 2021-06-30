delimiter $
create trigger tr_insertJornada
	after insert on tb_jornada_trabalho
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Adicionou uma nova jornada de trabalho',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = new.cd_jornada_trabalho;
	end $
    
drop trigger tr_insertJornada;