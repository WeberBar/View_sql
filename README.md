# View_sql
``` sql
-- Criação da Tabela virutla [Nome da tabela] 
create view Produtos_Marcas as 
-- seleciona quais campos eu quero de quais tabelas ex: produtos.prd_nome extrair nome da tabela produtos
select
	produtos.prd_nome as produto,  -- as cria a coluna dentro do view 
	marcas.mrc_nome as	 marca
-- pega a tabela principal     
from produtos
-- uni a tabela marcas e on são as chaves estrangeiras da tabela  MARCAS e = Tabela produtos. 
join marcas on marcas.mrc_id = produtos.prd_marca_id ;
´´´
