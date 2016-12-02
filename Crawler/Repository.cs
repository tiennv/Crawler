using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;

namespace Crawler
{
    public class RepositoryLinks : BaseRepository<Links>
    {
        public void QueryMutiple()
        {
            using (var sqlConnection = new SqlConnection(ConnectionString))
            {
                sqlConnection.Open();

                var query = @"
                    SELECT * FROM dbo.Links 
                    SELECT * FROM dbo.Contents
                ";

                // return a GridReader
                using (var result = sqlConnection.QueryMultiple(query))
                {
                    var supplier = result.Read<Links>();
                    var products = result.Read<Contents>();

                    //Console.WriteLine(string.Format("Total Products {0}"));
                }
                sqlConnection.Close();
            }
        }
    }

    public class RepositoryContents : BaseRepository<Contents>
    {

    }

    public class RepositorySites : BaseRepository<Sites>
    {

    }    
}
