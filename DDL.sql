CREATE TABLE GrupoArmado (
  CodigoG INT NOT NULL,
  NomeGrupo VARCHAR(45) NULL,
  NumBaixasG INT NULL,
  PRIMARY KEY (CodigoG)
);

CREATE TABLE LiderPolitico (
  CodigoG INT NOT NULL,
  NomeL VARCHAR(45) NOT NULL,
  Apoios VARCHAR(45) NULL,
  PRIMARY KEY (CodigoG, NomeL),
  CONSTRAINT CodigoG
    FOREIGN KEY (CodigoG)
    REFERENCES GrupoArmado (CodigoG)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE OrganizacaoM (
  CodigoOrg INT NOT NULL,
  NomeOrg VARCHAR(45) NULL,
  TipoAjuda VARCHAR(45) NULL,
  Tipo VARCHAR(45) NULL,
  NumPessoas INT NULL,
  Depende INT NULL,
  PRIMARY KEY (CodigoOrg),
  CONSTRAINT Depende
    FOREIGN KEY (Depende)
    REFERENCES OrganizacaoM (CodigoOrg)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Dialoga (
  CodigoG INT NOT NULL,
  CodigoOrg INT NOT NULL,
  NomeL VARCHAR(45) NOT NULL,
  PRIMARY KEY (CodigoG, CodigoOrg, NomeL),
  CONSTRAINT CodigoOrg
    FOREIGN KEY (CodigoOrg)
    REFERENCES OrganizacaoM (CodigoOrg)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT NomeL
    FOREIGN KEY (CodigoG , NomeL)
    REFERENCES LiderPolitico (CodigoG , NomeL)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Conflito (
  Codigo INT NOT NULL,
  NumMortos INT NULL,
  NumFeridos INT NULL,
  Nome VARCHAR(45) NULL,
  PRIMARY KEY (Codigo)
);

CREATE TABLE Media (
  CodigoOrg INT NOT NULL,
  Codigo INT NOT NULL,
  PRIMARY KEY (CodigoOrg, Codigo),
  CONSTRAINT CodigoOrg
    FOREIGN KEY (CodigoOrg)
    REFERENCES OrganizacaoM (CodigoOrg)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Conflito
    FOREIGN KEY (Codigo)
    REFERENCES Conflito (Codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE DEMedia (
  CodigoOrg INT NOT NULL,
  Codigo INT NOT NULL,
  DataEntrada TIMESTAMP NOT NULL,
  PRIMARY KEY (CodigoOrg, DataEntrada, Codigo),
  FOREIGN KEY (CodigoOrg, Codigo) REFERENCES Media (CodigoOrg, Codigo)
);

CREATE TABLE Pais (
  Codigo INT NOT NULL,
  Pais VARCHAR(45) NOT NULL,
  PRIMARY KEY (Pais, Codigo),
  CONSTRAINT Conflito
    FOREIGN KEY (Codigo)
    REFERENCES Conflito (Codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE DSMedia (
  CodigoOrg INT NOT NULL,
  Codigo INT NOT NULL,
  DataSaida TIMESTAMP NOT NULL,
  PRIMARY KEY (CodigoOrg, DataSaida, Codigo),
  FOREIGN KEY (CodigoOrg, Codigo) REFERENCES Media (CodigoOrg, Codigo)
);

CREATE TABLE Racial (
  Codigo INT NOT NULL,
  Etnia VARCHAR NOT NULL,
  PRIMARY KEY (Codigo, Etnia),
  CONSTRAINT Codigo
    FOREIGN KEY (Codigo)
    REFERENCES Conflito (Codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE Economico (
  Codigo INT NOT NULL,
  MatPrima VARCHAR(45) NOT NULL,
  PRIMARY KEY (Codigo, MatPrima),
  CONSTRAINT Codigo
    FOREIGN KEY (Codigo)
    REFERENCES Conflito (Codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE Religioso (
  Codigo INT NOT NULL,
  Religiao VARCHAR(45) NOT NULL,
  PRIMARY KEY (Codigo, Religiao),
  CONSTRAINT Codigo
    FOREIGN KEY (Codigo)
    REFERENCES Conflito (Codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE Territorial (
  Codigo INT NOT NULL,
  Regiao VARCHAR(45) NOT NULL,
  PRIMARY KEY (Codigo, Regiao),
  CONSTRAINT Codigo
    FOREIGN KEY (Codigo)
    REFERENCES Conflito (Codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE DEGrupo (
  Codigo INT NOT NULL,
  CodigoG INT NOT NULL,
  DataEntrada TIMESTAMP NOT NULL,
  PRIMARY KEY (Codigo, CodigoG, DataEntrada),
  FOREIGN KEY (CodigoG) REFERENCES GrupoArmado (CodigoG),
  FOREIGN KEY (Codigo) REFERENCES Conflito (Codigo)
);


CREATE TABLE DSGrupo (
  Codigo INT NOT NULL,
  CodigoG INT NOT NULL,
  DataSaida TIMESTAMP NOT NULL,
  PRIMARY KEY (Codigo, CodigoG, DataSaida),
  FOREIGN KEY (CodigoG) REFERENCES GrupoArmado (CodigoG),
  FOREIGN KEY (Codigo) REFERENCES Conflito (Codigo)
);

CREATE TABLE Divisao (
  CodigoG INT NOT NULL,
  NroDivisao INT NOT NULL,
  NumBaixasD INT NULL,
  Barcos INT NULL,
  Avioes INT NULL,
  Tanques INT NULL,
  Homens INT NULL,
  PRIMARY KEY (CodigoG, NroDivisao),
  CONSTRAINT CodigoG
    FOREIGN KEY (CodigoG)
    REFERENCES GrupoArmado (CodigoG)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE ChefeMilitar (
  codigoChef INT NOT NULL,
  Faixa VARCHAR(45) NULL,
  NomeL VARCHAR(45) NOT NULL,
  CodigoG INT NULL,
  NroDivisao INT NULL,
  PRIMARY KEY (codigoChef),
  FOREIGN KEY (CodigoG, NomeL) REFERENCES LiderPolitico (CodigoG, NomeL),
  FOREIGN KEY (NroDivisao, CodigoG) REFERENCES Divisao (NroDivisao, CodigoG)
);

CREATE TABLE TipoArma (
  NomeArma VARCHAR(45) NOT NULL,
  Indicador INT NULL,
  PRIMARY KEY (NomeArma)
);


CREATE TABLE Traficante (
  NomeTraf VARCHAR(45) NOT NULL,
  PRIMARY KEY (NomeTraf)
);


CREATE TABLE Fornece (
  NomeArma VARCHAR(45) NOT NULL,
  NomeTraf VARCHAR(45) NOT NULL,
  CodigoG INT NOT NULL,
  NumArmas INT NULL,
  PRIMARY KEY (NomeArma, NomeTraf, CodigoG),
  CONSTRAINT NomeArma
    FOREIGN KEY (NomeArma)
    REFERENCES TipoArma (NomeArma)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT NomeTraf
    FOREIGN KEY (NomeTraf)
    REFERENCES Traficante (NomeTraf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT CodigoG
    FOREIGN KEY (CodigoG)
    REFERENCES GrupoArmado (CodigoG)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE PodeFornecer (
  NomeArma VARCHAR(45) NOT NULL,
  NomeTraf VARCHAR(45) NOT NULL,
  Quantidade INT NULL,
  PRIMARY KEY (NomeArma, NomeTraf),
  CONSTRAINT NomeArma
    FOREIGN KEY (NomeArma)
    REFERENCES TipoArma (NomeArma)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT NomeTraf
    FOREIGN KEY (NomeTraf)
    REFERENCES Traficante (NomeTraf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
