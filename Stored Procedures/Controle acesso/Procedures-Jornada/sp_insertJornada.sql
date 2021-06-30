delimiter $
create procedure sp_insertJornada(
in descricao varchar(45),
in entrada time,
in saida time)
begin
	if exists(select cd_jornada_trabalho from tb_jornada_trabalho where ds_jornada_trabalho = descricao) then 
		select concat('Jornada de Trabalho já existente') as ATENÇÃO;
	else
		insert into tb_jornada_trabalho
		select max(cd_jornada_trabalho) +1, descricao, entrada, saida from tb_jornada_trabalho;
    
		select concat('Jornada de Trabalho Cadastrada com sucesso!') as Alert;
    end if;
end $

drop procedure sp_insertJornada;