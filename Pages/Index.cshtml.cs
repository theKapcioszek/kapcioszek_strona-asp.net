using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Kapcioszek_strona.Pages
{
    public class IndexModel : PageModel
    {
        public string name { get; set; }

        public string aname { get; set; }

        public string link { get; set; }

        public int iloscUtworow { get; set; }


        public IndexModel()
        {

            this.name = string.Empty;
            this.aname = string.Empty; 
            this.link = string.Empty;

            int i = 0;

            string connStr = "server=localhost;user=root;database=strona_praktyka;port=3306;password=";
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "SELECT ID FROM utwor;";
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

            this.iloscUtworow = i;

        }

        public void OnGet()
        {
            Random rnd = new Random();

            int losowanie_utworu = rnd.Next(iloscUtworow);

            string connStr = "server=localhost;user=root;database=strona_praktyka;port=3306;password=";
            MySqlConnection conn = new MySqlConnection(connStr);
            try
            {
                Console.WriteLine("Connecting to MySQL...");
                conn.Open();

                string sql = "SELECT utwor.name, utwor.link, album.name AS aname FROM utwor JOIN album on utwor.album = album.ID WHERE utwor.ID = " + losowanie_utworu + ";";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    name = rdr.GetString("name");
                    aname = rdr.GetString("aname");
                    link = rdr.GetString("link");
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