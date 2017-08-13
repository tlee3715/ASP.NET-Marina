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
    public class LeaseManager
    {
        private static string connectionName = "InlandMarinaConnectionString";

        #region AddLease
        public static string AddLease(DateTime startDate, DateTime endDate, int slipID, int customerID, int leaseTypeID)
        {
            try
            {
                DataGateWay access = new DataGateWay(connectionName);

                string sql = @"use InlandMarina
                           INSERT INTO Lease(StartDate,EndDate,SlipID,CustomerID,LeaseTypeID)
                           VALUES(@StartDate,@EndDate,@SlipID,@CustomerID,@LeaseTypeID)";

                IDataParameter StartDatePar = access.CreateParameter;
                StartDatePar.ParameterName = "@StartDate";
                StartDatePar.DbType = DbType.DateTime;
                StartDatePar.Value = startDate;

                IDataParameter EndDatePar = access.CreateParameter;
                EndDatePar.ParameterName = "@EndDate";
                EndDatePar.DbType = DbType.DateTime;
                EndDatePar.Value = endDate;

                IDataParameter SlipPar = access.CreateParameter;
                SlipPar.ParameterName = "@SlipID";
                SlipPar.DbType = DbType.Int32;
                SlipPar.Value = slipID;

                IDataParameter CustomerIDPar = access.CreateParameter;
                CustomerIDPar.ParameterName = "@CustomerID";
                CustomerIDPar.DbType = DbType.Int32;
                CustomerIDPar.Value = customerID;

                IDataParameter LeaseTypePar = access.CreateParameter;
                LeaseTypePar.ParameterName = "@LeaseTypeID";
                LeaseTypePar.DbType = DbType.Int32;
                LeaseTypePar.Value = leaseTypeID;

                IDataParameter[] pars =
                    new IDataParameter[] { StartDatePar, EndDatePar, SlipPar, CustomerIDPar, LeaseTypePar };

                access.ExecuteNonQuery(sql, pars, CommandType.Text);
                return "Success";
            }
            catch
            {
                return "Failed to add record ! Please contact Administrator !";
            }
        }
        #endregion
    }
}
