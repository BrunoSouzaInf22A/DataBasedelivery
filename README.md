# Sistema de Delivery - Banco de Dados

## Descrição
Este projeto é um sistema de banco de dados desenvolvido para um sistema de delivery. 
Ele foi projetado para gerenciar informações de usuários, clientes, pratos, carrinhos, 
pedidos e pagamentos, promovendo integração entre as entidades e mantendo a integridade 
dos dados.

## Estrutura do Modelo Físico de Dados
O Modelo Físico de Dados (MFD) foi baseado em um diagrama de classes e adaptado 
para um banco de dados relacional no MySQL. As tabelas incluem:

- **Usuario**: Dados de autenticação e identidade de usuários.
- **Cliente**: Dados específicos de clientes.
- **Entregador**: Informações sobre os entregadores.
- **Cozinheiro**: Detalhes dos profissionais que preparam os pedidos.
- **Prato**: Cardápio de itens disponíveis.
- **Carrinho**: Representa itens selecionados antes do pedido.
- **Carrinho_Prato**: Relaciona os pratos ao carrinho (muitos-para-muitos).
- **Pedidos**: Registros de pedidos realizados.
- **Pagamento**: Informações sobre os pagamentos.

## Como Executar

### 1. Criação do Banco de Dados
Para criar o banco de dados e suas tabelas, siga os passos:

1. Abra o MySQL Workbench ou outro cliente MySQL.
2. Execute o comando:
   ```sql
   CREATE DATABASE sistema_delivery;
   USE sistema_delivery;
   ```
3. Execute o script `estrutura.sql` contido neste repositório para criar todas as tabelas.

### 2. Inserção de Dados
Para popular as tabelas com dados de teste, execute as instruções de inserção que estão
 no script. Este script inclui usuários, clientes, pratos, carrinhos, pedidos e pagamentos.

### 3. Consultas de Teste
Para verificar se o banco de dados está funcionando corretamente, utilize consultas SQL como:

```sql
SELECT * FROM Usuario;
SELECT * FROM Pedidos;
SELECT * FROM Pagamento;
```

## Diagrama do Modelo Físico
O diagrama do modelo físico está incluído na pasta `MFD/` como uma imagem. 
Ele representa graficamente a estrutura do banco de dados, incluindo tabelas, colunas, 
chaves primárias, chaves estrangeiras e relações.

## Detalhes do Modelo Físico

### Restrições e Dependências
- As tabelas seguem o padrão de normalização para evitar redundância de dados.
- Chaves estrangeiras foram implementadas para manter a integridade referencial.
- Restrições como `NOT NULL`, `UNIQUE` e `DEFAULT` foram aplicadas quando necessário.


### Exemplo de Consultas Avançadas
1. Listar todos os pedidos realizados por um cliente:
   ```sql
   SELECT P.idPedido, P.valorTotal, P.status
   FROM Pedidos P
   INNER JOIN Cliente C ON P.idCliente = C.idCliente
   WHERE C.idCliente = 1;
   ```

2. Listar os pratos de um carrinho específico:
   ```sql
   SELECT PR.nomePrato, CP.quantidade
   FROM Carrinho_Prato CP
   INNER JOIN Prato PR ON CP.idPrato = PR.idPrato
   WHERE CP.idCarrinho = 1;
   ```

3. Total de vendas por entregador:
   ```sql
   SELECT E.idEntregador, SUM(P.valorTotal) AS totalVendas
   FROM Pedidos P
   INNER JOIN Entregador E ON P.idEntregador = E.idEntregador
   GROUP BY E.idEntregador;
   ```


