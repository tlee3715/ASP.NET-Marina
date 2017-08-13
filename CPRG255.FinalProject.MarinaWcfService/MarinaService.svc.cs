using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using CPRG255.FinalProject.Domain;
using CPRG255.FinalProject.BLL;

namespace CPRG255.FinalProject.MarinaWcfService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class MarinaService : IMarinaService
    {
        public string AddAuthorize(string username, string password, int CustomerID)
        {
            return AuthorizeManager.AddAuthorize(username, password, CustomerID);
        }

        public string AddBoat(string registerNumber, string manufacturer, int modelYear, int length, int customerID)
        {
            return BoatManager.AddBoat(registerNumber, manufacturer, modelYear, length, customerID);
        }

        public string AddCustomer(string FirstName, string LastName, string Phone, string City)
        {
            return CustomerManager.AddCustomer(FirstName, LastName, Phone, City);
        }

        public string AddLease(DateTime startDate, DateTime endDate, int slipID, int customerID, int leaseTypeID)
        {
            return LeaseManager.AddLease(startDate, endDate, slipID, customerID, leaseTypeID);
        }

        public Customer Authenticate(string username, string password)
        {
            return CustomerManager.Authenticate(username, password);
        }

        public Boat[] GetAllBoats()
        {
            return BoatManager.GetAllBoats().ToArray();
        }

        public Customer[] GetAllCustomers()
        {
            return CustomerManager.GetAllCustomers().ToArray();
        }

        public Slip[] GetAllSlips()
        {
            return SlipManager.GetAllSlips().ToArray();
        }

        public Slip[] GetAvailableSlipsByDockId(int id)
        {
            return SlipManager.GetAvailableSlipsByDockId(id).ToArray();
        }

        public Boat GetBoatById(int id)
        {
            return BoatManager.GetBoatById(id);
        }

        public Boat[] GetBoatsByCustomerId(int id)
        {
            return BoatManager.GetBoatsByCustomerId(id).ToArray();
        }

        public Customer GetCustomerRecordById(int id)
        {
            return CustomerManager.GetCustomerRecordById(id);
        }

        public Dock[] GetDocks()
        {
            return DockManager.GetDocks().ToArray();
        }

        public Dock[] GetDocksByLocationId(int id)
        {
            return DockManager.GetDocksByLocationId(id).ToArray();
        }

        public LeaseType[] GetLeaseTypes()
        {
            return LeaseTypeManager.GetLeaseTypes().ToArray();
        }

        public Location[] GetLocations()
        {
            return LocationManager.GetLocations().ToArray();
        }

        public string UpdateAuthorize(string username, string password, int CustomerID)
        {
            return AuthorizeManager.UpdateAuthorize(username, password, CustomerID);
        }

        public string UpdateBoat(int ID, string RegistrationNumber, string Manufacturer, int ModelYear, int Length)
        {
            return BoatManager.UpdateBoat(ID, RegistrationNumber, Manufacturer, ModelYear, Length);
        }

        public string UpdateCustomer(int ID, string FirstName, string LastName, string Phone, string City)
        {
            return CustomerManager.UpdateCustomer(ID, FirstName, LastName, Phone, City);
        }
    }
}
