using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace CPRG255.FinalProject.Domain
{
    [DataContract]
    public class Lease
    {
        [DataMember]
        public int ID { get; set; }
        [DataMember]
        public DateTime StartDate { get; set; }
        [DataMember]
        public DateTime EndDate { get; set; }
        [DataMember]
        public int SlipID { get; set; }
        [DataMember]
        public int CustomerID { get; set; }
        [DataMember]
        public int LeaseTypeID { get; set; }
    }
}
