INSERT INTO clientes (documento,nombrecompleto,direccion,tel1,tel2,agente,fecha,pais,estado,ciudad) 
VALUES ('PRUEBA','ANA LEYVA PEREZ','GUERRERO 123 PTE','45786132','1234567890','ANA LEYVA','1990-01-10','MEXICO','SINALOA','GUASAVE')
INSERT INTO gestiones (idcliente,fecha,agente,res1,comentarios) 
VALUES ('1','2022-04-13','Henry Gonzalez','Pago agendado','Eliminar Cliente')
--se insertaron estos registros para probar los querys del ejercicio 1 Y 2.
-------------------------------------


--ejercicio 1: mostrar todas las gestiones de los clientes con teléfono 45786132
SELECT g.*
FROM clientes c
INNER JOIN gestiones g ON g.idcliente=c.id
WHERE c.tel1=45786132 OR c.tel2=45786132

--ejercicio 2: mostrar por día la cantidad de gestiones realizadas por el agente Henry Gonzalez.
SELECT COUNT(id) AS cantidad FROM gestiones 
WHERE agente = 'Henry Gonzalez' AND fecha = '2022-04-13'

--ejercicio 3: crear un nuevo cliente con mis datos.
INSERT INTO clientes (documento,nombrecompleto,direccion,tel1,tel2,agente,fecha,pais,estado,ciudad) 
VALUES ('PRUEBA','JOSÉ GILBERTO III CORONEL VELÁZQUEZ','RIO PIAXTLA 1165 NTE','6681096436','6688010001','JOSE CORONEL','1988-11-26','MEXICO','SINALOA','LOS MOCHIS')
