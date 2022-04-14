<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="EjercicioJavascript.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Prueba</title>
    <script src="Scripts/jquery-3.6.0.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="text" name="Fecha" id="Fecha" placeholder="dd/mm/yyyy" />
            <input type="text" name="Comentarios" id="Comentarios" placeholder="Comentarios" />
            <script type="text/javascript">
                var idCliente = 2; //id cliente creado en el ejercicio 3 de mysql.

                function saveGestion() {
                    var fecha = $('#Fecha').val();
                    var comentarios = $('#Comentarios').val();
                    $.ajax({
                        async: false,
                        url: '/Inicio.aspx/saveGestion',
                        type: 'JSON',
                        contentType: 'application/json; charset=utf-8',
                        data: '{"Fecha": "'+fecha+'", "IdCliente": '+idCliente+', "Comentarios": "'+comentarios+'"}',
                        success: function (data) {
                            if (data.d.Exito) {
                                alert('Gestion creada con éxito. ' + data.d.Mensaje);
                            } else {
                                alert('Hubo un error en el servidor. ' + data.d.Mensaje);
                            }
                        },
                        error: function (error) {
                            alert(error);
                        }
                    });
                }

                function UC_exec(sql) {
                    if (mysql.exec(sql)) {
                        return true;
                    } else {
                        return false;
                    }
                }
            </script>
        </div>
    </form>
</body>
</html>
