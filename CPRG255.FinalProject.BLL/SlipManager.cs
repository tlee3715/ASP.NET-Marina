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
    public class SlipManager
    {
        private static string connectionName = "InlandMarinaConnectionString";

        #region GetAvailableSlipsByDockId
        public static IList<Slip> GetAvailableSlipsByDockId(int id)
        {
            var slips = GetAllSlips().Where(o => o.DockID == id).ToList();

            return slips;
        }
        #endregion

        #region GetAllSlips
        public static IList<Slip> GetAllSlips()
        {
            DataGateWay access = new DataGateWay(connectionName);
            IList<Slip> Slips = new List<Slip>();

            string sql = @"use InlandMarina
                           SELECT * FROM Slip";

            Slip slip = null;

            try
            {
                using (var reader = access.ExecuteQuery(sql, null, CommandType.Text))
                {
                    while (reader.Read())
                    {
                        slip = new Slip()
                        {
                            ID = reader.GetInt32(reader.GetOrdinal("ID")),
                            Width = reader.GetInt32(reader.GetOrdinal("Width")),
                            Length = reader.GetInt32(reader.GetOrdinal("Length")),
                            DockID = reader.GetInt32(reader.GetOrdinal("DockID"))
                        };
                        Slips.Add(slip);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving data from database !", ex);
            }
            return Slips;
        }
        #endregion
    }
}
