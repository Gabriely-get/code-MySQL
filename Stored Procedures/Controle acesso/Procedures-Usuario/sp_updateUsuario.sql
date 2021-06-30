delimiter $
create procedure sp_updateUsuario(
in nome varchar(45),
in rg char(10),
in cpf char(11),
in telefone varchar(45),
in categoria int,
in empresa int,
in nivel int,
in jornada int)
begin
	
	declare cod int;
    select cd_usuario from tb_usuario where cpf = cd_cpf into cod;

	if exists(select cd_usuario from tb_usuario where cd_cpf = cpf) then 
		update tb_usuario
        set nm_usuario = nome, cd_rg = rg, cd_telefone = telefone, cd_categoria_usuario = categoria, cd_empresa = empresa, cd_nivel_acesso = nivel, cd_jornada_trabalho = jornada
        where cd_usuario = cod;
        
		select concat('Dados do usuário alterados com sucesso !') as Alert;
	else
		select concat('Usuário não encontrado') as ATENÇÃO;
    end if;
end $

drop procedure sp_updateUsuario;