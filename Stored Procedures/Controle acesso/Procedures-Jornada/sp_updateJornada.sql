delimiter $
create procedure sp_updateJornada(
in codigo int,
in descricao varchar(45),
in entrada time,
in saida time)
begin
	
	declare cod int;
    select cd_jornada_trabalho from tb_jornada_trabalho where codigo = cd_jornada_trabalho into cod;

	if exists(select cd_jornada_trabalho from tb_jornada_trabalho where cd_jornada_trabalho = codigo) then 
		update tb_jornada_trabalho
        set ds_jornada_trabalho = descricao, hr_inicio_jornada_trabalho = entrada, hr_fim_jornada_trabalho = saida
        where cd_jornada_trabalho = cod;
        
		select concat('Dados da jornada de trabalho alterados com sucesso !') as Alert;
	else
		select concat('Jornada de trabalho não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_updateJornada;