delimiter $
create procedure sp_updateEmpresa(
in nome varchar(45),
in cnpj char(14),
in cep char(8),
in endereco varchar(45),
in bairro varchar(45),
in cidade varchar(45),
in uf varchar(45),
in complemento varchar(45),
in email varchar(45))
begin
	
	declare cod int;
    select cd_empresa from tb_empresa where cnpj = cd_cnpj into cod;

	if exists(select cd_empresa from tb_empresa where cd_cnpj = cnpj) then 
		update tb_empresa 
        set nm_empresa = nome, cd_cnpj = cnpj, cd_cep = cep, nm_endereco = endereco, nm_bairro = bairro, nm_cidade = cidade, nm_uf = uf, nm_complemento = complemento, nm_email = email
        where cd_empresa = cod;
        
		select concat('Dados da empresa alterados com sucesso !') as Alert;
	else
		select concat('Empresa não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_updateEmpresa;