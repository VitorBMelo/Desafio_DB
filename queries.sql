-- 1. Recuperação simples de dados
SELECT nome, email FROM clientes;

-- 2. Filtro de serviços com preço superior a 200
SELECT nome_servico, preco FROM servicos WHERE preco > 200;

-- 3. Cálculo do total pago por ordem de serviço
SELECT os.id_ordem_servico, SUM(oss.quantidade * oss.preco_unitario) AS total_servicos
FROM ordens_servico os
JOIN ordem_servico_servicos oss ON os.id_ordem_servico = oss.id_ordem_servico
GROUP BY os.id_ordem_servico;

-- 4. Listagem de funcionários ordenados por salário
SELECT nome, salario FROM funcionarios ORDER BY salario DESC;

-- 5. Filtrando ordens de serviço com mais de um serviço
SELECT os.id_ordem_servico, COUNT(oss.id_servico) AS num_servicos
FROM ordens_servico os
JOIN ordem_servico_servicos oss ON os.id_ordem_servico = oss.id_ordem_servico
GROUP BY os.id_ordem_servico
HAVING num_servicos > 1;

-- 6. Consultas com junção de várias tabelas
SELECT c.nome AS cliente_nome, v.marca, v.modelo, p.valor_pago
FROM clientes c
JOIN veiculos v ON c.id_cliente = v.id_cliente
JOIN ordens_servico os ON c.id_cliente = os.id_cliente
JOIN pagamentos p ON os.id_ordem_servico = p.id_ordem_servico
WHERE os.status = 'Fechada';
