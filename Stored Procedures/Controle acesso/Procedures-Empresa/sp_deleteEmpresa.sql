delimiter $
create procedure sp_deleteEmpresa(
in cnpj char(14))
begin
	
	declare cod int;
    select cd_empresa from tb_empresa where cnpj = cd_cnpj into cod;

	if exists(select cd_cnpj from tb_empresa where cd_cnpj = cnpj) then 
		delete from tb_empresa 
        where cd_empresa = cod;
        
		select concat('Empresa excluida com sucesso !') as Alert;
	else
		select concat('Empresa não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_deleteEmpresa;