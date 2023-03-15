using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Kapcioszek_strona.Pages
{
    public class AlbumyModel : PageModel
    {
        public int[] id { get; set; }

        public string[] name { get; set; }

        public string[] cover_art { get; set; }

        public int[] year_of_release { get; set; }

        public string[] link { get; set; }

        public AlbumyModel() {

            int i = 0;

            string connStr = "server=localhost;user=root;database=strona_praktyka;port=3306;password=";
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "SELECT ID FROM album";
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

            this.id = new int[i];
            this.name = new string[i];
            this.cover_art = new string[i];
            this.year_of_release = new int[i];
            this.link = new string[i];

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

                string sql = "SELECT name, cover_art, year_of_release,link FROM album";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    id[i] = i;
                    name[i] = rdr.GetString("name");
                    cover_art[i] = rdr.GetString("cover_art");
                    year_of_release[i] = rdr.GetInt32("year_of_release");
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
