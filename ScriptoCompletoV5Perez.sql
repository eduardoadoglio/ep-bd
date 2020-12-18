CREATE TABLE GrupoArmado (
  CodigoG SERIAL NOT NULL,
  NomeGrupo VARCHAR(120) NULL,
  NumBaixasG INT NULL,
  PRIMARY KEY (CodigoG)
);

CREATE TABLE LiderPolitico (
  CodigoG SERIAL NOT NULL,
  NomeL VARCHAR(120) NOT NULL,
  Apoios VARCHAR(120) NULL,
  PRIMARY KEY (CodigoG, NomeL),
  CONSTRAINT CodigoG
    FOREIGN KEY (CodigoG)
    REFERENCES GrupoArmado (CodigoG)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE OrganizacaoM (
  CodigoOrg SERIAL NOT NULL,
  NomeOrg VARCHAR(120) NULL,
  TipoAjuda VARCHAR(120) NULL,
  Tipo VARCHAR(120) NULL,
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
  NomeL VARCHAR(120) NOT NULL,
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
  Codigo SERIAL NOT NULL,
  NumMortos INT NULL,
  NumFeridos INT NULL,
  Nome VARCHAR(120) NULL,
  PRIMARY KEY (Codigo)
);


CREATE TABLE DEMedia (
  CodigoOrg INT NOT NULL,
  Codigo INT NOT NULL,
  DataEntrada TIMESTAMP NOT NULL,
  PRIMARY KEY (CodigoOrg, DataEntrada, Codigo),
  CONSTRAINT OrganizacaoM
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

CREATE TABLE Pais (
  Codigo SERIAL NOT NULL,
  Pais VARCHAR(120) NOT NULL,
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
  CONSTRAINT OrganizacaoM
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

CREATE TABLE Racial (
  Codigo SERIAL NOT NULL,
  Etnia VARCHAR NOT NULL,
  PRIMARY KEY (Codigo, Etnia),
  CONSTRAINT Codigo
    FOREIGN KEY (Codigo)
    REFERENCES Conflito (Codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE Economico (
  Codigo SERIAL NOT NULL,
  MatPrima VARCHAR(120) NOT NULL,
  PRIMARY KEY (Codigo, MatPrima),
  CONSTRAINT Codigo
    FOREIGN KEY (Codigo)
    REFERENCES Conflito (Codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE Religioso (
  Codigo SERIAL NOT NULL,
  Religiao VARCHAR(120) NOT NULL,
  PRIMARY KEY (Codigo, Religiao),
  CONSTRAINT Codigo
    FOREIGN KEY (Codigo)
    REFERENCES Conflito (Codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE Territorial (
  Codigo INT NOT NULL,
  Regiao VARCHAR(120) NOT NULL,
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
  codigoChef SERIAL NOT NULL,
  Faixa VARCHAR(120) NULL,
  NomeL VARCHAR(120) NOT NULL,
  CodigoG INT NULL,
  NroDivisao INT NULL,
  PRIMARY KEY (codigoChef),
  FOREIGN KEY (CodigoG, NomeL) REFERENCES LiderPolitico (CodigoG, NomeL), --(Item B) -> Qualquer chefe militar obedece no mínimo a um líder político.
  FOREIGN KEY (NroDivisao, CodigoG) REFERENCES Divisao (NroDivisao, CodigoG)
);

CREATE TABLE TipoArma (
  NomeArma VARCHAR(120) NOT NULL,
  Indicador INT NULL,
  PRIMARY KEY (NomeArma)
);


CREATE TABLE Fornece (
  NomeArma VARCHAR(120) NOT NULL,
  NomeTraf VARCHAR(120) NOT NULL,
  CodigoG INT NOT NULL,
  NumArmas INT NULL,
  PRIMARY KEY (NomeArma, NomeTraf, CodigoG),
  CONSTRAINT NomeArma
    FOREIGN KEY (NomeArma)
    REFERENCES TipoArma (NomeArma)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT CodigoG
    FOREIGN KEY (CodigoG)
    REFERENCES GrupoArmado (CodigoG)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE PodeFornecer (
  NomeArma VARCHAR(120) NOT NULL,
  NomeTraf VARCHAR(120) NOT NULL,
  Quantidade INT NULL,
  PRIMARY KEY (NomeArma, NomeTraf),
  CONSTRAINT NomeArma
    FOREIGN KEY (NomeArma)
    REFERENCES TipoArma (NomeArma)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE FUNCTION InserirHierarquiaGat() RETURNS trigger AS $InserirHierarquiaGat$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM Racial WHERE Racial.Codigo = NEW.Codigo) + (SELECT COUNT(*)FROM Economico WHERE Economico.Codigo = NEW.Codigo) + (SELECT COUNT(*)FROM Religioso WHERE Religioso.Codigo = NEW.Codigo) + (SELECT COUNT(*)FROM Territorial WHERE Territorial.Codigo = NEW.Codigo)) > 0 THEN
            RAISE EXCEPTION 'Este conflito já possiu um tipo associado!';
        END IF; --(Item A) -> Exclusividade da hierarquia de conflitos.

        RETURN NEW;
    END;
$InserirHierarquiaGat$ LANGUAGE plpgsql;

CREATE FUNCTION DelOrUpdChefMilitar() RETURNS trigger AS $DelOrUpdChefMilitar$
    BEGIN

        IF (SELECT (SELECT COUNT(*) FROM ChefeMilitar WHERE ChefeMilitar.NroDivisao = OLD.NroDivisao AND ChefeMilitar.CodigoG = OLD.CodigoG)) = 1 THEN
            RAISE EXCEPTION 'Pelo menos 1 chefe militar deve dirigir uma divisão!';
        END IF; --(Item C) -> Uma divisão é dirigida pelo menos por um chefe militar.

      IF (TG_OP = 'UPDATE') THEN
        IF (SELECT (SELECT COUNT(*) FROM ChefeMilitar WHERE ChefeMilitar.NroDivisao = NEW.NroDivisao AND ChefeMilitar.CodigoG = NEW.CodigoG)) >= 3 THEN
            RAISE EXCEPTION 'Já possiu 3 Chefes Militares dirigindo a nova divisão!';
            END IF;  --(Item D) -> Uma divisão é dirigida por três chefes militares como máximo.

          RETURN NEW;
      END IF;

      IF (TG_OP = 'DELETE') THEN
          RETURN OLD;
      END IF;

      RETURN NULL;

    END;
$DelOrUpdChefMilitar$ LANGUAGE plpgsql;

CREATE FUNCTION InserirChefMilitar() RETURNS trigger AS $InserirChefMilitar$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM ChefeMilitar WHERE ChefeMilitar.NroDivisao = NEW.NroDivisao AND ChefeMilitar.CodigoG = NEW.CodigoG)) >= 3 THEN
            RAISE EXCEPTION 'Já possiu 3 Chefes Militares dirigindo a divisão!';
        END IF; --(Item D) -> Uma divisão é dirigida por três chefes militares como máximo.

        RETURN NEW;
    END;
$InserirChefMilitar$ LANGUAGE plpgsql;

CREATE FUNCTION DelOrUpdDivisao() RETURNS trigger AS $DelOrUpdDivisao$
    BEGIN

      IF (SELECT (SELECT COUNT(*) FROM Divisao WHERE Divisao.CodigoG = OLD.CodigoG)) = 1 THEN
          RAISE EXCEPTION 'Todo grupo armado precisa dispor de no mínimo uma divisão!';
      END IF; --(Item E) -> Todo grupo armado dispõe de no mínimo uma divisão.

      IF (TG_OP = 'UPDATE') THEN
        UPDATE GrupoArmado SET NumBaixasG = NumBaixasG + NEW.NumBaixasD - OLD.NumBaixasD WHERE GrupoArmado.CodigoG = OLD.CodigoG;
        RETURN NEW; --(Item H) -> Manter a consistência das baixas totais em cada grupo armado, a partir das baixas produzidas nas suas divisões
      END IF;

      IF (TG_OP = 'DELETE') THEN
        UPDATE GrupoArmado SET NumBaixasG = NumBaixasG - OLD.NumBaixasD WHERE GrupoArmado.CodigoG = OLD.CodigoG;
        RETURN OLD; --(Item H) -> Manter a consistência das baixas totais em cada grupo armado, a partir das baixas produzidas nas suas divisões
      END IF;

      RETURN NULL;

    END;
$DelOrUpdDivisao$ LANGUAGE plpgsql;

CREATE FUNCTION IncludeDSGrupo() RETURNS trigger AS $IncludeDSGrupo$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM DEGrupo WHERE DEGrupo.Codigo = NEW.Codigo AND DEGrupo.CodigoG = NEW.CodigoG) - (SELECT COUNT(*) FROM DSGrupo WHERE DSGrupo.Codigo = NEW.Codigo AND DSGrupo.CodigoG = NEW.CodigoG)) != 1 THEN
            RAISE EXCEPTION 'Não pode-se terminar um conflito que não começou!'; --Extra!
        END IF;  

        IF (SELECT (SELECT COUNT(*) FROM DEGrupo WHERE DEGrupo.Codigo = NEW.Codigo) - (SELECT COUNT(*) FROM DSGrupo WHERE DSGrupo.Codigo = NEW.Codigo)) <= 2 THEN
            RAISE EXCEPTION 'Em um conflito armado participam como mínimo dois grupos armados!';
        END IF; --(Item F) -> Em um conflito armado participam como mínimo dois grupos armados.

        RETURN NEW;
    END;
$IncludeDSGrupo$ LANGUAGE plpgsql;

CREATE FUNCTION DelOrUpdPais() RETURNS trigger AS $DelOrUpdPais$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM Pais WHERE Pais.Codigo = OLD.Codigo)) = 1 THEN
            RAISE EXCEPTION 'Um conflito afeta pelo menos um país!'; --(Item G) -> Qualquer conflito afeta pelo menos um país.
        END IF;

      IF (TG_OP = 'UPDATE') THEN
          RETURN NEW;
      END IF;

      IF (TG_OP = 'DELETE') THEN
          RETURN OLD;
      END IF;
      
      RETURN NULL;
    END;
$DelOrUpdPais$ LANGUAGE plpgsql;

CREATE FUNCTION IncludeDEGrupo() RETURNS trigger AS $IncludeDEGrupo$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM DEGrupo WHERE DEGrupo.Codigo = NEW.Codigo AND DEGrupo.CodigoG = NEW.CodigoG) - (SELECT COUNT(*) FROM DSGrupo WHERE DSGrupo.Codigo = NEW.Codigo AND DSGrupo.CodigoG = NEW.CodigoG)) > 0 THEN
            RAISE EXCEPTION 'Não pode-se duplicar a participação no conflito!'; --Extra!
        END IF;

        RETURN NEW;
    END;
$IncludeDEGrupo$ LANGUAGE plpgsql;


CREATE FUNCTION InsertDivisao() RETURNS trigger AS $InsertDivisao$
    BEGIN
      UPDATE GrupoArmado SET NumBaixasG = NumBaixasG + NEW.NumBaixasD WHERE GrupoArmado.CodigoG = NEW.CodigoG; --(Item H) -> Manter a consistência das baixas totais em cada grupo armado, a partir das baixas produzidas nas suas divisões
      NEW.NroDivisao = (SELECT coalesce(MAX(Divisao.NroDivisao), 0) FROM Divisao WHERE Divisao.CodigoG = NEW.CodigoG) + 1; --(Item H) -> Gerar e assegurar a sequencialidade do número de divisão dentro do grupo armado.
      RETURN NEW;
    END;
$InsertDivisao$ LANGUAGE plpgsql;

CREATE TRIGGER DelOrUpdPais BEFORE DELETE OR UPDATE ON Pais
  FOR EACH ROW EXECUTE PROCEDURE DelOrUpdPais();

CREATE TRIGGER IncludeDSGrupo BEFORE INSERT ON DSGrupo
    FOR EACH ROW EXECUTE PROCEDURE IncludeDSGrupo();

CREATE TRIGGER IncludeDEGrupo BEFORE INSERT ON DEGrupo
    FOR EACH ROW EXECUTE PROCEDURE IncludeDEGrupo();

CREATE TRIGGER InserirChefMilitar BEFORE INSERT ON ChefeMilitar
    FOR EACH ROW EXECUTE PROCEDURE InserirChefMilitar();

CREATE TRIGGER DelOrUpdChefMilitar BEFORE DELETE OR UPDATE ON ChefeMilitar
  FOR EACH ROW EXECUTE PROCEDURE DelOrUpdChefMilitar();

CREATE TRIGGER InserirHierarquiaRac BEFORE INSERT ON Racial
    FOR EACH ROW EXECUTE PROCEDURE InserirHierarquiaGat();

CREATE TRIGGER InserirHierarquiaEco BEFORE INSERT ON Economico
    FOR EACH ROW EXECUTE PROCEDURE InserirHierarquiaGat();
  
CREATE TRIGGER InserirHierarquiaReg BEFORE INSERT ON Religioso
    FOR EACH ROW EXECUTE PROCEDURE InserirHierarquiaGat();
  
CREATE TRIGGER InserirHierarquiaTer BEFORE INSERT ON Territorial
    FOR EACH ROW EXECUTE PROCEDURE InserirHierarquiaGat();

CREATE TRIGGER DelOrUpdDivisao BEFORE DELETE OR UPDATE ON Divisao
  FOR EACH ROW EXECUTE PROCEDURE DelOrUpdDivisao();

CREATE TRIGGER InsertDivisao BEFORE INSERT ON Divisao
  FOR EACH ROW EXECUTE PROCEDURE InsertDivisao();


INSERT INTO GrupoArmado (NomeGrupo) VALUES ('EACH');
INSERT INTO GrupoArmado (NomeGrupo) VALUES ('IME');
INSERT INTO GrupoArmado (NomeGrupo) VALUES ('ICMC');
INSERT INTO GrupoArmado (NomeGrupo) VALUES ('UNICAMP');

INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (1, 'Nabio Fakano', '');
INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (1, 'Larla Kima', '');
INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (1, 'Auil Fernando', '');
INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (2, 'Duciano Ligiampietri', '');
INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (2, 'Massachusetts Hase', '');
INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (2, 'Vitor Nishida', '');
INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (3, 'Lucas Adoglio', '');
INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (3, 'Posé Jérez', '');

INSERT INTO Divisao (CodigoG, NumBaixasD, Barcos, Avioes, Tanques, Homens) VALUES (1, 12, 13, 3, 2, 154);
INSERT INTO Divisao (CodigoG, NumBaixasD, Barcos, Avioes, Tanques, Homens) VALUES (1, 5, 15, 4, 2, 80);
INSERT INTO Divisao (CodigoG, NumBaixasD, Barcos, Avioes, Tanques, Homens) VALUES (2, 80, 18, 6, 2, 365);
INSERT INTO Divisao (CodigoG, NumBaixasD, Barcos, Avioes, Tanques, Homens) VALUES (3, 73, 42, 5, 41, 372);
INSERT INTO Divisao (CodigoG, NumBaixasD, Barcos, Avioes, Tanques, Homens) VALUES (4, 101, 18, 17, 25, 420);

INSERT INTO ChefeMilitar (Faixa, NomeL, CodigoG, NroDivisao) VALUES ('Tenente', 'Nabio Fakano', 1, 1);
INSERT INTO ChefeMilitar (Faixa, NomeL, CodigoG, NroDivisao) VALUES ('Cabo', 'Nabio Fakano', 1, 2);
INSERT INTO ChefeMilitar (Faixa, NomeL, CodigoG, NroDivisao) VALUES ('Soldado', 'Duciano Ligiampietri', 2, 1);
INSERT INTO ChefeMilitar (Faixa, NomeL, CodigoG, NroDivisao) VALUES ('Tenente', 'Lucas Adoglio', 3, 1);
INSERT INTO ChefeMilitar (Faixa, NomeL, CodigoG, NroDivisao) VALUES ('Cabo', 'Lucas Adoglio', 3, 1);
INSERT INTO ChefeMilitar (Faixa, NomeL, CodigoG, NroDivisao) VALUES ('Tenente', 'Posé Jérez', 3, 1);

INSERT INTO Conflito (NumMortos, NumFeridos, Nome) VALUES (10, 20, 'REC de Cálculo I');
INSERT INTO Conflito (NumMortos, NumFeridos, Nome) VALUES (28, 37, 'REC de Matemática Discreta');
INSERT INTO Conflito (NumMortos, NumFeridos, Nome) VALUES (22, 25, 'REC de Cálculo II');
INSERT INTO Conflito (NumMortos, NumFeridos, Nome) VALUES (73, 20, 'REC de Cálculo III');
INSERT INTO Conflito (NumMortos, NumFeridos, Nome) VALUES (63, 37, 'REC de IP');
INSERT INTO Conflito (NumMortos, NumFeridos, Nome) VALUES (52, 25, 'REC de Cálculo IV');
INSERT INTO Conflito (NumMortos, NumFeridos, Nome) VALUES (73, 20, 'REC de BD');
INSERT INTO Conflito (NumMortos, NumFeridos, Nome) VALUES (63, 37, 'REC de MVGA');
INSERT INTO Conflito (NumMortos, NumFeridos, Nome) VALUES (52, 25, 'REC de AC');

INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (1, 1, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (1, 2, NOW());

INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (2, 2, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (2, 3, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (2, 1, NOW());

INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (3, 2, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (3, 3, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (3, 1, NOW());

INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (4, 2, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (4, 3, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (4, 1, NOW());

-- INSERT INTO DSGrupo (Codigo, CodigoG, DataEntrada) VALUES (1, 1, NOW());
-- INSERT INTO DSGrupo (Codigo, CodigoG, DataEntrada) VALUES (2, 2, NOW());

-- INSERT INTO DSGrupo (Codigo, CodigoG, DataEntrada) VALUES (4, 2, NOW());
-- INSERT INTO DSGrupo (Codigo, CodigoG, DataEntrada) VALUES (4, 3, NOW());

INSERT INTO Pais (Codigo, Pais) VALUES (1, 'São Carlos');
INSERT INTO Pais (Codigo, Pais) VALUES (1, 'São Paulo');

INSERT INTO Pais (Codigo, Pais) VALUES (2, 'São Paulo');
INSERT INTO Pais (Codigo, Pais) VALUES (2, 'São Carlos');

INSERT INTO Pais (Codigo, Pais) VALUES (3, 'São Paulo');
INSERT INTO Pais (Codigo, Pais) VALUES (3, 'Pirassununga');

INSERT INTO Pais (Codigo, Pais) VALUES (4, 'Campinas');
INSERT INTO Pais (Codigo, Pais) VALUES (4, 'Ribeirão Preto');


INSERT INTO Pais (Codigo, Pais) VALUES (5, 'São Paulo');
INSERT INTO Pais (Codigo, Pais) VALUES (5, 'Lorena');

INSERT INTO Pais (Codigo, Pais) VALUES (6, 'Campinas');
INSERT INTO Pais (Codigo, Pais) VALUES (6, 'São Jose dos Campos');

INSERT INTO Pais (Codigo, Pais) VALUES (7, 'Campinas');
INSERT INTO Pais (Codigo, Pais) VALUES (7, 'São Jose dos Campos');

INSERT INTO Pais (Codigo, Pais) VALUES (8, 'São Jose dos Campos');
INSERT INTO Pais (Codigo, Pais) VALUES (8, 'São Paulo');

INSERT INTO OrganizacaoM (NomeOrg, TipoAjuda, Tipo, NumPessoas, Depende) VALUES ('ONU', 'Humanitaria', 'Humanitaria', 645, 1);
INSERT INTO OrganizacaoM (NomeOrg, TipoAjuda, Tipo, NumPessoas, Depende) VALUES ('EACHESUNIDAS', 'Humanitaria', 'Humanitaria', 2, 2);
INSERT INTO OrganizacaoM (NomeOrg, TipoAjuda, Tipo, NumPessoas, Depende) VALUES ('IMEANOS', 'Humanitaria', 'Humanitaria', 2, 3);
INSERT INTO OrganizacaoM (NomeOrg, TipoAjuda, Tipo, NumPessoas, Depende) VALUES ('ICMSSAURO', 'Humanitaria', 'Humanitaria', 2, 4);
INSERT INTO OrganizacaoM (NomeOrg, TipoAjuda, Tipo, NumPessoas, Depende) VALUES ('POLITRECOS', 'Humanitaria', 'Humanitaria', 2, 5);
INSERT INTO OrganizacaoM (NomeOrg, TipoAjuda, Tipo, NumPessoas, Depende) VALUES ('ECA', 'Humanitaria', 'Humanitaria', 2, 6);

INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (1, 1, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (1, 2, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (1, 3, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (2, 2, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (2, 3, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (3, 1, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (4, 2, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (5, 3, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (6, 2, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (3, 2, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (4, 3, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (5, 2, NOW());
INSERT INTO DEMedia (CodigoOrg, Codigo, DataEntrada) VALUES (6, 1, NOW());

INSERT INTO DSMedia (CodigoOrg, Codigo, DataSaida) VALUES (2, 2, NOW());
INSERT INTO DSMedia (CodigoOrg, Codigo, DataSaida) VALUES (1, 3, NOW());
INSERT INTO DSMedia (CodigoOrg, Codigo, DataSaida) VALUES (3, 1, NOW());
INSERT INTO DSMedia (CodigoOrg, Codigo, DataSaida) VALUES (4, 2, NOW());
INSERT INTO DSMedia (CodigoOrg, Codigo, DataSaida) VALUES (5, 3, NOW());
INSERT INTO DSMedia (CodigoOrg, Codigo, DataSaida) VALUES (6, 2, NOW());

INSERT INTO TipoArma (NomeArma, Indicador) VALUES ('AK-47', 1);
INSERT INTO TipoArma (NomeArma, Indicador) VALUES ('Python', 2);
INSERT INTO TipoArma (NomeArma, Indicador) VALUES ('Sniper XPTO', 2);
INSERT INTO TipoArma (NomeArma, Indicador) VALUES ('M200 intervention', 2);
INSERT INTO TipoArma (NomeArma, Indicador) VALUES ('Barret M82', 3);
INSERT INTO TipoArma (NomeArma, Indicador) VALUES ('Faquinha', 3);

INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (1, 'AK-47', 'Eduardo', 252);
INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (2, 'AK-47', 'Eduardo', 135);
INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (4, 'Python', 'Nishida', 573);
INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (1, 'M200 intervention', 'Vitor', 785);
INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (3, 'Faquinha', 'Haka', 5);
INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (3, 'Barret M82', 'Haka', 5);
INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (3, 'M200 intervention', 'Monica', 62);
INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (2, 'M200 intervention', 'Cebolinha', 57);
INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (2, 'M200 intervention', 'Cascao', 23);
INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (1, 'Barret M82', 'Haka', 53);
INSERT INTO Fornece (CodigoG, NomeArma, NomeTraf, NumArmas) VALUES (4, 'Barret M82', 'Haka', 5);

INSERT INTO Religioso (Codigo, Religiao) VALUES (1, 'Budista');
INSERT INTO Religioso (Codigo, Religiao) VALUES (2, 'Cristiã');
INSERT INTO Religioso (Codigo, Religiao) VALUES (3, 'Hinduismo');
INSERT INTO Religioso (Codigo, Religiao) VALUES (4, 'Islamica');
INSERT INTO Religioso (Codigo, Religiao) VALUES (5, 'Judaica');
INSERT INTO Religioso (Codigo, Religiao) VALUES (6, 'Ateismo');

INSERT INTO Economico (Codigo, MatPrima) VALUES (7, 'Ouro');

INSERT INTO Racial (Codigo, Etnia) VALUES (8, 'Aborígenes');

INSERT INTO Territorial (Codigo, Regiao) VALUES (9, 'Zona Leste');

