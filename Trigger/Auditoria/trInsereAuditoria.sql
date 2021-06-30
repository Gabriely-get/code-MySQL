delimiter &
create trigger trInsereAuditoria_revendedor
	after insert on tb_revendedor
	for each row
    begin
		insert into tb_auditoria set -- set porque nao estou inserindo um valor novo, estou atribuindo um valor que JÁ está no banco
        codigo = new.cd_revendedor,
        usuario = user(), -- pega o usuario logado no server -> root@localhost -> <usuario>@<servidor>
        acao = 'Cadastrou',
        data_acao = curdate(),
        hora_acao = curtime();
	end &
    
