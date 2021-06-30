delimiter $
create procedure sp_updateOcorrencia(
in codigo int,
in nome varchar(45),
in descricao varchar(45))
begin
	
	declare cod int;
    select cd_ocorrencia from tb_ocorrencia where codigo = cd_ocorrencia into cod;

	if exists(select cd_ocorrencia from tb_ocorrencia where cd_ocorrencia = codigo) then 
		update tb_ocorrencia
        set nm_ocorrencia = nome, ds_ocorrencia = descricao
        where cd_ocorrencia = cod;
        
		select concat('Dados da Ocorrencia alterados com sucesso !') as Alert;
	else
		select concat('Ocorrencia não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_updateOcorrencia;