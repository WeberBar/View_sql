create table marcas (
  mrc_id int primary key auto_increment,
  mrc_nome varchar(50) not null,
  mrc_nacionalidade varchar(50)
);

/*Explicação:

*Cria uma tabela chamada `marcas` com as seguintes colunas:
    * `mrc_id`: chave primária auto-incrementável;
    * `mrc_nome`: nome da marca;
    * `mrc_nacionalidade`: nacionalidade da marca.
*/
create table produtos (
  prd_id int primary key auto_increment,
  prd_nome varchar(50) not null,
  prd_qtd_estoque int not null default 0,
  prd_estoque_mim int not null default 0,
  prd_data_fabricacao timestamp default now(),
  prd_perecivel boolean,
  prd_valor decimal(10,2),

  prd_marca_id int,
  constraint fk_marcas foreign key(prd_marca_id) references marcas (mrc_id)
);

/* Explicação:

* Cria uma tabela chamada `produtos` com as seguintes colunas:
    * `prd_id`: chave primária auto-incrementável;
    * `prd_nome`: nome do produto;
    * `prd_qtd_estoque`: quantidade em estoque;
    * `prd_estoque_mim`: estoque mínimo;
    * `prd_data_fabricacao`: data de fabricação;
    * `prd_perecivel`: indica se o produto é perecível;
    * `prd_valor`: valor do produto;
    * `prd_marca_id`: chave estrangeira para a tabela `marcas`.
*/

create table fornecedores (
  frn_id int primary key auto_increment,
  frn_nome varchar(50) not null,
  frn_email varchar(50)
);

/* Explicação:

* Cria uma tabela chamada `fornecedores` com as seguintes colunas:
    * `frn_id`: chave primária auto-incrementável;
    * `frn_nome`: nome do fornecedor;
    * `frn_email`: e-mail do fornecedor.
*/

create table produto_fornecedor (
  pf_prod_id int references produtos (prd_id),
  pf_forn_id int references fornecedores (frn_id),
  primary key (pf_prod_id, pf_forn_id)

  
);

/*Explicação:**

* Cria uma tabela chamada `produto_fornecedor` com as seguintes colunas:
    * `pf_prod_id`: chave estrangeira para a tabela `produtos`;
    * `pf_forn_id`: chave estrangeira para a tabela `fornecedores`;
    * `primary key`: chave primária composta pelas colunas `pf_prod_id` e `pf_forn_id`.

**Inserção de dados:**
*/
insert into marcas(mrc_nome, mrc_nacionalidade)values('Coca Cola', 'Norte Americana');
insert into marcas(mrc_nome, mrc_nacionalidade)values('Fanta', 'Norte Americana'),('Pantera', 'Mexicana');
insert into marcas(mrc_nome, mrc_nacionalidade)values('Snickers', 'Norte Americana');
insert into marcas(mrc_nome, mrc_nacionalidade)values('Trident', 'Norte Americana');
insert into marcas(mrc_nome, mrc_nacionalidade)values('Dona benta', 'Brasileira');
insert into marcas(mrc_nome, mrc_nacionalidade)values('Tio João', 'Brasileira');
insert into marcas(mrc_nome, mrc_nacionalidade)values('H20', 'Norte americana');
/*
Explicação:

*Insere os seguintes dados na tabela `marcas`:
    * `Coca Cola` (Norte Americana);
    * `Fanta` (Norte Americana);
    * `Pantera` (Mexicana);
    * `Snickers` (Norte Americana);
    * `Trident` (Norte Americana);
    * `Dona benta` (Brasileira);
*/
insert into produtos(prd_nome,prd_qtd_estoque,prd_estoque_mim,prd_perecivel,prd_valor,prd_marca_id) values('Refrigerante Cola', 5, 10, 1, 8.00, 1);
insert into produtos(prd_nome,prd_qtd_estoque,prd_estoque_mim,prd_perecivel,prd_valor,prd_marca_id) values('Refrigerante de uva', 45, 16, 1, 5.00,2);
insert into produtos(prd_nome,prd_qtd_estoque,prd_estoque_mim,prd_perecivel,prd_valor,prd_marca_id) values('Feijão', 35, 20, 0, 9.00, 3);
insert into produtos(prd_nome,prd_qtd_estoque,prd_estoque_mim,prd_perecivel,prd_valor,prd_marca_id) values('Refrigerante de laranja', 2,10, 1, 5.00 ,2);
insert into produtos(prd_nome,prd_qtd_estoque,prd_estoque_mim,prd_perecivel,prd_valor,prd_marca_id) values('Barra de chocolate', 45, 20, 1, 10.00, 4);
insert into produtos(prd_nome,prd_qtd_estoque,prd_estoque_mim,prd_perecivel,prd_valor,prd_marca_id) values('Chiclete de menta', 50, 10, 1, 2.00, 5);
insert into produtos(prd_nome,prd_qtd_estoque,prd_estoque_mim,prd_perecivel,prd_valor,prd_marca_id) values('Macarrão integral', 12, 10,0 , 8.50, 6);
insert into produtos(prd_nome,prd_qtd_estoque,prd_estoque_mim,prd_perecivel,prd_valor,prd_marca_id) values('Arroz', 25, 10, 0, 9.50, 7);
insert into produtos(prd_nome,prd_qtd_estoque,prd_estoque_mim,prd_perecivel,prd_valor,prd_marca_id) values('Água gaseificada de limão', 20, 15, 1, 4.50, 8);
insert into produtos(prd_nome,prd_qtd_estoque,prd_estoque_mim,prd_perecivel,prd_valor,prd_marca_id) values('Macarrão Parafuso', 15, 10,0,8.50,6);

insert into fornecedores (frn_nome, frn_email) values('Coca-Cola FEMSA ', 'coca-cola@gmail.com');
insert into fornecedores (frn_nome, frn_email) values('Pantera Alimentos', 'pantera@pantera.com.br');
insert into fornecedores (frn_nome, frn_email) values('Mars Wrigley', ' mars-rigley@gmail.com');
insert into fornecedores (frn_nome, frn_email) values('Trdent ltd', 'trident@gmail.com');
insert into fornecedores (frn_nome, frn_email) values('Dona Benta', 'dona_benta@gmail.com');
insert into fornecedores (frn_nome, frn_email) values('Tio joao ltd', 'tio.joao@gmail.com');
insert into fornecedores (frn_nome, frn_email) values('Pepsico',  'pepsico@gmail.coom');

insert into produto_fornecedor (pf_prod_id,pf_forn_id) values(1,1),(2,1),(4,1),(3,2),(5,3),(6,4),(7,5),(8,6),(9,7),(10,5);

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

select * from Produtos_Marcas;
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

-- Executa a consulta que cria a view
select * from Produtos_Fornecedores;


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

-- Executa a consulta que cria a view
select * from Produtos_Fornecedores_marcas;

-- Cria uma view chamada `Abaixo_media`
CREATE VIEW Abaixo_media AS

-- Seleciona todos os registros da tabela `produtos` onde a quantidade em estoque é menor que o estoque mínimo
SELECT *
FROM produtos
WHERE prd_qtd_estoque < prd_estoque_mim;

-- Executa a consulta que cria a view
select * from Abaixo_media;

-- Altera a tabela `produtos` para adicionar uma coluna chamada `prd_data_validade` do tipo `date`
alter table produtos add prd_data_validade date;

-- Insere dois novos registros na tabela `produtos`
INSERT INTO produtos (prd_nome, prd_qtd_estoque, prd_estoque_mim,  prd_perecivel, prd_valor, prd_marca_id, prd_data_validade) 
VALUES ("Refrigerante cola sem açucar", 3, 4,  1, 9.00, 1, '2022-10-13'), ("Refrigerante de guarana", 10, 5,  1, 8.50,2, '2023-01-13');

-- produtos atualizados
select * from produtos;
-- Cria uma view chamada `Produtos_Vencidos`
CREATE OR REPLACE VIEW Produtos_Vencidos AS

-- Seleciona o ID, o nome e a data de validade dos produtos vencidos
SELECT
    prd_id,
    prd_nome,
    prd_data_validade
FROM produtos
WHERE prd_data_validade < CURDATE();

-- Executa a consulta que cria a view
select * from Produtos_Vencidos;

-- Seleciona todos os produtos com valor maior que a média de valor dos produtos
SELECT *
FROM produtos
WHERE prd_valor > (SELECT AVG(prd_valor) FROM produtos);