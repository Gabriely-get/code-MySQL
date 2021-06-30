delimiter &
create trigger trAlteraAuditoria_revendedor
	before update on tb_revendedor
    for each row
    begin
		insert into tb_auditoria_salario set
        usuario = user(),
        codigo = new.cd_revendedor,
        acao = 'Salario Alterado!',
		data_acao = curdate(),
        hora_acao = curtime(),
        salario_antigo = old.vl_salario,
        salario_novo = new.vl_salario;
	end &
    
drop trigger trAlteraAuditoria_revendedor2;