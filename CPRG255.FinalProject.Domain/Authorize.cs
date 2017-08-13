using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace CPRG255.FinalProject.Domain
{
    [DataContract]
    public class Authorize
    {
        [DataMember]
        public int ID { get; set; }
        [DataMember]
        public string UserName { get; set; }
        [DataMember]
        public string Password { get; set; }
        [DataMember]
        public Customer Customer { get; set; }

        public Authorize() { }

        public Authorize(int id, string username, string password)
        {
            this.ID = id;
            this.UserName = username;
            this.Password = password;
        }
    }
}
