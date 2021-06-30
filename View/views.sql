create view vwCategoria as
	select u.nm_usuario as Nome, c.ds_usuario as Categoria
		from tb_usuario as u join tb_categoria_usuario as c
			on u.cd_categoria_usuario = c.cd_categoria_usuario;
            
            select * from vwcategoria;
            
create view vwEmpresa as
	select u.nm_usuario as Usuário, e.nm_empresa as Empresa
		from tb_usuario as u join tb_empresa as e
			on u.cd_empresa = e.cd_empresa;
            
            select * from vwempresa;
            
create view vwJornada as
	select j.ds_jornada_trabalho as jornada, u.nm_usuario as usuario
		from tb_usuario as u join tb_jornada_trabalho as j
        on u.cd_jornada_trabalho = j.cd_jornada_trabalho;
            
            select * from vwjornada;
            
            
                
create view vwnivel_Localidade as
	select u.nm_usuario as Nome, n.ds_nivel_acesso as Nivel, l.ds_localidade as Localidade
		from tb_usuario as u join tb_nivel_acesso as n
			on u.cd_nivel_acesso=n.cd_nivel_acesso
				join tb_localidade as l
			on n.cd_nivel_acesso=l.cd_nivel_acesso;

		select * from vwnivel_localidade;
        
create view vwjornada_categoria as
	select u.nm_usuario as Nome, c.ds_usuario as Categoria, j.ds_jornada_trabalho as Jornada
		from tb_usuario as u join tb_categoria_usuario as c
			on u.cd_categoria_usuario = c.cd_categoria_usuario
				join tb_jornada_trabalho as j
			on u.cd_jornada_trabalho = j.cd_jornada_trabalho;
            
            
            
            
create view vwjornada_empresa as
	select u.nm_usuario as Nome, e.nm_empresa as Empresa, j.ds_jornada_trabalho as Jornada
		from tb_usuario as u join tb_empresa as e
			on u.cd_empresa = e.cd_empresa
				join tb_jornada_trabalho as j
			on u.cd_jornada_trabalho = j.cd_jornada_trabalho;
            select * from vwjornada_empresa;
            
create view vwnivel_categoria as
	select u.nm_usuario as nome, c.ds_usuario as categoria, n.ds_nivel_acesso as nivel
		from tb_usuario as u join tb_categoria_usuario as c
			on u.cd_categoria_usuario = c.cd_categoria_usuario
				join tb_nivel_acesso as n
            on u.cd_nivel_acesso = n.cd_nivel_acesso;
            
            select * from vwnivel_categoria;
            
            
                    
create view vwusuario_localidade as 
	select u.nm_usuario, e.nm_empresa, n.ds_nivel_acesso, l.ds_localidade
		from tb_usuario as u join tb_empresa as e
			on u.cd_empresa = e.cd_empresa 
				join tb_nivel_acesso as n
			on u.cd_nivel_acesso = n.cd_nivel_acesso
				join tb_localidade as l 
			on n.cd_nivel_acesso = l.cd_nivel_acesso;
            select * from vwusuario_localidade;
            
create view vwTrabalho1 as
	select u.nm_usuario as Nome, c.ds_usuario as Categoria, j.ds_jornada_trabalho as Jornada, e.nm_empresa as Empresa
		from tb_usuario as u join tb_categoria_usuario as c
			on u.cd_categoria_usuario = c.cd_categoria_usuario
				join tb_jornada_trabalho as j
			on u.cd_jornada_trabalho = j.cd_jornada_trabalho
				join tb_empresa as e
			on u.cd_empresa = e.cd_empresa;
            select * from vwtrabalho1;
            
            
            
            
            
create view vwOcorrencia as
	select u.nm_usuario as Nome, m.dt_entrada as Data_Entrada, m.dt_saida as Data_Saida, o.nm_ocorrencia as Ocorrencia, t.ds_tipo_data as Tipo_Data, b.hr_trabalhada as Horas 
		from tb_movimentacao as m join tb_usuario as u
			on m.cd_usuario = u.cd_usuario
				join tb_banco_hora as b
			on m.cd_movimentacao = b.cd_movimentacao
				join tb_calendario as c
			on m.cd_data = c.cd_data
				join tb_tipo_data as t
			on c.sg_data = t.sg_data
				join tb_ocorrencia as o
			on m.cd_ocorrencia = o.cd_ocorrencia;
            select * from vwocorrencia;
            
create view vwUsuario_info as
	select u.nm_usuario as Usuário, c.ds_usuario as Categoria, j.ds_jornada_trabalho as Jornada_Trabalho, e.nm_empresa as Empresa, n.ds_nivel_acesso as Nível_Acesso, l.ds_localidade as Localidade
		from  tb_usuario as u join tb_categoria_usuario as c
			on u.cd_categoria_usuario = c.cd_categoria_usuario
				join tb_jornada_trabalho as j
			on u.cd_jornada_trabalho = j.cd_jornada_trabalho
				join tb_empresa as e
			on u.cd_empresa = e.cd_empresa
				join tb_nivel_acesso as n
			on u.cd_nivel_acesso = n.cd_nivel_acesso
				join tb_localidade as l
			on n.cd_nivel_acesso = l.cd_nivel_acesso;
            select * from vwusuario_info;
            
create view vwMovimento as
	select u.nm_usuario as nome, e.nm_empresa as empresa, n.ds_nivel_acesso as nivel, c.ds_usuario as categoria, m.dt_entrada as data_entrada, m.dt_saida as data_saida, cal.ds_data as desc_data, d.ds_tipo_data as tipo_data
		from tb_usuario as u join tb_empresa as e
			on u.cd_empresa = e.cd_empresa
				join tb_nivel_acesso as n
			on u.cd_nivel_acesso = n.cd_nivel_acesso
				join tb_categoria_usuario as c
			on u.cd_categoria_usuario = c.cd_categoria_usuario
				join tb_movimentacao as m
			on m.cd_usuario = u.cd_usuario
				join tb_calendario as cal
			on m.cd_data = cal.cd_data
				join tb_tipo_data as d
			on cal.sg_data = d.sg_data;
                                select * from vwmovimento;