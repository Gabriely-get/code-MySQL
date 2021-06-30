delimiter $
create procedure sp_deleteUsuario(
in cpf char(11))
begin
	
	declare cod int;
    select cd_usuario from tb_usuario where cpf = cd_cpf into cod;

	if exists(select cd_cpf from tb_usuario where cd_cpf = cpf) then 
		delete from tb_usuario 
        where cd_usuario = cod;
        
		select concat('Usuário excluido com sucesso !') as Alert;
	else
		select concat('Usuário não encontrado') as ATENÇÃO;
    end if;
end $

drop procedure sp_deleteUsuario;