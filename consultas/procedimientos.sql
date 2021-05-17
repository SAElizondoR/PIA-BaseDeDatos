CREATE FUNCTION contar_vecinos(@ID_GRUPO INT)
RETURNS INT
AS
BEGIN
    DECLARE @CONTADOR INT;
    SELECT @CONTADOR = COUNT(dni_vecino)
    FROM vecino
    WHERE id_grupo = @ID_GRUPO
    RETURN(@CONTADOR);
END;
GO
CREATE TRIGGER agregar_vecino ON vecino
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
SET NOCOUNT ON
UPDATE grupo
SET numero_integrantes_grupo = dbo.contar_vecinos(id_grupo)
END
GO
CREATE PROCEDURE BorrarFilaEvento @id INT
AS
DELETE FROM evento
WHERE id_evento = @id
GO