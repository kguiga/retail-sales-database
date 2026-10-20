# 🏪 Retail Sales Database

## 📖 Descrição

Projeto de modelagem e implementação de banco de dados relacional desenvolvido utilizando MySQL Workbench.

O sistema representa uma operação varejista e foi projetado para controlar clientes, dependentes, lojas, pedidos, produtos, estoque, marcas e fornecedores.

O projeto contempla desde a modelagem conceitual até a implementação física do banco, incluindo criação de tabelas, carga de dados e consultas analíticas.

---

## 🎯 Objetivos

- Desenvolver um modelo de dados para uma operação varejista.
- Aplicar conceitos de modelagem relacional.
- Implementar um banco de dados utilizando SQL.
- Garantir integridade referencial através de chaves primárias e estrangeiras.
- Criar consultas para geração de informações de negócio.

---

## 🛠️ Tecnologias

- MySQL
- MySQL Workbench
- SQL

---

## 🧩 Conceitos Aplicados

### Modelagem de Dados

- Entidade-Relacionamento (ER)
- Modelo Relacional
- Cardinalidade
- Integridade Referencial

### Banco de Dados

- Chaves Primárias (PK)
- Chaves Estrangeiras (FK)
- Relacionamentos 1:N
- Relacionamentos N:N
- Tabelas Associativas

### Consultas SQL

- JOIN
- GROUP BY
- SUM
- COUNT
- CTE (WITH)
- Window Functions
- RANK()

---

## 📊 Modelo de Dados

### Entidades Principais

- Cliente
- Dependente
- Loja
- Pedido
- Item_Pedido
- Produto
- Estoque
- Marca
- Fornecedor
- Fornecedor_Marca

---

## 📂 Estrutura do Projeto

```text
retail-sales-database/

├── docs/
│   └── DER_Varejista.png
│
├── sql/
│   ├── esquema_relacional.sql
│   ├── inserts_tables.sql
│   └── consultas.sql
│
├── README.md
└── .gitignore
```

---

## 🗺️ Diagrama Entidade-Relacionamento

O DER completo encontra-se em:

```text
docs/DER_Varejista.png
```

---

## 📈 Consultas Desenvolvidas

### Quantidade de lojas por cidade

Utilização de agregação e agrupamento.

### Quantidade de pedidos por loja

Utilização de JOIN e funções de agregação.

### Produtos mais vendidos

Cálculo baseado nas quantidades registradas em pedidos.

### Produtos disponíveis por loja

Análise de estoque consolidada.

### Ranking de produtos mais vendidos por loja

Implementação utilizando CTEs e Window Functions (`RANK()`).

---

## 🚀 Como Utilizar

### 1. Criar o banco

Executar:

```sql
esquema_relacional.sql
```

### 2. Popular as tabelas

Executar:

```sql
inserts_tables.sql
```

### 3. Executar as consultas

Executar:

```sql
consultas.sql
```

---

## 📚 Aprendizados

Durante o desenvolvimento deste projeto foram praticados:

- Modelagem Relacional
- DER
- SQL
- Integridade Referencial
- Consultas Analíticas
- Normalização
- CTEs
- Window Functions
- MySQL Workbench

---

## 📌 Conclusão

O projeto permitiu aplicar na prática conceitos de modelagem e implementação de bancos de dados relacionais, desde a definição do modelo conceitual até a criação de consultas analíticas para apoio à tomada de decisão.

Além da implementação do banco, o desenvolvimento proporcionou experiência com modelagem de domínio, relacionamentos complexos e consultas SQL avançadas.
