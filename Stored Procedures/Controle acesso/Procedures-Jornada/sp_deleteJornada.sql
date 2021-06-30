delimiter $
create procedure sp_deleteJornada(
in codigo int)
begin
	
	declare cod int;
    select cd_jornada_trabalho from tb_jornada_trabalho where  cd_jornada_trabalho = codigo into cod;

	if exists(select cd_jornada_trabalho from tb_jornada_trabalho where cd_jornada_trabalho = codigo) then 
		delete from tb_jornada_trabalho
        where cd_jornada_trabalho = cod;
        
		select concat('Jornada de trabalho excluida com sucesso !') as Alert;
	else
		select concat('Jornada de trabalho não existente') as ATENÇÃO;
    end if;
end $

drop procedure sp_deleteJornada;