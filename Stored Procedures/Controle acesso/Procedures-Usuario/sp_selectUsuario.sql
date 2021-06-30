delimiter $
create procedure sp_selectUsuario(in cpf char(11))
begin
	if exists(select cd_cpf from tb_usuario where cd_cpf = cpf) then 
		select u.nm_usuario as Nome, c.ds_usuario as Categoria, e.nm_empresa as Empresa, j.ds_jornada_trabalho as 'Jornada de Trabalho'
			from tb_usuario as u join tb_empresa as e on u.cd_empresa = e.cd_empresa
						join tb_categoria_usuario as c on u.cd_categoria_usuario = c.cd_categoria_usuario
							join tb_jornada_trabalho as j on u.cd_jornada_trabalho = j.cd_jornada_trabalho							
		where u.cd_cpf = cpf;
	else
		select concat('Usuário não encontrado') as ATENÇÃO;
    end if;
end $

drop procedure sp_selectUsuario;