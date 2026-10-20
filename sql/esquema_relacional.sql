CREATE TABLE Cliente (
    id_cliente VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    celular VARCHAR(20),
    cpf VARCHAR(14) UNIQUE,
    endereco VARCHAR(200),
    pontos INT
);

CREATE TABLE Dependente (
    id_dependente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    parentesco VARCHAR(50) NOT NULL,
    id_cliente VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id_cliente)
);

CREATE TABLE Loja (
    id_loja VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo_loja VARCHAR(20) NOT NULL CHECK (tipo_loja IN ('FISICA','ONLINE')),
    endereco VARCHAR(200),
    cidade VARCHAR(100),
    horario_atendimento VARCHAR(50)
);

CREATE TABLE Marca (
    id_marca VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Produto (
    id_produto VARCHAR(20) PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    lote VARCHAR(50),
    nome VARCHAR(100) NOT NULL,
    tamanho VARCHAR(50),
	embalagem VARCHAR(50),
    id_marca VARCHAR(20),
    FOREIGN KEY (id_marca)
        REFERENCES Marca(id_marca)
);

CREATE TABLE Fornecedor (
    id_fornecedor VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200)
);

CREATE TABLE Fornecedor_Marca (
    id_fornecedor VARCHAR(20),
    id_marca VARCHAR(20),

    PRIMARY KEY (id_fornecedor,id_marca),

    FOREIGN KEY (id_fornecedor)
        REFERENCES Fornecedor(id_fornecedor),

    FOREIGN KEY (id_marca)
        REFERENCES Marca(id_marca)
);

CREATE TABLE Pedido (
    id_pedido VARCHAR(20) PRIMARY KEY,
    data DATE,
    tipo_pedido VARCHAR(20) NOT NULL CHECK (tipo_pedido IN ('FISICA','ONLINE')),
    valor_total DECIMAL(10,2),
    id_cliente VARCHAR(20),
    id_loja VARCHAR(20),

    FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id_cliente),

    FOREIGN KEY (id_loja)
        REFERENCES Loja(id_loja)
);

CREATE TABLE Estoque (
    id_loja VARCHAR(20),
    id_produto VARCHAR(20),
    quantidade INT CHECK (quantidade >= 0),
    preco_venda DECIMAL(10,2) CHECK (preco_venda > 0),

    PRIMARY KEY (id_loja,id_produto),

    FOREIGN KEY (id_loja)
        REFERENCES Loja(id_loja),

    FOREIGN KEY (id_produto)
        REFERENCES Produto(id_produto)
);

CREATE TABLE Item_Pedido (
    id_pedido VARCHAR(20),
    id_produto VARCHAR(20),
    quantidade INT CHECK (quantidade > 0),
    preco_unitario DECIMAL(10,2) CHECK (preco_unitario > 0),

    PRIMARY KEY (id_pedido,id_produto),

    FOREIGN KEY (id_pedido)
        REFERENCES Pedido(id_pedido),

    FOREIGN KEY (id_produto)
        REFERENCES Produto(id_produto)
);
