using CPRG255.Framework.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CPRG255.FinalProject.Domain;

namespace CPRG255.FinalProject.BLL
{
    public class LocationManager
    {
        private static string connectionName = "InlandMarinaConnectionString";

        #region GetLocations
        public static IList<Location> GetLocations()
        {
            DataGateWay access = new DataGateWay(connectionName);
            IList<Location> Locations = new List<Location>();

            string sql = @"use InlandMarina
                           SELECT * FROM Location";

            Location location = null;

            try
            {
                using (var reader = access.ExecuteQuery(sql, null, CommandType.Text))
                {
                    while (reader.Read())
                    {
                        location = new Location()
                        {
                            ID = reader.GetInt32(reader.GetOrdinal("ID")),
                            Name = reader.GetString(reader.GetOrdinal("Name"))
                        };
                        Locations.Add(location);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving data from database !", ex);
            }

            return Locations;
        }
        #endregion
    }
}
