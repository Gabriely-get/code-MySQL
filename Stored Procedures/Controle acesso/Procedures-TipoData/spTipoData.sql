delimiter $
create procedure spTipoData(
in crud char(1),
in sigla char (2),
in new_sigla char(2),
in descricao varchar (45),
in new_desc varchar(45)
)
begin
	declare codigo char(2);

	case crud

	when 'c' then

	if exists(select sg_data, ds_tipo_data from tb_tipo_data where sg_data = sigla or ds_tipo_data = descricao) then
		select concat('Nao é possivel criar este tipo pois ele ja existe!') as ATENCAO;
		
	else
		insert into tb_tipo_data(sg_data, ds_tipo_data)	values (sigla, descricao);
        
        select concat('O tipo de data foi criado com sucesso!') as ATENCAO;
	end if;
    
    when 'r' then
    
    if exists(select sg_data from tb_tipo_data where sg_data = sigla) then
		select t.sg_data, t.ds_tipo_data, c.dt_data, c.ds_data 
			from tb_tipo_data as t 
				join tb_calendario as c
					on t.sg_data = c.sg_data
						and c.sg_data = sigla;

	else
		select concat('O dado inserido nao existe!') as ATENCAO;
	end if;
    
	when 'u' then
    
	if exists(select sg_data, ds_tipo_data from tb_tipo_data where sg_data = sigla and ds_tipo_data = descricao) then
	select sg_data from tb_tipo_data where sg_data = sigla and ds_tipo_data = descricao into codigo;
        update tb_tipo_data
			set	sg_data = new_sigla,
					ds_tipo_data = new_desc
						where sg_data = codigo;
                    
		select concat('As alterações foram realizadas com sucesso!') as ATENCAO;
        
	else
		select concat('Nao é possivel realizar alterações pois esses dados nao existem!') as ATENCAO;
	end if;
    
    when 'd' then
	
	if exists(select sg_data, ds_tipo_data from tb_tipo_data where sg_data = sigla and ds_tipo_data = descricao) then
		delete from tb_tipo_data
			where sg_data = sigla
				and ds_tipo_data = descricao;
                
		select concat('A exclusão dos dados foi realizada com sucesso!') as ATENCAO;
	else 
		select concat('Nao é possivel deletar as informacoes pois esses dados nao existem!') as ATENCAO;
	end if;
    
end case;

end $

drop procedure sptipodata;