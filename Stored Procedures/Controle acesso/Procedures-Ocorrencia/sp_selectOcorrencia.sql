delimiter $
create procedure sp_selectOcorrencia(
in codigo int)
begin
	
	declare cod int;
    select cd_ocorrencia from tb_ocorrencia where codigo = cd_ocorrencia into cod;

	if exists(select cd_ocorrencia from tb_ocorrencia where cd_ocorrencia = codigo) then 
		select u.nm_usuario as Usuário, o.nm_ocorrencia as Ocorrência, c.dt_data as Data
        from tb_ocorrencia as o join tb_movimentacao as m on m.cd_ocorrencia = o.cd_ocorrencia
			join tb_usuario as u on u.cd_usuario = m.cd_usuario
				join tb_calendario as c on c.cd_data = m.cd_data
		where o.cd_ocorrencia = codigo;
	else
		select concat('Ocorrencia não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_selectOcorrencia;