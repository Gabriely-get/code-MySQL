delimiter $
create procedure sp_selectLocalidade(
in codigo int)
begin
	
	declare cod int;
    select cd_localidade from tb_localidade where codigo = cd_localidade into cod;

	if exists(select cd_localidade from tb_localidade where cd_localidade = codigo) then 
		select  l.ds_localidade as Descrição, n.ds_nivel_acesso as 'Nível de Acesso'
        from tb_localidade as l join tb_nivel_acesso as n on n.cd_nivel_acesso = l.cd_nivel_acesso
		where cd_localidade = codigo;
	else
		select concat('Localidade não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_selectLocalidade;