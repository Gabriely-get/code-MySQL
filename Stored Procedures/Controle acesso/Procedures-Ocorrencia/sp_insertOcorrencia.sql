delimiter $
create procedure sp_insertOcorrencia(
in nome varchar(45),
in descricao varchar(45))
begin
	if exists(select cd_ocorrencia from tb_ocorrencia where nm_ocorrencia = nome) then 
		select concat('Ocorrencia já existente') as ATENÇÃO;
	else
		insert into tb_ocorrencia
		select max(cd_ocorrencia) +1, nome, descricao from tb_ocorrencia;
    
		select concat('Ocorrencia Cadastrada com sucesso!') as Alert;
    end if;
end $

drop procedure sp_insertOcorrencia;