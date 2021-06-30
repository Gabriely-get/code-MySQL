delimiter $
create procedure sp_updateLocalidade(
in codigo char(2),
in nivel char(1),
in descricao varchar(45))
begin

	if exists(select cd_localidade from tb_localidade where cd_localidade = codigo) then 
		update tb_localidade
        set cd_nivel_acesso = nivel, ds_localidade = descricao
        where cd_localidade = codigo;
        
		select concat('Dados da localidade alterados com sucesso !') as Alert;
	else
		select concat('Localidade não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_updateLocalidade;