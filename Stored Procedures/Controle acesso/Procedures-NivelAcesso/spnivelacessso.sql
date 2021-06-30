delimiter $
create procedure spNivelAcesso(
in crud char(1),
in descricao varchar(45),
in novo varchar(45)
)
begin 
	declare codigo int;
    
	case crud
    when 'c' then
		if exists(select ds_nivel_acesso from tb_nivel_acesso where ds_nivel_acesso = descricao) then
			select concat('O nivel acesso ', descricao, ' ja esta cadastrado') as ATENCAO;
        else 
			insert into tb_nivel_acesso(cd_nivel_acesso, ds_nivel_acesso)
            select max(cd_nivel_acesso) + 1, descricao
            from tb_nivel_acesso;
		end if;
    
	when 'u' then
		select cd_nivel_acesso from tb_nivel_acesso where ds_nivel_acesso = descricao into codigo;
		if exists(select ds_nivel_acesso from tb_nivel_acesso where ds_nivel_acesso = descricao) then
        update tb_nivel_acesso
			set ds_nivel_acesso = novo
				where cd_nivel_acesso = codigo;
		else
			select concat('Nao foi possivel alterar a tabela pois a descricao inserida nao existe!') as ATENCAO;
		end if;
        
	when 'd' then
    select cd_nivel_acesso from tb_nivel_acesso where ds_nivel_acesso = descricao into codigo;
		delete from tb_nivel_acesso
			where cd_nivel_acesso = codigo;
	
    end case;

end $

drop procedure spNivelAcesso;