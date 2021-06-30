delimiter $
create procedure spInsere_revendedor(
in nome varchar(45),
in comissao char(1),
in cpf char(11),
in salario decimal(9, 2)
)
begin
	if exists(select cd_revendedor from tb_revendedor where cd_cpf = cpf) then
		select concat('Funcionario: ', nome, ' não cadastrado pois o ', cpf, ' já existe!') as ATENÇÃO;
	else
		insert into tb_revendedor(cd_revendedor, nm_vendedor, sg_categoria, cd_cpf, vl_salario) select max(cd_revendedor) + 1,
        nome,
        (select sg_comissao from tb_comissao where sg_comissao = comissao),
        cpf,
        salario
        from tb_revendedor;
        select concat('Funcionário: ', nome, ' foi cadastrado !') as INFORMAÇÃO;
	end if;
end $
