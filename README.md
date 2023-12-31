# View_sql

### Crie uma view que mostra todos os produtos e suas respectivas marcas

```sql
-- Este comando cria uma view chamada "Produtos_Marcas"
create view Produtos_Marcas as 
select
-- seleciona quais campos e de quais tabelas vou usar
	produtos.prd_nome as produto,  --  cria a coluna produto e atribui o prd_nome 
	marcas.mrc_nome as marca	--  cria a coluna marca e atribui mrc.marca
-- pega a tabela principal     
from produtos
-- Esta cláusula une as tabelas "produtos" e "marcas" usando a coluna "mrc_id" como chave estrangeira.
join marcas on marcas.mrc_id = produtos.prd_marca_id ;
```
![view1](produto_marca.png)

### Crie uma view que mostra todos os produtos e seus respectivos fornecedores
```sql
-- Cria uma view chamada `Produtos_Fornecedores`
CREATE VIEW Produtos_Fornecedores AS

-- Especifica quais colunas serão retornadas pela consulta
SELECT
	produtos.prd_nome AS produtos,
	fornecedores.frn_nome AS fornecedores

-- Especifica que a consulta começará na tabela `produtos`
FROM produtos

-- Une as tabelas `produtos` e `produto_fornecedor`
JOIN produto_fornecedor ON produto_fornecedor.pf_prod_id = produtos.prd_id

-- Une as tabelas `produto_fornecedor` e `fornecedores`
JOIN fornecedores ON produto_fornecedor.pf_forn_id = fornecedores.frn_id;
```
![view2](produto_fornecedores.png)
### Crie uma view que mostra todos os produtos e seus respectivos fornecedores e marcas;

```sql
-- Cria uma view chamada `Produtos_Fornecedores_marcas`
CREATE VIEW Produtos_Fornecedores_marcas AS

-- Especifica quais colunas serão retornadas pela consulta
SELECT
	produtos.prd_nome AS produtos,
	fornecedores.frn_nome AS fornecedores,
	marcas.mrc_nome AS marca

-- Especifica que a consulta começará na tabela `produtos`
FROM produtos

-- Une as tabelas `produtos` e `produto_fornecedor`
JOIN produto_fornecedor ON produto_fornecedor.pf_prod_id = produtos.prd_id

-- Une as tabelas `produto_fornecedor` e `fornecedores`
JOIN fornecedores ON produto_fornecedor.pf_forn_id = fornecedores.frn_id

-- Une as tabelas `produtos` e `marcas`
JOIN marcas ON marcas.mrc_id = produtos.prd_marca_id;

```
![view3](produto_fornecedores_marcas.png)

### Crie uma view que mostra todos os produtos com estoque abaixo do mínimo

```sql
-- Cria uma view chamada `Abaixo_media`
CREATE VIEW Abaixo_media AS

-- Seleciona todos os registros da tabela `produtos` onde a quantidade em estoque é menor que o estoque mínimo
SELECT *
FROM produtos
WHERE prd_qtd_estoque < prd_estoque_mim;

```
![view4](abaixo_estoque.png)

### Adicione o campo data de validade. Insira novos produtos com essa informação;

```sql
-- Altera a tabela `produtos` para adicionar uma coluna chamada `prd_data_validade` do tipo `date`
alter table produtos add prd_data_validade date;

-- Insere dois novos registros na tabela `produtos`
INSERT INTO produtos (prd_nome, prd_qtd_estoque, prd_estoque_mim,  prd_perecivel, prd_valor, prd_marca_id, prd_data_validade) 
VALUES ("Refrigerante cola sem açucar", 3, 4,  1, 9.00, 1, '2022-10-13'), ("Refrigerante de guarana", 10, 5,  1, 8.50,2, '2023-01-13');
```
![view5](adicionado.png)

### Crie uma view que mostra todos os produtos e suas respectivas marcas com validade vencida;

```sql
-- Cria uma view chamada `Produtos_Vencidos`
CREATE OR REPLACE VIEW Produtos_Vencidos AS

-- Seleciona o ID, o nome e a data de validade dos produtos vencidos
SELECT
    prd_id,
    prd_nome,
    prd_data_validade
FROM produtos
WHERE prd_data_validade < CURDATE();

```
![view6](vencidos.png)

### Selecionar os produtos com preço acima da média.

```sql
-- Seleciona todos os produtos com valor maior que a média de valor dos produtos
SELECT *
FROM produtos
WHERE prd_valor > (SELECT AVG(prd_valor) FROM produtos);
```

![view7](acima_media.png)

## Código sql
Código: ![codigo](produtos.sql)
