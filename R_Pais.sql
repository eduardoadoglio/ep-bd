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

CREATE TRIGGER DelOrUpdPais BEFORE DELETE OR UPDATE ON Pais
	FOR EACH ROW EXECUTE PROCEDURE DelOrUpdPais();

INSERT INTO Pais (Codigo, Pais) VALUES (1, 'Brasil')
INSERT INTO Pais (Codigo, Pais) VALUES (1, 'EUA')
INSERT INTO Pais (Codigo, Pais) VALUES (2, 'Síria')
INSERT INTO Pais (Codigo, Pais) VALUES (2, 'Ceará')