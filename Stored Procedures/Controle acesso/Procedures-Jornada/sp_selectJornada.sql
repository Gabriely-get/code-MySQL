delimiter $
create procedure sp_selectJornada(
in codigo int)
begin
	
	declare cod int;
    select cd_jornada_trabalho from tb_jornada_trabalho where codigo = cd_jornada_trabalho into cod;

	if exists(select cd_jornada_trabalho from tb_jornada_trabalho where cd_jornada_trabalho = codigo) then 
		select u.nm_usuario as Usuário, c.ds_usuario as 'Categoria', e.nm_empresa as Empresa, j.ds_jornada_trabalho
        from tb_jornada_trabalho as j join tb_usuario as u on j.cd_jornada_trabalho = u.cd_jornada_trabalho
			join tb_empresa as e on u.cd_empresa = e.cd_empresa
				join tb_categoria_usuario as c on u.cd_categoria_usuario = c.cd_categoria_usuario
		where j.cd_jornada_trabalho = codigo;
	else
		select concat('Jornada não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_selectJornada;