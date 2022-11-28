using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Kapcioszek_strona.Pages
{
    public class album_bootleg_princessModel : PageModel
    {
        public int[] id { get; set; }

        public string[] name { get; set; }

        public string[] link { get; set; }

        public album_bootleg_princessModel() {

            int i = 0;

            string connStr = "server=localhost;user=root;database=strona_praktyka;port=3306;password=";
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "SELECT ID FROM utwor WHERE album = 2";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    i++;
                }
                rdr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            conn.Close();
            Console.WriteLine("Done.");

            id = new int[i];
            name = new string[i];
            link = new string[i];

        }

        public void OnGet()
        {
            int i = 0;

            string connStr = "server=localhost;user=root;database=strona_praktyka;port=3306;password=";
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "SELECT name, link FROM utwor WHERE album = 2";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    id[i] = i;
                    name[i] = rdr.GetString("name");
                    link[i] = rdr.GetString("link");

                    i++;
                }
                rdr.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            conn.Close();
            Console.WriteLine("Done.");
        }
    }
}
