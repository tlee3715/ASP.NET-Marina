using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPRG255.FinalProject.InlandMarina.InlandMarinaWcfService;
using CPRG255.FinalProject.Domain;
using System.Web.Security;

namespace CPRG255.FinalProject.InlandMarina
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void uxSubmit_Click(object sender, EventArgs e)
        {
            var proxy = new MarinaServiceClient();

            Customer customer = proxy.Authenticate(uxUsername.Text, uxPassword.Text);

            if (customer != null)
            {
                Session["CustID"] = customer.ID;
                Session["Customer"] = customer;
                FormsAuthentication.RedirectFromLoginPage(customer.FirstName + " " + customer.LastName, false);
            }
        }
    }
}