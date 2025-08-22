DROP DATABASE IF EXISTS pizzaria;
CREATE DATABASE IF NOT EXISTS pizzaria;
USE pizzaria;

CREATE TABLE IF NOT EXISTS funcionario (
	cod_funcionario SMALLINT AUTO_INCREMENT PRIMARY KEY,
	nome_funcionario VARCHAR(25) NOT NULL,
	telefone_funcionario VARCHAR(15) NOT NULL,
	endereco_funcionario VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS atendente (
	cod_atendente SMALLINT AUTO_INCREMENT PRIMARY KEY,
	cod_funcionario SMALLINT NOT NULL,
		FOREIGN KEY (cod_funcionario) REFERENCES funcionario (cod_funcionario)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS entregador (
	cod_entregador SMALLINT AUTO_INCREMENT PRIMARY KEY,
	cod_funcionario SMALLINT NOT NULL,
		FOREIGN KEY (cod_funcionario)
        REFERENCES funcionario (cod_funcionario)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS cliente (
	cod_cliente SMALLINT AUTO_INCREMENT PRIMARY KEY,
	nome_cliente VARCHAR(25) NOT NULL,
	endereco VARCHAR(50) NOT NULL,
	telefone SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS pedido (
	num_pedido SMALLINT AUTO_INCREMENT PRIMARY KEY,
	data_de_emissao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	cod_cliente SMALLINT NOT NULL,
		FOREIGN KEY (cod_cliente) REFERENCES cliente (cod_cliente),
	cod_funcionario SMALLINT NOT NULL,
		FOREIGN KEY (cod_funcionario) REFERENCES funcionario (cod_funcionario),
	cod_entregador SMALLINT NOT NULL,
    		FOREIGN KEY (cod_entregador) REFERENCES entregador (cod_entregador)
);

CREATE TABLE IF NOT EXISTS ingredientes (
	cod_ingredientes SMALLINT AUTO_INCREMENT PRIMARY KEY,
	quant_ingredientes SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS pizza (
	cod_pizza SMALLINT AUTO_INCREMENT PRIMARY KEY,
	tamanho CHAR(1) NOT NULL,
	sabor VARCHAR(20) NOT NULL,
	preco DECIMAL (3,2) NOT NULL,
	cod_cliente SMALLINT NOT NULL,
		FOREIGN KEY (cod_cliente) 
        REFERENCES cliente (cod_cliente) 
        ON DELETE CASCADE ON UPDATE CASCADE,
	cod_funcionario SMALLINT NOT NULL,
		FOREIGN KEY (cod_funcionario) 
        REFERENCES funcionario (cod_funcionario) 
        ON DELETE CASCADE ON UPDATE CASCADE,
	num_pedido SMALLINT NOT NULL,
		FOREIGN KEY (num_pedido) 
        REFERENCES pedido (num_pedido) 
        ON DELETE CASCADE ON UPDATE CASCADE,
	cod_entregador SMALLINT NOT NULL,
		FOREIGN KEY (cod_entregador) 
        REFERENCES entregador (cod_entregador) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS pizza_ingredientes (
	cod_pizza SMALLINT NOT NULL,
		FOREIGN KEY (cod_pizza) 
        REFERENCES pizza (cod_pizza) 
        ON DELETE CASCADE ON UPDATE CASCADE,
	cod_ingredientes SMALLINT NOT NULL,
		FOREIGN KEY (cod_ingredientes) 
        REFERENCES ingredientes (cod_ingredientes) 
        ON DELETE CASCADE ON UPDATE CASCADE
);