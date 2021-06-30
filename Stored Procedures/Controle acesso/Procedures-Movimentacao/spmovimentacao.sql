delimiter $
create procedure spMovimentacao(
in crud char(1),
in dtentrada date,
in new_dtentrada date,
in dtsaida date,
in new_dtsaida date,
in hrentrada time,
in new_hrentrada time,
in hrsaida time,
in new_hrsaida time,
in cdata int,
in new_cdata int,
in cocorrencia int,
in new_cocorrencia int,
in cusuario int,
in new_cusuario int
)
begin
declare codigo int;

case crud 

when 'c' then

if exists(select cd_movimentacao from tb_movimentacao where dt_entrada = dtentrada and dt_saida = dt_saida and hr_entrada = hrentrada and hr_saida = hrsaida and cd_data = cdata and cd_ocorrencia = cocorrencia and cd_usuario = cusuario ) then
	select concat('Não foi possivel criar o movimento pois a mesma ja existe!') as ATENÇÃO;
    
else
	insert into tb_movimentacao(cd_movimentacao,dt_entrada, dt_saida, hr_entrada, hr_saida, cd_data, cd_ocorrencia, cd_usuario) 
		select max(cd_movimentacao) + 1, dtentrada, dtsaida, hrentrada, hrsaida, cdata, cocorrencia, cusuario
			from tb_movimentacao;
            
		select concat('O movimento foi criado com sucesso!') as ATENÇÃO;   
end if;

when 'u' then
	
if exists(select cd_movimentacao from tb_movimentacao where dt_entrada = dtentrada and dt_saida = dt_saida and hr_entrada = hrentrada and hr_saida = hrsaida and cd_data = cdata and cd_ocorrencia = cocorrencia and cd_usuario = cusuario ) then
		select cd_movimentacao from tb_movimentacao where dt_entrada = dtentrada and dt_saida = dt_saida and hr_entrada = hrentrada and hr_saida = hrsaida and cd_data = cdata and cd_ocorrencia = cocorrencia and cd_usuario = cusuario into codigo;
        update tb_movimentacao
			set dt_entrada = new_dtentrada,
				dt_saida = new_dtsaida,
					hr_entrada = new_hrentrada,
						hr_saida = new_hrsaida,
							cd_data = new_cdata,
								cd_ocorrencia = new_cocorrencia,
									cd_usuario = new_cusuario
										where cd_movimentacao = codigo;
                                        
		select concat('O movimento foi alterado com sucesso!') as INFORMAÇÃO; 
else

select concat('Não foi possivel alterar o movimento!') as ATENÇÃO; 

end if;

when 'd' then

if exists(select cd_movimentacao from tb_movimentacao where dt_entrada = dtentrada and dt_saida = dt_saida and hr_entrada = hrentrada and hr_saida = hrsaida and cd_data = cdata and cd_ocorrencia = cocorrencia and cd_usuario = cusuario ) then
		select cd_movimentacao from tb_movimentacao where dt_entrada = dtentrada and dt_saida = dt_saida and hr_entrada = hrentrada and hr_saida = hrsaida and cd_data = cdata and cd_ocorrencia = cocorrencia and cd_usuario = cusuario into codigo;
        
        delete from tb_movimentacao
			where cd_movimentacao = codigo;
            
   select concat('O movimento foi deletado com sucesso!') as INFORMAÇÃO;         

else

	select concat('Não foi possivel deletar o movimento!') as ATENÇÃO;
    
end if;

end case;

end $

drop procedure spmovimentacao;