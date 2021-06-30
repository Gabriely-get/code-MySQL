delimiter $
create procedure sp_selectEmpresa(in cnpj char(14))
begin
	if exists(select cd_cnpj from tb_empresa where cd_cnpj = cnpj) then 
		select nm_empresa as Nome, cd_cnpj as CNPJ, cd_cep as CEP, nm_endereco as Endereço, nm_bairro as Bairro, nm_cidade as Cidade, nm_uf as Estado, nm_complemento as Complemento, nm_email as Email
        from tb_empresa
		where cd_cnpj = cnpj;
	else
		select concat('Empresa não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_selectEmpresa;