delimiter $
create trigger tr_updateEmpresa
	after update on tb_empresa
    for each row
    begin
		insert into auditoria set
        usuario = user(),
        acao = 'Atualizou uma empresa',
        hora_acao = curtime(),
        data_acao = curdate(),
        codigo = old.cd_empresa;
	end $
    
drop trigger tr_updateEmpresa;