using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPRG255.FinalProject.Domain;

namespace CPRG255.FinalProject.InlandMarina.UserControls
{
    public partial class TopMessage : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            uxTopMessage.Text = Utilities.TopMessage();
        }
    }
}