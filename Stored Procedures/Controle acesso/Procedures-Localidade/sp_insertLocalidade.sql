delimiter $
create procedure sp_insertLocalidade(
in nivel char(1),
in descricao varchar(45))
begin
	if exists(select cd_localidade from tb_localidade where ds_localidade = descricao) then 
		select concat('Localidade já existe!') as ATENÇÃO;
	else
    
		insert into tb_localidade
		select max(cd_localidade) +1, nivel, descricao from tb_localidade;
    
		select concat('Localidade Cadastrada') as Alert;
    end if;
    
end $


drop procedure sp_insertLocalidade;