using CPRG255.FinalProject.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CPRG255.FinalProject.InlandMarina
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            uxWelcome.Text = Utilities.HomePageMessage();
        }
    }
}