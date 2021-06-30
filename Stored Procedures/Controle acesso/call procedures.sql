
select * from tb_empresa;

-- Início Procedure Empresa --
call sp_insertEmpresa('RiHappy',08020262000120,02301050,'Rua Linete Reis, 175','Vila Paulicéia','São Paulo','São Paulo','Em frente à avenida principal','rihappy@gmail.com');
call sp_selectEmpresa(08020262000120);
call sp_updateEmpresa('Casas Bahia Corp.',08020262000120,14709190,'Rua Maria Beatriz Pimenta Neves, 386','Residencial Doutor Pedro Paschoal','Bebedouro','São Paulo','Perto da Mercadão','casasbahiacorp@gmail.com');
call sp_deleteEmpresa(08020262000120);
-- Fim Procedure Empresa --

select * from tb_usuario;
select * from tb_categoria_usuario;
select * from tb_empresa;
select * from tb_nivel_acesso;
select * from tb_jornada_trabalho;

-- Início Procedure Usuário --
call sp_insertUsuario('Marlene Sales',274932787,72254053140,68989300488,34,14,1,23);
call sp_selectUsuario(72254053140);
call sp_updateUsuario('Betina da Mota',208613961,72254053140,19992016834,31,14,2,25);
call sp_deleteUsuario(72254053140);
-- Fim Procedure Usuário --

select * from tb_localidade;
select * from tb_nivel_acesso;

-- Início Procedure Localidade --
call sp_insertLocalidade(1,'Corredores');
call sp_selectLocalidade(76);
call sp_updateLocalidade(76,2,'Corredores');
call sp_deleteLocalidade(76);
-- Fim Procedure Localidade --

select * from tb_categoria_usuario;

-- Início Procedure Categoria --
call sp_insertCategoria('Gerente');
call sp_selectCategoria(36);
call sp_updateCategoria(37,'Faxineiro');
call sp_deleteCategoria(37);
-- Fim Procedure Categoria --

select * from tb_jornada_trabalho;

-- Início Procedure Jornada --
call sp_insertJornada('Horário entre ETECs', '15:30:00','19:00:00');
call sp_selectJornada(25);
call sp_updateJornada(27,'Horário de dormir', '00:00:00','05:30:00');
call sp_deleteJornada(27);
-- Fim Procedure Jornada --

select * from tb_ocorrencia;

-- Início Procedure Ocorrencia --
call sp_insertOcorrencia('falta justificada','ausência justificado por meios legais');
call sp_selectOcorrencia(45);
call sp_updateOcorrencia(46,'ausência sem justificativa', 'ausência sem justificação legal');
call sp_deleteOcorrencia(46);
-- Fim Procedure Ocorrencia --


select * from tb_nivel_acesso;

call spNivelAcesso('d','AM = Área Oodificada','AM = Área Oodificada');

select * from tb_banco_hora;
select * from tb_movimentacao;

call spbancohora('c',82,81,'2019-09-23','2019-09-23',330,320);

select sg_data from tb_calendario;
select * from tb_calendario;

call spcalendario('r','FU','ANTIGO','NOVO','2019-1-11','2019-09-23');

select * from tb_movimentacao;

call spmovimentacao('c', '2019-09-22','2019-09-23','2019-09-23','2019-09-23','16:00:00','18:00:00','20:00:00','22:00:00',54, 51,43,41,105,105);

call spTipoData('r','FR','',null,null);

select * from tb_tipo_data;
select * from tb_calendario;
select * from tb_usuario;