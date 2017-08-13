using CPRG255.FinalProject.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace CPRG255.FinalProject.MarinaWcfService
{
    [ServiceContract]
    public interface IMarinaService
    {
        //Authorize
        [OperationContract]
        string AddAuthorize(string username, string password, int CustomerID);
        [OperationContract]
        string UpdateAuthorize(string username, string password, int CustomerID);

        //Boat
        [OperationContract]
        string AddBoat(string registerNumber, string manufacturer, int modelYear, int length, int customerID);
        [OperationContract]
        string UpdateBoat(int ID, string RegistrationNumber, string Manufacturer, int ModelYear, int Length);
        [OperationContract]
        Boat[] GetBoatsByCustomerId(int id);
        [OperationContract]
        Boat[] GetAllBoats();
        [OperationContract]
        Boat GetBoatById(int id);

        //Customer
        [OperationContract]
        Customer Authenticate(string username, string password);
        [OperationContract]
        Customer[] GetAllCustomers();
        [OperationContract]
        string UpdateCustomer(int ID, string FirstName, string LastName, string Phone, string City);
        [OperationContract]
        string AddCustomer(string FirstName, string LastName, string Phone, string City);
        [OperationContract]
        Customer GetCustomerRecordById(int id);

        //Dock      
        [OperationContract]
        Dock[] GetDocks();
        [OperationContract]
        Dock[] GetDocksByLocationId(int id);

        //Lease
        [OperationContract]
        string AddLease(DateTime startDate, DateTime endDate, int slipID, int customerID, int leaseTypeID);

        //Lease Type
        [OperationContract]
        LeaseType[] GetLeaseTypes();

        //Location
        [OperationContract]
        Location[] GetLocations();

        //Slip
        [OperationContract]
        Slip[] GetAvailableSlipsByDockId(int id);
        [OperationContract]
        Slip[] GetAllSlips();
    }
}
