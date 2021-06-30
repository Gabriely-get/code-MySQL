delimiter $
create procedure sp_deleteLocalidade(
in codigo int)
begin
	
	declare cod int;
    select cd_localidade from tb_localidade where  cd_localidade = codigo into cod;

	if exists(select cd_localidade from tb_localidade where cd_localidade = codigo) then 
		delete from tb_localidade
        where cd_localidade = cod;
        
		select concat('Localidade excluida com sucesso !') as Alert;
	else
		select concat('Localidade não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_deleteLocalidade;