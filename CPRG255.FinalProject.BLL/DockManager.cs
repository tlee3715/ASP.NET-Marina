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
    public class DockManager
    {
        private static string connectionName = "InlandMarinaConnectionString";

        #region GetDocks
        public static IList<Dock> GetDocks()
        {
            DataGateWay access = new DataGateWay(connectionName);
            IList<Dock> Docks = new List<Dock>();

            string sql = @"use InlandMarina
                           SELECT * FROM Dock";

            Dock dock = null;

            try
            {
                using (var reader = access.ExecuteQuery(sql, null, CommandType.Text))
                {
                    while (reader.Read())
                    {
                        dock = new Dock()
                        {
                            ID = reader.GetInt32(reader.GetOrdinal("ID")),
                            Name = reader.GetString(reader.GetOrdinal("Name")),
                            LocationId = reader.GetInt32(reader.GetOrdinal("LocationId")),
                            WaterService = reader.GetBoolean(reader.GetOrdinal("WaterService")),
                            ElectricalService = reader.GetBoolean(reader.GetOrdinal("ElectricalService"))
                        };
                        Docks.Add(dock);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving data from database !", ex);
            }

            return Docks;
        }
        #endregion

        #region GetDocksByLocationId
        public static IList<Dock> GetDocksByLocationId(int id)
        {
            var docks = GetDocks().Where(o => o.LocationId == id).ToList();

            return docks;
        }
        #endregion
    }
}
