delimiter $
create procedure spDia_semana()
begin
	declare sem int;
    set sem = dayofweek(curdate());
    
    case sem
		when 1 then select 'Domingo';
        when 2 then select 'Segunda-Feira';
        when 3 then select 'Terça-Feira';
        when 4 then select 'Quarta-Feira';
        when 5 then select 'Quinta-Feira';
        when 6 then select 'Sexta-Feira';
        when 7 then select 'Sábado';
	end case;
end $