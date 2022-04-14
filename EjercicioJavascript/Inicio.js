var idCliente = 2; //id cliente creado en el ejercicio 3 de mysql.

$(document).ready(function () {

});


function saveGestion() {
    var fecha = $('#Fecha').val();
    var comentarios = $('#Comentarios').val();
    $.ajax({
        async: false,
        url: '/Inicio.aspx/saveGestion',
        type: 'POST',
        contentType: 'application/json; charset=utf-8',
        data: '{"Fecha": "' + fecha + '", "IdCliente": ' + idCliente + ', "Comentarios": "' + comentarios + '"}',
        success: function (data) {
            if (data.d.Exito) {
                alert('Gestion creada con éxito. ' + data.d.Mensaje);
            } else {
                alert('Hubo un error en el servidor. ' + data.d.Mensaje);
            }
        },
        error: function (error) {
            alert(error + ' error en la petición ajax.');
        }
    });
}
