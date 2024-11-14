-- Inserindo clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('João Silva', 'joao@example.com', '123456789', 'Rua A, 123'),
('Maria Oliveira', 'maria@example.com', '987654321', 'Rua B, 456');

-- Inserindo veículos
INSERT INTO veiculos (id_cliente, marca, modelo, ano_fabricacao, placa) VALUES
(1, 'Ford', 'Fiesta', 2015, 'ABC1234'),
(2, 'Chevrolet', 'Onix', 2019, 'XYZ5678');

-- Inserindo serviços
INSERT INTO servicos (nome_servico, descricao, preco) VALUES
('Troca de Óleo', 'Troca de óleo do motor', 150.00),
('Revisão Completa', 'Revisão de todos os sistemas do carro', 500.00);

-- Inserindo ordens de serviço
INSERT INTO ordens_servico (id_cliente, id_veiculo, data_inicio, data_fim, status) VALUES
(1, 1, '2024-10-10', '2024-10-11', 'Fechada'),
(2, 2, '2024-10-12', '2024-10-13', 'Em andamento');

-- Relacionando serviços às ordens de serviço
INSERT INTO ordem_servico_servicos (id_ordem_servico, id_servico, quantidade, preco_unitario) VALUES
(1, 1, 1, 150.00),
(1, 2, 1, 500.00),
(2, 1, 1, 150.00);

-- Inserindo pagamentos
INSERT INTO pagamentos (id_ordem_servico, data_pagamento, valor_pago, metodo_pagamento) VALUES
(1, '2024-10-11', 650.00, 'Cartão'),
(2, '2024-10-13', 150.00, 'Dinheiro');
