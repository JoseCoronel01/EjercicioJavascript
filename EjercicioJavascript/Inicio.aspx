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
            <input type="button" value="Save Gestion" onclick="saveGestion();return false;" />
        </div>
    </form>

    <script src="Inicio.js"></script>
</body>
</html>
