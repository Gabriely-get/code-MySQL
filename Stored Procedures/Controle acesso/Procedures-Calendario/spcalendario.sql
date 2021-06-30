delimiter $
create procedure spCalendario(
in crud char(1),
in sigla char(2),
in descricao_dt varchar(45),
in new_desc varchar(45),
in dt date,
in new_dt date
)
begin
	declare codigo int;
    
case crud

when 'c' then

	if exists(select c.ds_data, c.dt_data, c.sg_data from tb_calendario as c join tb_tipo_data as t on c.sg_data=sigla and c.ds_data=descricao_dt 
    and c.dt_data=dt) then 
		select concat('Nao foi possivel criar a data pois a mesma inserida ja existe!') as ATENCAO;
    else    
		insert into tb_calendario(cd_data,sg_data, ds_data, dt_data) 
        select max(cd_data) + 1, sigla, descricao_dt, dt 
        from tb_calendario;
        
        select concat('A data foi criada com sucesso!') as ATENCAO;
    end if;
    
when 'r' then
	if exists(select dt_data from tb_calendario where dt_data=dt) then
		select u.nm_usuario as NOME, u.cd_cpf as CPF, e.nm_empresa as EMPRESA, 
        c.dt_data as 'DATA', o.nm_ocorrencia as OCORRENCIA, o.ds_ocorrencia as OCORRENCIA
	from tb_ocorrencia as o 
		join tb_movimentacao as m 
        on m.cd_ocorrencia = o.cd_ocorrencia
            join tb_calendario as c on m.cd_data = c.cd_data 
				join tb_usuario as u on m.cd_usuario = u.cd_usuario
					join tb_empresa as e
						on e.cd_empresa = u.cd_empresa
							where c.dt_data = dt;
       
       else
       select concat('Nao foi possivel criar a pesquisa pois a data nao existe!') as ATENCAO;
       
       end if;
       
when 'u' then

	if exists(select cd_data from tb_calendario where ds_data=descricao_dt and dt_data=dt and sg_data=sigla) then
		select cd_data from tb_calendario where sg_data=sigla and ds_data=descricao_dt and dt_data=dt into codigo;
			update tb_calendario
				set ds_data=new_desc,
					dt_data=new_dt
						where cd_data = codigo;
                    
	select concat('Os dados foram alterados com sucesso!') as ATENCAO;
    
    else
		select concat('Nao foi possivel alterar os dados pois, os dados inseridos nao existem ou os campos de alteração estao vazios!') as ATENCAO;
        
	end if;

when 'd' then
	if exists(select cd_data from tb_calendario where sg_data=sigla and ds_data=descricao_dt and dt_data=dt ) then
		select cd_data from tb_calendario where sg_data=sigla and ds_data=descricao_dt and dt_data=dt into codigo;	
			delete from tb_calendario
				where cd_data = codigo;
	select concat('Os dados foram excluidos com sucesso!') as ATENCAO;
    
	else 
		select concat('Nao foi possivel alterar os dados pois, os dados inserid nao existem!') as ATENCAO;
        
	end if;
	
end case;
    
end $

drop procedure spcalendario;
