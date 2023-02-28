create database DBImovel;

use DBImovel;


DROP TABLE IF EXISTS Vendedor;

CREATE TABLE Vendedor (
    cd_Vendedor int NOT NULL,
    nm_Vendedor varchar(40) DEFAULT NULL,
    ds_Endereco varchar(40) DEFAULT NULL,
    cd_CPFVendedor decimal(11) DEFAULT NULL,
    nm_Cidade varchar(20) DEFAULT NULL,
    nm_Bairro varchar(20)DEFAULT NULL,
    sg_Estado char(2) DEFAULT NULL,
    cd_Telefone varchar(20) DEFAULT NULL,
    ds_Email varchar(80) DEFAULT NULL
);

DROP TABLE IF EXISTS Imovel;

CREATE TABLE Imovel (
    cd_Imovel int NOT NULL,
    cd_Vendedor int DEFAULT NULL,
    cd_Cidade int DEFAULT NULL,
    sg_Estado char(2) DEFAULT NULL,
    ds_Endereco varchar(40) DEFAULT NULL,
    qt_AreaUtil decimal(10,2) DEFAULT NULL,
    qt_AreaTotal decimal(10,2) DEFAULT NULL,
    ds_Imovel varchar(300) DEFAULT NULL,
    vl_preco money DEFAULT NULL,
    qt_Ofertas int  DEFAULT NULL,
    ic_Vendido char(1) DEFAULT NULL,
    dt_Lancto date DEFAULT NULL,
    qt_ImovelIndicado int NOT NULL
);

DROP TABLE IF EXISTS Comprador;

CREATE TABLE Comprador (
    cd_Comprador int NOT NULL,
    nm_Comprador varchar(40) DEFAULT NULL,
    ds_Endereco varchar(40) DEFAULT NULL,
    cd_CPFComprador decimal(11) DEFAULT NULL,
    nm_Cidade varchar(20) DEFAULT NULL,
    nm_Bairro varchar(20) DEFAULT NULL,
    sg_Estado varchar(2) DEFAULT NULL,
    cd_Telefone varchar(20) DEFAULT NULL,
    ds_Email varchar(80) DEFAULT NULL,
);

DROP TABLE IF EXISTS Oferta;

CREATE TABLE Oferta (
    cd_Comprador INT NOT NULL,
    cd_Imovel Int NOT NULL,
    vl_Oferta money DEFAULT NULL,
    dt_Oferta date DEFAULT NULL
);

DROP TABLE IF EXISTS Estado;

CREATE TABLE Estado (
    sg_Estado CHAR(2) DEFAULT NULL,
    nm_Estado VARCHAR(20) DEFAULT NULL
);

DROP TABLE IF EXISTS Cidade;

CREATE TABLE Cidade (
    cd_Cidade int NOT NULL,
    sg_Estado CHAR(2) DEFAULT NULL,
    nm_Cidade VARCHAR(20) DEFAULT NULL
);

DROP TABLE IF EXISTS Bairro;

CREATE TABLE Bairro (
    cd_Bairro INT NOT NULL,
    cd_Cidade INT NOT NULL,
    sg_Estado CHAR(2) DEFAULT NULL,
    nm_Bairro VARCHAR(20) DEFAULT NULL
);

DROP TABLE IF EXISTS Faixa_Imovel;

CREATE TABLE Faixa_Imovel (
    cd_Faixa INT NOT NULL,
    nm_Faixa VARCHAR(30) DEFAULT NULL,
    vl_Maximo money DEFAULT NULL,
    vl_Minimo money DEFAULT NULL
);

ALTER TABLE Vendedor ADD PRIMARY KEY (cd_Vendedor);
ALTER TABLE Comprador ADD PRIMARY KEY (cd_Comprador);
ALTER TABLE Imovel ADD PRIMARY KEY (cd_Imovel);
ALTER TABLE Estado ADD PRIMARY KEY (sg_Estado);
ALTER TABLE Cidade ADD PRIMARY KEY (cd_Cidade);
ALTER TABLE Bairro ADD PRIMARY KEY (cd_Bairro);
ALTER TABLE Faixa_Imovel ADD PRIMARY KEY (cd_Faixa);



ALTER TABLE Imovel ADD FOREIGN KEY (cd_Vendedor) REFERENCES Vendedor (cd_Vendedor);
ALTER TABLE Imovel ADD FOREIGN KEY (cd_Bairro) REFERENCES Bairro (cd_Bairro);
ALTER TABLE Imovel ADD FOREIGN KEY (cd_Bairro) REFERENCES Cidade (cd_Bairro);
ALTER TABLE Imovel ADD FOREIGN KEY (cd_Bairro) REFERENCES Estado (cd_Bairro);

