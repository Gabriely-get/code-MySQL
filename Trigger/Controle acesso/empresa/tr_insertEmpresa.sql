delimiter $
create trigger tr_insertEmpresa
	after insert on tb_empresa
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Cadastrou uma empresa',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = new.cd_empresa;
	end $
    
drop trigger tr_insertEmpresa;