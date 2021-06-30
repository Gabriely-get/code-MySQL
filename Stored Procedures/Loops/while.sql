delimiter $
 create procedure sp_fat2(in valor int)
 begin
	declare fator, i int;
    set fator = 1;
    set i = 1;
    calculo: while (i <= valor) do
		set fator = fator * i;
        set i = i + 1;
	end while calculo;
		select fator;
end $

call sp_fat2(10);