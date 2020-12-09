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


CREATE FUNCTION DelOrUpdPais() RETURNS trigger AS $DelOrUpdPais$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM Pais WHERE Pais.Codigo = OLD.Codigo)) = 1 THEN
            RAISE EXCEPTION 'Um conflito afeta pelo menos um país!';
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

CREATE FUNCTION IncludeDSGrupo() RETURNS trigger AS $IncludeDSGrupo$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM DEGrupo WHERE DEGrupo.Codigo = NEW.Codigo AND DEGrupo.CodigoG = NEW.CodigoG) - (SELECT COUNT(*) FROM DSGrupo WHERE DSGrupo.Codigo = NEW.Codigo AND DSGrupo.CodigoG = NEW.CodigoG)) != 1 THEN
            RAISE EXCEPTION 'Não pode-se terminar um conflito que não começou!';
        END IF;

        IF (SELECT (SELECT COUNT(*) FROM DEGrupo WHERE DEGrupo.Codigo = NEW.Codigo) - (SELECT COUNT(*) FROM DSGrupo WHERE DSGrupo.Codigo = NEW.Codigo)) <= 2 THEN
            RAISE EXCEPTION 'Em um conflito armado participam como mínimo dois grupos armados!';
        END IF;

        RETURN NEW;
    END;
$IncludeDSGrupo$ LANGUAGE plpgsql;

CREATE FUNCTION IncludeDEGrupo() RETURNS trigger AS $IncludeDEGrupo$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM DEGrupo WHERE DEGrupo.Codigo = NEW.Codigo AND DEGrupo.CodigoG = NEW.CodigoG) - (SELECT COUNT(*) FROM DSGrupo WHERE DSGrupo.Codigo = NEW.Codigo AND DSGrupo.CodigoG = NEW.CodigoG)) > 0 THEN
            RAISE EXCEPTION 'Não pode-se duplicar a participação no conflito!';
        END IF;

        RETURN NEW;
    END;
$IncludeDEGrupo$ LANGUAGE plpgsql;

CREATE FUNCTION InserirChefMilitar() RETURNS trigger AS $InserirChefMilitar$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM ChefeMilitar WHERE ChefeMilitar.NroDivisao = NEW.NroDivisao)) = 3 THEN
            RAISE EXCEPTION 'Já possiu 3 Chefes Militares dirigindo a divisão!';
        END IF;

        RETURN NEW;
    END;
$InserirChefMilitar$ LANGUAGE plpgsql;

CREATE FUNCTION DelOrUpdChefMilitar() RETURNS trigger AS $DelOrUpdChefMilitar$
    BEGIN

        IF (SELECT (SELECT COUNT(*) FROM ChefeMilitar WHERE ChefeMilitar.NroDivisao = OLD.NroDivisao)) = 1 THEN
            RAISE EXCEPTION 'Pelo menos 1 chefe militar deve dirigir uma divisão!';
        END IF;

      IF (TG_OP = 'UPDATE') THEN
        IF (SELECT (SELECT COUNT(*) FROM ChefeMilitar WHERE ChefeMilitar.NroDivisao = NEW.NroDivisao)) = 3 THEN
            RAISE EXCEPTION 'Já possiu 3 Chefes Militares dirigindo a nova divisão!';
            END IF;

          RETURN NEW;
      END IF;

      IF (TG_OP = 'DELETE') THEN
          RETURN OLD;
      END IF;

      RETURN NULL;

    END;
$DelOrUpdChefMilitar$ LANGUAGE plpgsql;

CREATE FUNCTION InserirHierarquiaGat() RETURNS trigger AS $InserirHierarquiaGat$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM Racial WHERE Racial.Codigo = NEW.Codigo) + (SELECT COUNT(*)FROM Economico WHERE Economico.Codigo = NEW.Codigo) + (SELECT COUNT(*)FROM Religioso WHERE Religioso.Codigo = NEW.Codigo) + (SELECT COUNT(*)FROM Territorial WHERE Territorial.Codigo = NEW.Codigo)) > 0 THEN
            RAISE EXCEPTION 'Este conflito já possiu um tipo associado!';
        END IF;

        RETURN NEW;
    END;
$InserirHierarquiaGat$ LANGUAGE plpgsql;

CREATE FUNCTION DelOrUpdDivisao() RETURNS trigger AS $DelOrUpdDivisao$
    BEGIN

        IF (SELECT (SELECT COUNT(*) FROM Divisao WHERE Divisao.CodigoG = OLD.CodigoG)) = 1 THEN
            RAISE EXCEPTION 'Todo grupo armado precisa dispor de no mínimo uma divisão!';
        END IF;

        IF (TG_OP = 'UPDATE') THEN
          RETURN NEW;
        END IF;

      IF (TG_OP = 'DELETE') THEN
          RETURN OLD;
        END IF;

        RETURN NULL;

    END;
$DelOrUpdDivisao$ LANGUAGE plpgsql;

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


INSERT INTO GrupoArmado (CodigoG, NomeGrupo) VALUES (1, 'EACH');
INSERT INTO GrupoArmado (CodigoG, NomeGrupo) VALUES (2, 'IME');
INSERT INTO GrupoArmado (CodigoG, NomeGrupo) VALUES (3, 'ICMC');
INSERT INTO GrupoArmado (CodigoG, NomeGrupo) VALUES (4, 'UNICAMP');

INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (1, 'Nabio Fakano', 'Digimon');
INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (2, 'MODRIGO RELLO', 'SPATULA');


INSERT INTO Divisao (CodigoG, NroDivisao, NumBaixasD, Barcos, Avioes, Tanques, Homens) VALUES (1, 1, 2, 2, 2, 2, 2);
INSERT INTO Divisao (CodigoG, NroDivisao, NumBaixasD, Barcos, Avioes, Tanques, Homens) VALUES (2, 2, 2, 2, 2, 2, 2);

INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (1, 'Tenente', 'Nabio Fakano', 1, 1);
INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (2, 'Tenente', 'Nabio Fakano', 1, 1);
INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (3, 'Tenente', 'Nabio Fakano', 1, 1);

INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (4, 'Tenente', 'MODRIGO RELLO', 2, 2);
INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (5, 'Tenente', 'MODRIGO RELLO', 2, 2);
INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (6, 'Tenente', 'MODRIGO RELLO', 2, 2);


INSERT INTO Conflito (Codigo, NumMortos, NumFeridos, Nome) VALUES (1, 200, 200, 'Assalto da esquina');
INSERT INTO Conflito (Codigo, NumMortos, NumFeridos, Nome) VALUES (2, 28, 37, 'Assalto da EACH');
INSERT INTO Conflito (Codigo, NumMortos, NumFeridos, Nome) VALUES (3, 22, 10, 'Assalto da UNICAMP');

INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (1, 1, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (1, 2, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (2, 2, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (2, 3, NOW());
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (2, 1, NOW());

INSERT INTO Pais (Codigo, Pais) VALUES (1, 'Brasil')
INSERT INTO Pais (Codigo, Pais) VALUES (1, 'EUA')
INSERT INTO Pais (Codigo, Pais) VALUES (2, 'Síria')
INSERT INTO Pais (Codigo, Pais) VALUES (2, 'Ceará')