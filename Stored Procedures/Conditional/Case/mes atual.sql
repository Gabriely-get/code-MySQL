delimiter $
create procedure spMes_atual()
begin
	declare mes int;
    set mes = month(curdate());
    
    case mes
		when 1 then select 'Janeiro';
        when 2 then select 'Fevereiro';
        when 3 then select 'Março';
        when 4 then select 'Abril';
        when 5 then select 'Maio';
        when 6 then select 'Junho';
        when 7 then select 'Julho';
        when 8 then select 'Agosto';
        when 9 then select 'Setembro';
        when 10 then select 'Outubro';
        when 11 then select 'Novembro';
        when 12 then select 'Dezembro';
	end case;
end $