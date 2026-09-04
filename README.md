# dbVendas

Script DDL (T-SQL / SQL Server) para criação do banco de dados **dbVendas**, um modelo simples de vendas com clientes, produtos, pedidos e itens de pedido.

## Estrutura do banco

- **Cliente** — dados cadastrais dos clientes (nome, CPF único, e-mail, telefone).
- **Produto** — catálogo de produtos, com preço, estoque e status ativo/inativo.
- **Pedido** — pedidos realizados por um cliente, com status e valor total.
- **ItemPedido** — itens de cada pedido (produto, quantidade, valor unitário e total), com chave primária composta `(idPedido, idProduto)`.

### Relacionamentos

- `Pedido.idCliente` → `Cliente.idCliente`
- `ItemPedido.idPedido` → `Pedido.idPedido`
- `ItemPedido.idProduto` → `Produto.idProduto`

### Índices

Foram criados índices para otimizar buscas e joins mais comuns:

- `IX_Cliente_Nome`
- `IX_Produto_Descricao`
- `IX_Pedido_idCliente`
- `IX_Pedido_DataPedido`
- `IX_ITemPedido_idProduto`

### Regras de negócio (constraints)

- CPF do cliente é único (`UQ_Cliente_CPF`).
- Preço e estoque de produto não podem ser negativos/zerados indevidamente (`CK_Produto_Preco`, `CK_Produto_Estoque`).
- Valores de pedido e item de pedido devem ser maiores que zero.

## Como usar

Execute o script `DDL.sql` em uma instância do SQL Server (via SSMS, Azure Data Studio ou `sqlcmd`):

```bash
sqlcmd -S localhost -i DDL.sql
```

## Tecnologias

- SQL Server (T-SQL)

## Autor

Seu nome aqui
