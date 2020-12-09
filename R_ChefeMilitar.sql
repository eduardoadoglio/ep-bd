--Trigger de limitar quantidade de cefes militares dirigindo divisões
CREATE FUNCTION InserirChefMilitar() RETURNS trigger AS $InserirChefMilitar$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM ChefeMilitar WHERE ChefeMilitar.NroDivisao = NEW.NroDivisao)) = 3 THEN
            RAISE EXCEPTION 'Já possiu 3 Chefes Militares dirigindo a divisão!';
        END IF;

        RETURN NEW;
    END;
$InserirChefMilitar$ LANGUAGE plpgsql;

CREATE TRIGGER InserirChefMilitar BEFORE INSERT ON ChefeMilitar
    FOR EACH ROW EXECUTE PROCEDURE InserirChefMilitar();

--Limitar exclusão de CheffMilitar (Pelo menos 1 chefE dirige uma divisão)
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

CREATE TRIGGER DelOrUpdChefMilitar BEFORE DELETE OR UPDATE ON ChefeMilitar
	FOR EACH ROW EXECUTE PROCEDURE DelOrUpdChefMilitar();


INSERT INTO GrupoArmado (CodigoG, NomeGrupo, NumBaixasG) VALUES (1, 'EACH', 2);
INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (1, 'Nabio Fakano', 'Digimon');
INSERT INTO Divisao (CodigoG, NroDivisao, NumBaixasD, Barcos, Avioes, Tanques, Homens) VALUES (1, 1, 2, 2, 2, 2, 2);
INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (1, 'Amarelo', 'Nabio Fakano', 1, 1);
INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (2, 'Amarelo', 'Nabio Fakano', 1, 1);
INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (3, 'Amarelo', 'Nabio Fakano', 1, 1);

DELETE FROM ChefeMilitar WHERE CodigoChef = 1;
DELETE FROM ChefeMilitar WHERE CodigoChef = 2;
DELETE FROM ChefeMilitar WHERE CodigoChef = 3;


INSERT INTO GrupoArmado (CodigoG, NomeGrupo, NumBaixasG) VALUES (2, 'ICMC', 1);
INSERT INTO LiderPolitico (CodigoG, NomeL, Apoios) VALUES (2, 'MODRIGO RELLO', 'SPATULA');
INSERT INTO Divisao (CodigoG, NroDivisao, NumBaixasD, Barcos, Avioes, Tanques, Homens) VALUES (2, 2, 2, 2, 2, 2, 2);
INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (4, 'Amarelo', 'MODRIGO RELLO', 2, 2);
INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (5, 'Amarelo', 'MODRIGO RELLO', 2, 2);
INSERT INTO ChefeMilitar (codigoChef, Faixa, NomeL, CodigoG, NroDivisao) VALUES (6, 'Amarelo', 'MODRIGO RELLO', 2, 2);
UPDATE CHEFEMILITAR SET CODIGOG = 2, NRODIVISAO = 2, NOMEL = 'MODRIGO RELLO' WHERE CODIGOG = 1 AND NRODIVISAO = 1;