using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPRG255.Framework.Data;
using System.Data;
using CPRG255.FinalProject.Domain;

namespace CPRG255.FinalProject.BLL
{
    public class CustomerManager
    {
        private static string connectionName = "InlandMarinaConnectionString";

        #region Authenticate
        public static Customer Authenticate(string username, string password)
        {
            DataGateWay access = new DataGateWay(connectionName);

            string sql = @"use InlandMarina
                           SELECT cust.ID, cust.FirstName, cust.LastName,
                                  cust.Phone, cust.City, auth.ID
                           FROM   Customer cust INNER JOIN             
                                  Authorize auth ON cust.ID = auth.CustomerID
                           WHERE  auth.UserName = @Username
                           AND    auth.Password = @Password";

            IDataParameter UsernamePar = access.CreateParameter;
            UsernamePar.ParameterName = "@Username";
            UsernamePar.DbType = DbType.String;
            UsernamePar.Value = username;

            IDataParameter PasswordPar = access.CreateParameter;
            PasswordPar.ParameterName = "@Password";
            PasswordPar.DbType = DbType.String;
            PasswordPar.Value = password;

            IDataParameter[] pars =
                new IDataParameter[] { UsernamePar, PasswordPar };

            var reader = access.ExecuteQuery(sql, pars, CommandType.Text);

            Customer cust = null;

            if (reader.Read())
            {
                cust = new Customer(reader.GetInt32(0), reader.GetString(1), reader.GetString(2),
                                    reader.GetString(3), reader.GetString(4),
                                    new Authorize(reader.GetInt32(5), username, password));

                return cust;
            }
            else return null;
        }
        #endregion

        #region GetAllCustomers
        public static IList<Customer> GetAllCustomers()
        {
            DataGateWay access = new DataGateWay(connectionName);
            IList<Customer> Customers = new List<Customer>();

            string sql = @"use InlandMarina
                           SELECT * FROM Customer";

            Customer cust = null;

            try
            {
                using (var reader = access.ExecuteQuery(sql, null, CommandType.Text))
                {
                    while (reader.Read())
                    {
                        cust = new Customer()
                        {
                            ID = reader.GetInt32(reader.GetOrdinal("ID")),
                            FirstName = reader.GetString(reader.GetOrdinal("FirstName")),
                            LastName = reader.GetString(reader.GetOrdinal("LastName")),
                            Phone = reader.GetString(reader.GetOrdinal("Phone")),
                            City = reader.GetString(reader.GetOrdinal("City"))
                        };
                        Customers.Add(cust);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving data from database !", ex);
            }

            return Customers;
        }
        #endregion

        #region GetCustomerRecordById
        public static Customer GetCustomerRecordById(int id)
        {
            return GetAllCustomers().SingleOrDefault(o => o.ID == id);
        }
        #endregion

        #region UpdateCustomer
        public static string UpdateCustomer(int ID, string FirstName, string LastName, string Phone, string City)
        {
            try
            {
                DataGateWay access = new DataGateWay(connectionName);

                string sql = @"use InlandMarina
                           UPDATE Customer
                           SET FirstName = @FirstName,
                               LastName = @LastName,
                               Phone = @Phone,
                               City = @City
                           WHERE ID = @Id";

                IDataParameter IdPar = access.CreateParameter;
                IdPar.ParameterName = "@Id";
                IdPar.DbType = DbType.Int32;
                IdPar.Value = ID;

                IDataParameter firstnamePar = access.CreateParameter;
                firstnamePar.ParameterName = "@FirstName";
                firstnamePar.DbType = DbType.String;
                firstnamePar.Value = FirstName;

                IDataParameter lastnamePar = access.CreateParameter;
                lastnamePar.ParameterName = "@LastName";
                lastnamePar.DbType = DbType.String;
                lastnamePar.Value = LastName;

                IDataParameter PhonePar = access.CreateParameter;
                PhonePar.ParameterName = "@Phone";
                PhonePar.DbType = DbType.String;
                PhonePar.Value = Phone;

                IDataParameter CityPar = access.CreateParameter;
                CityPar.ParameterName = "@City";
                CityPar.DbType = DbType.String;
                CityPar.Value = City;

                IDataParameter[] pars =
                    new IDataParameter[] { IdPar, firstnamePar, lastnamePar, PhonePar, CityPar };

                access.ExecuteNonQuery(sql, pars, CommandType.Text);

                return "Success";
            }
            catch
            {
                return "Update failed ! Please contact Administrator !";
            }       
        }
        #endregion

        #region AddCustomer
        public static string AddCustomer(string FirstName, string LastName, string Phone, string City)
        {
            try
            {
                DataGateWay access = new DataGateWay(connectionName);

                string sql = @"use InlandMarina
                           INSERT INTO Customer(FirstName,LastName,Phone,City)
                           VALUES(@FirstName,@LastName,@Phone,@City);
                           SELECT SCOPE_IDENTITY()";

                IDataParameter firstnamePar = access.CreateParameter;
                firstnamePar.ParameterName = "@FirstName";
                firstnamePar.DbType = DbType.String;
                firstnamePar.Value = FirstName;

                IDataParameter lastnamePar = access.CreateParameter;
                lastnamePar.ParameterName = "@LastName";
                lastnamePar.DbType = DbType.String;
                lastnamePar.Value = LastName;

                IDataParameter PhonePar = access.CreateParameter;
                PhonePar.ParameterName = "@Phone";
                PhonePar.DbType = DbType.String;
                PhonePar.Value = Phone;

                IDataParameter CityPar = access.CreateParameter;
                CityPar.ParameterName = "@City";
                CityPar.DbType = DbType.String;
                CityPar.Value = City;

                IDataParameter[] pars =
                    new IDataParameter[] { firstnamePar, lastnamePar, PhonePar, CityPar };

                var idReturned = access.ExecuteScalar(sql, pars, CommandType.Text);
                return idReturned;
            }
            catch
            {
                return "Failed to add record ! Please contact Administrator !";
            }          
        }
        #endregion
    }
}
