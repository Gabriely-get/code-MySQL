delimiter $
create procedure spBancoHora(
in crud char(1),
in cod char(3),
in new_cod char(3),
in data_trab date,
in new_data date,
in hora int,
in new_hora int
) 
begin  
declare codigo int;

case crud

when 'c' then
	if exists(select cd_movimentacao,dt_trabalhada, hr_trabalhada from tb_banco_hora where cd_movimentacao = cod and dt_trabalhada = data_trab and hr_trabalhada = hora) then
		select concat('Nao foi possivel criar pois os dados inserido ja existem!') as ATENÇÃO;
	
    else
		insert into tb_banco_hora(cd_banco_horas,cd_movimentacao,dt_trabalhada, hr_trabalhada)
        select max(cd_banco_horas) + 1, cod, data_trab, hora from tb_banco_hora;
        select concat('Os dados foram criados com sucesso!') as INFORMAÇÃO;
	end if;
    
when 'u' then
	if exists(select cd_movimentacao,dt_trabalhada, hr_trabalhada from tb_banco_hora where cd_movimentacao = cod and dt_trabalhada = data_trab and hr_trabalhada = hora) then
		select cd_banco_horas from tb_banco_hora where cd_movimentacao = cod and dt_trabalhada = data_trab and hr_trabalhada = hora into codigo;
		update tb_banco_hora
			set cd_movimentacao = new_cod,
				dt_trabalhada = new_data,
					hr_trabalhada = new_hora
						where cd_banco_horas = codigo;
				
       select concat('A alteração foi realizada com sucesso!') as INFORMAÇÃO;
	else
	select concat('Não foi possivel realizar a alteração!') as ATENÇÃO;
	
    end if;
    
when 'd' then	
	if exists(select cd_movimentacao,dt_trabalhada, hr_trabalhada from tb_banco_hora where cd_movimentacao = cod and dt_trabalhada = data_trab and hr_trabalhada = hora) then
		select cd_banco_horas from tb_banco_hora where cd_movimentacao = cod and dt_trabalhada = data_trab and hr_trabalhada = hora into codigo;
			delete from tb_banco_hora
				where cd_banco_horas = codigo;
		select concat('Os dados foram deletados com sucesso!') as INFORMAÇÃO;
	else
    select concat('Não foi possivel deletar!') as ATENÇÃO;
	
    end if;
    
    end case;
end $

drop procedure spbancohora;