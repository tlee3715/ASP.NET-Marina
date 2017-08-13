using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace CPRG255.FinalProject.Domain
{
    [DataContract]
    public class Boat
    {
        [DataMember]
        public int ID { get; set; }
        [DataMember]
        public string RegistrationNumber { get; set; }
        [DataMember]
        public string Manufacturer { get; set; }
        [DataMember]
        public int ModelYear { get; set; }
        [DataMember]
        public int Length { get; set; }
        [DataMember]
        public int CustomerID { get; set; }

        public Boat() { }

        public Boat(int id, string registerNo, string manufacturer, int year, int length)
        {
            this.ID = id;
            this.RegistrationNumber = registerNo;
            this.Manufacturer = manufacturer;
            this.ModelYear = year;
            this.Length = length;
        }
    }
}
