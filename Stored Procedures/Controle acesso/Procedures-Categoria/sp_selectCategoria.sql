delimiter $
create procedure sp_selectCategoria(
in codigo int)
begin
	
	declare cod int;
    select cd_categoria_usuario from tb_categoria_usuario where codigo = cd_categoria_usuario into cod;

	if exists(select cd_categoria_usuario from tb_categoria_usuario where cd_categoria_usuario = codigo) then 
		select u.nm_usuario as Usuário, c.ds_usuario as 'Categoria', e.nm_empresa as Empresa, j.hr_inicio_jornada_trabalho as 'Horário de Entrada', j.hr_fim_jornada_trabalho as 'Horário de Saída'
        from tb_categoria_usuario as c join tb_usuario as u on c.cd_categoria_usuario = u.cd_categoria_usuario
			join tb_empresa as e on u.cd_empresa = e.cd_empresa
				join tb_jornada_trabalho as j on u.cd_jornada_trabalho = j.cd_jornada_trabalho
		where c.cd_categoria_usuario = codigo;
	else
		select concat('Categoria não encontrada') as ATENÇÃO;
    end if;
end $

drop procedure sp_selectCategoria;