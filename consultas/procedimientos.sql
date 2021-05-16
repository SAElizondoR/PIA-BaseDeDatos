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
/* GO
CREATE TRIGGER agregar_vecino ON vecino
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
SET NOCOUNT ON
UPDATE grupo
SET grupo.numero_integrantes_grupo = contar_vecinos(id_grupo)
WHERE grupo.id_grupo = id_grupo;
END */