delimiter $
create procedure sp_deleteOcorrencia(
in codigo int)
begin
	
	declare cod int;
    select cd_ocorrencia from tb_ocorrencia where  cd_ocorrencia = codigo into cod;

	if exists(select cd_ocorrencia from tb_ocorrencia where cd_ocorrencia = codigo) then 
		delete from tb_ocorrencia
        where cd_ocorrencia = cod;
        
		select concat('Ocorrencia excluida com sucesso !') as Alert;
	else
		select concat('Ocorrencia não existente') as ATENÇÃO;
    end if;
end $

drop procedure sp_deleteOcorrencia;