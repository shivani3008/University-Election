using System;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace DAL_CLG
{
    public class DLayer_clg
    {
        MySqlConnection get_connection()
        {
            //string connectionString = @"server=localhost;database=university_election;uid=root;password='';";
            //string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            string connectionString = ConfigurationManager.AppSettings["connectionStringClg"].ToString();

            MySqlConnection conn = new MySqlConnection(connectionString);
            return conn;
        }

        public DataSet get_data(string query)
        {
            MySqlConnection conn = get_connection();
            conn.Open();
            if (conn != null && conn.State == ConnectionState.Open)
            {
                DataSet ds = new DataSet();
                MySqlCommand cmd = new MySqlCommand(query, conn);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                da.Fill(ds);
                conn.Close();
                return ds;
            }
            else
                return null;
        }
    }
}