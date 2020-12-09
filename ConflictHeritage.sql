CREATE FUNCTION InserirHierarquiaGat() RETURNS trigger AS $InserirHierarquiaGat$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM Racial WHERE Racial.Codigo = NEW.Codigo) + (SELECT COUNT(*)FROM Economico WHERE Economico.Codigo = NEW.Codigo) + (SELECT COUNT(*)FROM Religioso WHERE Religioso.Codigo = NEW.Codigo) + (SELECT COUNT(*)FROM Territorial WHERE Territorial.Codigo = NEW.Codigo)) > 0 THEN
            RAISE EXCEPTION 'Este conflito já possiu um tipo associado!';
        END IF;

        RETURN NEW;
    END;
$InserirHierarquiaGat$ LANGUAGE plpgsql;

CREATE TRIGGER InserirHierarquiaRac BEFORE INSERT ON Racial
    FOR EACH ROW EXECUTE PROCEDURE InserirHierarquiaGat();

CREATE TRIGGER InserirHierarquiaEco BEFORE INSERT ON Economico
    FOR EACH ROW EXECUTE PROCEDURE InserirHierarquiaGat();
	
CREATE TRIGGER InserirHierarquiaReg BEFORE INSERT ON Religioso
    FOR EACH ROW EXECUTE PROCEDURE InserirHierarquiaGat();
	
CREATE TRIGGER InserirHierarquiaTer BEFORE INSERT ON Territorial
    FOR EACH ROW EXECUTE PROCEDURE InserirHierarquiaGat();

