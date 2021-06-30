create user 'syscopy2' identified by 'teste12345'; -- criar

grant select, insert, update, delete -- atribuir para algum user
	on db_cpr.* to 'syscopy'; -- usar nome da base, ou tabela
-- se quiser que tenha acesso a duas tabelas, fazer 'grant' duas vezes

-- revogar privilégios
revoke select, insert, update, delete on de_cpr2ifem.* from 'syscopy';

select * from mysql.user;

delete from mysql.user
	where user = 'syscopy'
		and host = '%';