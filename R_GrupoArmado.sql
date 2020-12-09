--Limitar minimo de divisões por grupo armado
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

CREATE TRIGGER DelOrUpdDivisao BEFORE DELETE OR UPDATE ON Divisao
	FOR EACH ROW EXECUTE PROCEDURE DelOrUpdDivisao();

UPDATE Divisao SET CODIGOG = 1, NRODIVISAO = 1 WHERE CODIGOG = 2 AND NRODIVISAO = 2;