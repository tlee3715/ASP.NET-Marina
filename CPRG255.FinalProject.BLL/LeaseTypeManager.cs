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
    public class LeaseTypeManager
    {
        private static string connectionName = "InlandMarinaConnectionString";

        #region GetLeaseTypes
        public static IList<LeaseType> GetLeaseTypes()
        {
            DataGateWay access = new DataGateWay(connectionName);
            IList<LeaseType> Types = new List<LeaseType>();

            string sql = @"use InlandMarina
                           SELECT * FROM LeaseType";

            LeaseType type = null;

            try
            {
                using (var reader = access.ExecuteQuery(sql, null, CommandType.Text))
                {
                    while (reader.Read())
                    {
                        type = new LeaseType()
                        {
                            ID = reader.GetInt32(reader.GetOrdinal("ID")),
                            Name = reader.GetString(reader.GetOrdinal("Name")),
                            StandardRateAmount = reader.GetDecimal(reader.GetOrdinal("StandardRateAmount"))
                        };
                        Types.Add(type);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving data from database !", ex);
            }
            return Types;
        }
        #endregion
    }
}
