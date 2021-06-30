delimiter $
create procedure sp_insertEmpresa(
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
	if exists(select cd_empresa from tb_empresa where cd_cnpj = cnpj) then 
		select concat('Empresa: ', nome, ' não cadastrado pois o CNPJ: ', cnpj, ' já existe!') as ATENÇÃO;
	else
		insert into tb_empresa
		select max(cd_empresa) +1, nome, cnpj, cep, endereco, bairro, cidade, uf, complemento, email from tb_empresa;
    
		select concat('Empresa cadastrada') as Alert;
    end if;
end $

drop procedure sp_insertEmpresa;