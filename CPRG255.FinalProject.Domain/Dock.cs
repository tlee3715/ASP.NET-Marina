using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace CPRG255.FinalProject.Domain
{
    [DataContract]
    public class Dock
    {
        [DataMember]
        public int ID { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public int LocationId { get; set; }
        [DataMember]
        public bool WaterService { get; set; }
        [DataMember]
        public bool ElectricalService { get; set; }

        public Dock() { }
    }
}
