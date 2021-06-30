 delimiter $
 create procedure sp_fat1(in valor int)
 begin
	declare fator, i int;
    set fator = 1;
    set i = 1;
    calculo: repeat
		set fator = fator * i;
        set i = i + 1;
        until (i > valor) end repeat calculo;
        select fator;
end $

call sp_fat1(5);