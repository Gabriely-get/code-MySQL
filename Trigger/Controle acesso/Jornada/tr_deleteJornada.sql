delimiter $
create trigger tr_deleteJornada
	after delete on tb_jornada_trabalho
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Excluiu uma jornada de trabalho',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = old.cd_jornada_trabalho;
	end $
    
drop trigger tr_deleteJornada;