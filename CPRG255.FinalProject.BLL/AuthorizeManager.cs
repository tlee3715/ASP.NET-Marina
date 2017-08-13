using CPRG255.FinalProject.Domain;
using CPRG255.Framework.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CPRG255.FinalProject.BLL
{
    public class AuthorizeManager
    {
        private static string connectionName = "InlandMarinaConnectionString";

        #region AddAuthorize
        public static string AddAuthorize(string username, string password, int CustomerID)
        {
            try
            {
                DataGateWay access = new DataGateWay(connectionName);

                string sql = @"use InlandMarina
                               INSERT INTO Authorize(UserName,Password,CustomerID)
                               VALUES(@UserName,@Password,@CustomerID)";

                IDataParameter UserNamePar = access.CreateParameter;
                UserNamePar.ParameterName = "@UserName";
                UserNamePar.DbType = DbType.String;
                UserNamePar.Value = username;

                IDataParameter PasswordPar = access.CreateParameter;
                PasswordPar.ParameterName = "@Password";
                PasswordPar.DbType = DbType.String;
                PasswordPar.Value = password;

                IDataParameter CustomerPar = access.CreateParameter;
                CustomerPar.ParameterName = "@CustomerID";
                CustomerPar.DbType = DbType.Int32;
                CustomerPar.Value = CustomerID;

                IDataParameter[] pars =
                    new IDataParameter[] { UserNamePar, PasswordPar, CustomerPar };

                access.ExecuteNonQuery(sql, pars, CommandType.Text);
                return "Success";
            }
            catch
            {
                return "Failed to add record ! Please contact Administrator !";
            }
        }
        #endregion

        #region UpdateAuthorize
        public static string UpdateAuthorize(string username, string password, int CustomerID)
        {
            try
            {
                DataGateWay access = new DataGateWay(connectionName);

                string sql = @"use InlandMarina
                           UPDATE Authorize
                           SET UserName = @UserName,
                               Password = @Password
                           WHERE CustomerID = @CustomerID";

                IDataParameter UserNamePar = access.CreateParameter;
                UserNamePar.ParameterName = "@UserName";
                UserNamePar.DbType = DbType.String;
                UserNamePar.Value = username;

                IDataParameter PasswordPar = access.CreateParameter;
                PasswordPar.ParameterName = "@Password";
                PasswordPar.DbType = DbType.String;
                PasswordPar.Value = password;

                IDataParameter CustomerPar = access.CreateParameter;
                CustomerPar.ParameterName = "@CustomerID";
                CustomerPar.DbType = DbType.Int32;
                CustomerPar.Value = CustomerID;

                IDataParameter[] pars =
                    new IDataParameter[] { UserNamePar, PasswordPar, CustomerPar };

                access.ExecuteNonQuery(sql, pars, CommandType.Text);
                return "Success";
            }
            catch
            {
                return "Failed to update record ! Please contact Administrator !";
            }
        }
        #endregion
    }
}
