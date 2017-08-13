using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace CPRG255.FinalProject.Domain
{
    [DataContract]
    public class Customer
    {
        [DataMember]
        public int ID { get; set; }
        [DataMember]
        public string FirstName { get; set; }
        [DataMember]
        public string LastName { get; set; }
        [DataMember]
        public string Phone { get; set; }
        [DataMember]
        public string City { get; set; }
        [DataMember]
        public Authorize Authorize { get; set; }
        [DataMember]
        public Boat Boat { get; set; }

        public Customer() { } //default ctor

        public Customer(int id, string firstname, string lastname, string phone,
                        string city, Authorize authorize)
        {
            this.ID = id;
            this.FirstName = firstname;
            this.LastName = lastname;
            this.Phone = phone;
            this.City = city;
            this.Authorize = authorize;
        }

        public Customer(string firstname, string lastname, string phone,
                        string city, Authorize authorize)
        {
            this.FirstName = firstname;
            this.LastName = lastname;
            this.Phone = phone;
            this.City = city;
            this.Authorize = authorize;
        }
    }
}
