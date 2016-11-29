using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using DapperExtensions;

namespace Crawler
{
    public interface IBaseRepository<T> where T : ModalsBase, new()
    {
        T GetById(int id);
        int Add(T t);
        bool Update(T t);
        bool Delete(int id);

        List<T> GetAll(int top);
    }

    public class BaseRepository<T> : IBaseRepository<T> where T : ModalsBase, new()
    {       
        public BaseRepository()
        {
     
        }

        private string _connectionString = "";

        protected string ConnectionString
        {
            get
            {
                if (_connectionString == "" && ConfigurationManager.ConnectionStrings["Crawler"] != null)
                {
                    _connectionString = ConfigurationManager.ConnectionStrings["Crawler"].ConnectionString;
                }
                return _connectionString;
            }
        }

        public int Add(T entity)
        {
            int insertedId = 0;
            try
            {

                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    sqlConnection.Open();
                    insertedId = sqlConnection.Insert<T>(entity);                    
                    sqlConnection.Dispose();
                    sqlConnection.Close();
                }
            }
            catch (Exception ex)
            {

            }


            return insertedId;
        }
        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public T GetById(int id)
        {
            return GetByIdFromDb(id);            
        }

        public IList<T> GetByIds(ICollection<int> ids)
        {
            return ids.Select(GetById).Where(t => t != null).ToList();
        }

        public bool Update(T entity)
        {
            using (var sqlConnection = new SqlConnection(ConnectionString))
            {
                sqlConnection.Open();
                if (sqlConnection.Update<T>(entity))
                {                    
                    return true;
                }                
                return false;
            }
        }

        public T GetByIdFromDb(int id)
        {
            using (var sqlConnection = new SqlConnection(ConnectionString))
            {
                sqlConnection.Open();
                var result = sqlConnection.Query<T>($"select * from {typeof(T).Name} where id = {id}").FirstOrDefault();
                sqlConnection.Close();
                sqlConnection.Dispose();

                return result;
            }
        }

        public List<T> GetAll(int top)
        {
            using (var sqlConnection = new SqlConnection(ConnectionString))
            {
                sqlConnection.Open();
                var result = sqlConnection.Query<T>($"select Top({top}) * from {typeof(T).Name} where DateSynced is null").ToList();
                sqlConnection.Close();
                sqlConnection.Dispose();
                return result;
            }
        }
    }
}
