using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace CPRG255.FinalProject.Domain
{
    [DataContract]
    public class Slip
    {
        [DataMember]
        public int ID { get; set; }
        [DataMember]
        public int Width { get; set; }
        [DataMember]
        public int Length { get; set; }
        [DataMember]
        public int DockID { get; set; }

        //[DataMember]
        //public string Display => $"Width: {Width}, Length: {Length}";
    }
}
