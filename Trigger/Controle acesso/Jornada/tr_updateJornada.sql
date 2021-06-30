delimiter $
create trigger tr_updateJornada
	after update on tb_jornada_trabalho
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Atualizou uma jornada de trabalho',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = old.cd_jornada_trabalho;
	end $
    
drop trigger tr_updateJornada;