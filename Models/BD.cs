namespace TP8_Levin.Models;
using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
public class BD 
{

        private static string _connectionString =  @"Server=A-PHZ2-CIDI-024;DataBase=Freddo;Trusted_Connection=True;";
    public static List<Envase> ObtenerEnvase()
        {
            List<Envase> ListaEnvase = new List<Envase>();
            string sql = "SELECT * FROM Envase";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                ListaEnvase = db.Query<Envase>(sql).ToList();
            }
            return ListaEnvase;
        }


    public static List<Gustos> ObtenerGustos()
        {
            List<Gustos> ListaGus = new List<Gustos>();
            string sql = "SELECT * FROM Gustos";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                ListaGus = db.Query<Gustos>(sql).ToList();
            }
            return ListaGus;
        }

    public static List<MetodoDePago> ObtenerMetodoDePago()
        {
            List<MetodoDePago> ListaMetodoDePago = new List<MetodoDePago>();
            string sql = "SELECT * FROM MetodoDePago";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                ListaMetodoDePago = db.Query<MetodoDePago>(sql).ToList();
            }
            return ListaMetodoDePago;
        }

    public static Envase ObtenerEnvase(int IdEnvase)
        {
            Envase envase = null;
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                string sqlQuery = "SELECT * FROM Envase WHERE  IdEnvase = @eId";
                envase = db.QueryFirstOrDefault<Envase>(sqlQuery, new{eId=IdEnvase});
            }
            return envase;
        }

    public static MetodoDePago ObtenerMetodoDePago(int IdMetodoDePago)
        {
            MetodoDePago metodoDePago = null;
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                string sqlQuery = "SELECT * FROM MetodoDePago WHERE IdMetodoDePago = @mId";
                metodoDePago = db.QueryFirstOrDefault<MetodoDePago>(sqlQuery, new{mId=IdMetodoDePago});
            }
            return metodoDePago;
        }

    public static Gustos ObtenerGustos(int IdGustos)
        {
            Gustos gustos = null;
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                string sqlQuery = "SELECT * FROM Gustos WHERE  IdGustos = @gId";
                gustos = db.QueryFirstOrDefault<Gustos>(sqlQuery, new{gId=IdGustos});
            }
            return gustos;
        }

    public static void GuardarPedido (List<int> Gustos, int Metodo, int IdEnvase)
    {
        int max;
        string sql = "INSERT INTO Pedidos (IdMetodoDePago, IdEnvase) values (@pIdMetodoDePago, @pIdEnvase)";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql,new {pIdMetodoDePago = Metodo, pIdEnvase = IdEnvase});
        }

        string sql1 = "Select max(IdPedidos) From Pedidos ";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
           max = db.QueryFirstOrDefault<int>(sql1);
        }

        
        foreach (int g in Gustos)
        {
            string sql2 = "INSERT INTO GustosPedidos (IdGustos, IdPedidos) values (@pIdGustos,@pIdPedidos)";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute (sql2, new {pIdGustos = g, pIdPedidos = max});
            }
         
        }
        
    }
}





