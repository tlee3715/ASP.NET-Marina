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
    public class BoatManager
    {
        private static string connectionName = "InlandMarinaConnectionString";

        #region AddBoat
        public static string AddBoat(string registerNumber, string manufacturer, int modelYear, int length, int customerID)
        {
            try
            {
                DataGateWay access = new DataGateWay(connectionName);

                string sql = @"use InlandMarina
                               INSERT INTO Boat(RegistrationNumber,Manufacturer,ModelYear,Length,CustomerID)
                               VALUES(@RegistrationNumber,@Manufacturer,@ModelYear,@Length,@CustomerID)";

                IDataParameter RegisterNoPar = access.CreateParameter;
                RegisterNoPar.ParameterName = "@RegistrationNumber";
                RegisterNoPar.DbType = DbType.String;
                RegisterNoPar.Value = registerNumber;

                IDataParameter ManufacturerPar = access.CreateParameter;
                ManufacturerPar.ParameterName = "@Manufacturer";
                ManufacturerPar.DbType = DbType.String;
                ManufacturerPar.Value = manufacturer;

                IDataParameter YearPar = access.CreateParameter;
                YearPar.ParameterName = "@ModelYear";
                YearPar.DbType = DbType.Int32;
                YearPar.Value = modelYear;

                IDataParameter LengthPar = access.CreateParameter;
                LengthPar.ParameterName = "@Length";
                LengthPar.DbType = DbType.Int32;
                LengthPar.Value = length;

                IDataParameter CustIDPar = access.CreateParameter;
                CustIDPar.ParameterName = "@CustomerID";
                CustIDPar.DbType = DbType.Int32;
                CustIDPar.Value = customerID;

                IDataParameter[] pars =
                    new IDataParameter[] { RegisterNoPar, ManufacturerPar, YearPar, LengthPar, CustIDPar };

                access.ExecuteNonQuery(sql, pars, CommandType.Text);
                return "Success";
            }
            catch
            {
                return "Failed to add record ! Please contact Administrator !";
            }
        }
        #endregion

        #region UpdateBoat
        public static string UpdateBoat(int ID, string RegistrationNumber, string Manufacturer, int ModelYear, int Length)
        {
            try
            {
                DataGateWay access = new DataGateWay(connectionName);

                string sql = @"use InlandMarina
                           UPDATE Boat
                           SET RegistrationNumber = @RegistrationNumber,
                               Manufacturer = @LastName,
                               ModelYear = @Phone,
                               Length = @City
                           WHERE ID = @ID";

                IDataParameter RegisterNoPar = access.CreateParameter;
                RegisterNoPar.ParameterName = "@RegistrationNumber";
                RegisterNoPar.DbType = DbType.String;
                RegisterNoPar.Value = RegistrationNumber;

                IDataParameter ManufacturerPar = access.CreateParameter;
                ManufacturerPar.ParameterName = "@Manufacturer";
                ManufacturerPar.DbType = DbType.String;
                ManufacturerPar.Value = Manufacturer;

                IDataParameter YearPar = access.CreateParameter;
                YearPar.ParameterName = "@ModelYear";
                YearPar.DbType = DbType.Int32;
                YearPar.Value = ModelYear;

                IDataParameter LengthPar = access.CreateParameter;
                LengthPar.ParameterName = "@Length";
                LengthPar.DbType = DbType.Int32;
                LengthPar.Value = Length;

                IDataParameter CustIDPar = access.CreateParameter;
                CustIDPar.ParameterName = "@ID";
                CustIDPar.DbType = DbType.Int32;
                CustIDPar.Value = ID;

                IDataParameter[] pars =
                    new IDataParameter[] { RegisterNoPar, ManufacturerPar, YearPar, LengthPar, CustIDPar };

                access.ExecuteNonQuery(sql, pars, CommandType.Text);
                return "Success";
            }
            catch
            {
                return "Failed to update record ! Please contact Administrator !";
            }
        }
        #endregion

        #region GetBoatsByCustomerId
        public static IList<Boat> GetBoatsByCustomerId(int id)
        {           
            var boats = GetAllBoats().Where(o => o.CustomerID == id).ToList();

            return boats;
        }
        #endregion

        #region GetAllBoat
        public static IList<Boat> GetAllBoats()
        {
            DataGateWay access = new DataGateWay(connectionName);
            IList<Boat> Boats = new List<Boat>();

            string sql = @"use InlandMarina
                           SELECT * FROM Boat";

            Boat boat = null;

            try
            {
                using (var reader = access.ExecuteQuery(sql, null, CommandType.Text))
                {
                    while (reader.Read())
                    {
                        boat = new Boat()
                        {
                            ID = reader.GetInt32(reader.GetOrdinal("ID")),
                            RegistrationNumber = reader.GetString(reader.GetOrdinal("RegistrationNumber")),
                            Manufacturer = reader.GetString(reader.GetOrdinal("Manufacturer")),
                            ModelYear = reader.GetInt32(reader.GetOrdinal("ModelYear")),
                            Length = reader.GetInt32(reader.GetOrdinal("Length")),
                            CustomerID = reader.GetInt32(reader.GetOrdinal("CustomerID"))
                        };
                        Boats.Add(boat);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving data from database !", ex);
            }
            return Boats;
        }
        #endregion

        #region GetBoatById
        public static Boat GetBoatById(int id)
        {
            var boat = GetAllBoats().SingleOrDefault(o => o.ID == id);

            return boat;
        }
        #endregion
    }
}
