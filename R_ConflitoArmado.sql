-----f--------
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

CREATE TRIGGER IncludeDSGrupo BEFORE INSERT ON DSGrupo
    FOR EACH ROW EXECUTE PROCEDURE IncludeDSGrupo();

--------------------------------------------------------------------------------
CREATE FUNCTION IncludeDEGrupo() RETURNS trigger AS $IncludeDEGrupo$
    BEGIN
        IF (SELECT (SELECT COUNT(*) FROM DEGrupo WHERE DEGrupo.Codigo = NEW.Codigo AND DEGrupo.CodigoG = NEW.CodigoG) - (SELECT COUNT(*) FROM DSGrupo WHERE DSGrupo.Codigo = NEW.Codigo AND DSGrupo.CodigoG = NEW.CodigoG)) > 0 THEN
            RAISE EXCEPTION 'Não pode-se duplicar a participação no conflito!';
        END IF;

        RETURN NEW;
    END;
$IncludeDEGrupo$ LANGUAGE plpgsql;

CREATE TRIGGER IncludeDEGrupo BEFORE INSERT ON DEGrupo
    FOR EACH ROW EXECUTE PROCEDURE IncludeDEGrupo();

INSERT INTO Conflito (Codigo, NumMortos, NumFeridos, Nome) VALUES (1, 200, 200, 'Assalto da esquina');
INSERT INTO Conflito (Codigo, NumMortos, NumFeridos, Nome) VALUES (2, 28, 37, 'Assalto da EACH');
INSERT INTO Conflito (Codigo, NumMortos, NumFeridos, Nome) VALUES (3, 22, 10, 'Assalto da UNICAMP');
INSERT INTO GrupoArmado (CodigoG, NomeGrupo) VALUES (1, 'EACH');
INSERT INTO GrupoArmado (CodigoG, NomeGrupo) VALUES (2, 'IME');
INSERT INTO GrupoArmado (CodigoG, NomeGrupo) VALUES (3, 'ICMC');
INSERT INTO GrupoArmado (CodigoG, NomeGrupo) VALUES (4, 'UNICAMP');
INSERT INTO DEGrupo (Codigo, CodigoG, DataEntrada) VALUES (1, 1, NOW());
INSERT INTO DSGrupo (Codigo, CodigoG, DataSaida) VALUES (1, 1, NOW());

