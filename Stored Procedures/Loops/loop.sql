 delimiter $
 create procedure sp_fat(in valor int)
 begin
	declare fator, i int;
    set fator = 1;
    set i = 1;
    calculo: loop
		set fator = fator * i;
        set i = i + 1;
        if (i > valor) then
			leave calculo;
            end if;
		end loop calculo;
        select fator;
end $

call sp_fat(7);