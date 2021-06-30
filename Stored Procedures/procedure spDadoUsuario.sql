/*Esta procedure retorna as informações e as possibilidades de movimento do usuario de uma determinada 
categoria em sua respectiva empresa*/

delimiter $
	create procedure spDadoUsuario(in ds_usuario varchar(45))
		begin
        select nm_usuario as Nome_Usuario, nm_empresa as Nome_Empresa, ds_usuario as Categoria_usuario, 
			ds_nivel_acesso as Nivel_Acesso, ds_localidade as Localidade_Usuario
					from  tb_nivel_acesso as n
						join tb_usuario as u
							on n.cd_nivel_acesso = u.cd_nivel_acesso
								join tb_empresa as e
									on u.cd_empresa = e.cd_empresa
										join tb_localidade as l
											on n.cd_nivel_acesso = l.cd_nivel_acesso;
end $

call spdadousuario('cliente');