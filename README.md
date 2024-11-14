# Desafio_DB

Este projeto consiste na criação e implementação de um banco de dados relacional para uma oficina, com o objetivo de gerenciar informações sobre clientes, veículos, serviços, ordens de serviço, pagamentos e funcionários. O banco de dados foi projetado com base em um modelo conceitual anterior utilizando o modelo Entidade-Relacionamento (ER), e a seguir, foi desenvolvido um modelo lógico no formato relacional.

Estrutura do Projeto
--------------------

O projeto é composto por:

-   **Esquema Lógico Relacional**: Tabelas e relacionamentos que representam os dados da oficina.
-   **Script SQL**: Código para criação do banco de dados, inserção de dados e consultas.
-   **Consultas SQL**: Consultas complexas que permitem recuperar e manipular os dados de maneira eficiente.

Modelo Conceitual
-----------------

### Entidades Principais:

1.  **Clientes**: Armazena as informações dos clientes que levam seus veículos para a oficina.
2.  **Veículos**: Representa os veículos dos clientes que são atendidos pela oficina.
3.  **Funcionários**: Representa os funcionários da oficina (ex.: mecânicos, administradores).
4.  **Serviços**: Representa os serviços prestados pela oficina (ex.: troca de óleo, revisão completa, etc.).
5.  **Ordens de Serviço**: Registra a execução de um ou mais serviços para um cliente e seu veículo.
6.  **Pagamentos**: Registra os pagamentos feitos pelos clientes para as ordens de serviço.

### Relacionamentos:

-   **Clientes** podem ter vários **Veículos**.
-   **Ordens de Serviço** são associadas a **Clientes** e **Veículos**.
-   Cada **Ordem de Serviço** pode ter múltiplos **Serviços** através da tabela de relacionamento `ordem_servico_servicos`.
-   **Pagamentos** são realizados para cada **Ordem de Serviço**.

Esquema Lógico Relacional
-------------------------

Aqui está o mapeamento do modelo conceitual para um modelo relacional:

### Tabelas:

#### `clientes`

-   `id_cliente` (PK)
-   `nome`
-   `email`
-   `telefone`
-   `endereco`

#### `veiculos`

-   `id_veiculo` (PK)
-   `id_cliente` (FK)
-   `marca`
-   `modelo`
-   `ano_fabricacao`
-   `placa`

#### `funcionarios`

-   `id_funcionario` (PK)
-   `nome`
-   `cargo`
-   `salario`
-   `telefone`

#### `servicos`

-   `id_servico` (PK)
-   `nome_servico`
-   `descricao`
-   `preco`

#### `ordens_servico`

-   `id_ordem_servico` (PK)
-   `id_cliente` (FK)
-   `id_veiculo` (FK)
-   `data_inicio`
-   `data_fim`
-   `status`

#### `ordem_servico_servicos`

-   `id_ordem_servico` (FK)
-   `id_servico` (FK)
-   `quantidade`
-   `preco_unitario`

#### `pagamentos`

-   `id_pagamento` (PK)
-   `id_ordem_servico` (FK)
-   `data_pagamento`
-   `valor_pago`
-   `metodo_pagamento`
