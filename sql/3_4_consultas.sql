---------------------------------------------------------------------------
-- Retorne o número de lojas por cidade
---------------------------------------------------------------------------
SELECT cidade, COUNT(*) AS numero_lojas
FROM Loja
GROUP BY cidade;


---------------------------------------------------------------------------
-- Qual é o número de pedidos em cada loja? 
---------------------------------------------------------------------------
SELECT l.nome, COUNT(p.id_pedido) AS total_pedidos
FROM Loja l LEFT JOIN Pedido p
    ON l.id_loja = p.id_loja
GROUP BY l.id_loja, l.nome
ORDER BY total_pedidos DESC;


---------------------------------------------------------------------------
-- Quais são os produtos mais vendidos em todas as lojas? 
---------------------------------------------------------------------------
SELECT p.nome, SUM(i.quantidade) AS total_vendido
FROM Produto p INNER JOIN Item_Pedido i
    ON p.id_produto = i.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY total_vendido DESC;


---------------------------------------------------------------------------
-- Quais são as lojas que mais oferecem produtos à venda? 
---------------------------------------------------------------------------
SELECT l.nome, COUNT(e.id_produto) AS quantidade_produtos
FROM Loja l INNER JOIN Estoque e
    ON l.id_loja = e.id_loja
GROUP BY l.id_loja, l.nome
ORDER BY quantidade_produtos DESC;


---------------------------------------------------------------------------
-- Quais são as lojas que estão tendo mais pedidos? 
---------------------------------------------------------------------------
SELECT l.nome, COUNT(*) AS total_pedidos
FROM Loja l JOIN Pedido p
    ON l.id_loja = p.id_loja
GROUP BY l.id_loja, l.nome
ORDER BY total_pedidos DESC;


---------------------------------------------------------------------------
-- Quais são os produtos mais vendidos em cada loja? 
---------------------------------------------------------------------------
WITH vendas_por_loja AS (
    SELECT l.nome AS loja, pr.nome AS produto, SUM(ip.quantidade) AS total_vendido,
        RANK() OVER (
            PARTITION BY l.id_loja
            ORDER BY SUM(ip.quantidade) DESC
        ) AS posicao
    FROM Loja l
    JOIN Pedido pe
        ON l.id_loja = pe.id_loja
    JOIN Item_Pedido ip
        ON pe.id_pedido = ip.id_pedido
    JOIN Produto pr
        ON ip.id_produto = pr.id_produto
    GROUP BY l.id_loja, l.nome, pr.id_produto, pr.nome
)
SELECT loja, produto, total_vendido FROM vendas_por_loja
WHERE posicao = 1
ORDER BY loja;