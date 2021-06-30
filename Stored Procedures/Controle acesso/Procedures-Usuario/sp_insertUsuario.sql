delimiter $
create procedure sp_insertUsuario(
in nome varchar(45),
in rg char(10),
in cpf char(11),
in telefone varchar(45),
in categoria int,
in empresa int,
in nivel int,
in jornada int)
begin
	if exists(select cd_usuario from tb_usuario where cd_cpf = cpf) then 
		select concat('Usuário: ', nome, ' não cadastrado pois o CPF: ', cpf, ' já existe!') as ATENÇÃO;
	else
		insert into tb_usuario
		select max(cd_usuario) +1, nome, rg, cpf, telefone, categoria, empresa, nivel, jornada from tb_usuario;
    
		select concat('Usuário cadastrado') as Alert;
    end if;
end $

drop procedure sp_insertUsuario;