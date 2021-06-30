/*Esta procedure retorna as informações dos uncionarios de acordo com a empresa*/

delimiter $
	create procedure spFuncionario(in nm_empresa varchar(45))
		begin
        select nm_usuario as Nome_Usuario, nm_empresa as Nome_Empresa, ds_usuario as Categoria_usuario, 
			ds_jornada_trabalho as Jornada_Trabalho
					from tb_usuario as u
						join tb_empresa as e
							on u.cd_empresa = e.cd_empresa
								join tb_categoria_usuario as c
									on u.cd_categoria_usuario = c.cd_categoria_usuario
										join tb_jornada_trabalho as j
											on j.cd_jornada_trabalho = u.cd_jornada_trabalho
												where ds_usuario = 'funcionario';
end $

call spfuncionario('extra');


