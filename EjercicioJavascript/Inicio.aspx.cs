using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace EjercicioJavascript
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static Respuesta saveGestion(string Fecha, int IdCliente, string Comentarios)
        {
            Respuesta res = new Respuesta();
            try
            {
                res.Exito = false;

                using (var mysql = new MySqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
                {
                    mysql.Open();

                    using (var cmd = new MySqlCommand())
                    {
                        cmd.Connection = mysql;
                        cmd.CommandType = System.Data.CommandType.Text;
                        cmd.CommandText = "INSERT INTO gestiones (idcliente,fecha,agente,res1,comentarios) " +
                            "values (@idcliente,@fecha,@agente,@res1,@comentarios)";
                        cmd.Parameters.AddWithValue("@idcliente", IdCliente);
                        cmd.Parameters.AddWithValue("@Fecha", DateTime.Parse(Fecha));
                        cmd.Parameters.AddWithValue("@agente", "Henry Gonzalez");
                        cmd.Parameters.AddWithValue("@res1", "Pago agendado");
                        cmd.Parameters.AddWithValue("@comentarios", Comentarios);
                        MySqlDataReader reader = cmd.ExecuteReader();
                        {
                            res.Exito = true;
                            reader.Close();
                            //hasta aqui el ejercicio 1 de javascript.

                            //Ejercicio 2 de javascript.
                            if (Comentarios == "Eliminar Cliente")
                            {
                                using (var cmd2 = new MySqlCommand())
                                {
                                    cmd2.Connection = mysql;
                                    cmd2.CommandType = System.Data.CommandType.Text;
                                    cmd2.CommandText = "Delete from clientes where id = @id";
                                    cmd2.Parameters.AddWithValue("@id", IdCliente);
                                    MySqlDataReader reader2 = cmd2.ExecuteReader();
                                    {
                                        res.Mensaje = "Se elimino al cliente.";
                                    }
                                    reader2.Close();
                                }
                            }
                            
                        }
                    }

                    mysql.Close();
                }

            }
            catch (Exception ex)
            {
                res.Exito = false;
                res.Mensaje = ex.Message.ToString();
            }
            finally 
            {
                if (res.Exito)
                    res.Mensaje = "";
            }
            return res;
        }
    }

    public class Respuesta
    {
        public bool Exito { get; set; }
        public string Mensaje { get; set; }
    }
}

