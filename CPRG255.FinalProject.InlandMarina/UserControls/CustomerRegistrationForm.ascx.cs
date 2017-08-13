using CPRG255.FinalProject.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPRG255.FinalProject.InlandMarina.InlandMarinaWcfService;
using System.Web.Security;

namespace CPRG255.FinalProject.InlandMarina.UserControls
{
    public partial class CustomerRegistration : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if(Session["Customer"] == null)
            {
                var proxy = new MarinaServiceClient();

                var auth = new Authorize();
                auth.UserName = uxUsername.Text;
                auth.Password = uxPassword.Text;
                
                var customerID = proxy.AddCustomer(uxFirstName.Text, 
                                                   uxLastName.Text, 
                                                   uxPhone.Text, 
                                                   uxCity.Text); //persist Customer to database and get Customer ID

                var customerSessionData = new Customer(Convert.ToInt32(customerID),
                                                       uxFirstName.Text,
                                                       uxLastName.Text,
                                                       uxPhone.Text,
                                                       uxCity.Text,
                                                       auth);

                proxy.AddAuthorize(uxUsername.Text, uxPassword.Text, Convert.ToInt32(customerID));//persist Authorize data to database

                Session.Add("Customer", customerSessionData); //add to session
                Session.Add("CustID", customerID);//get ID for boat method

                FormsAuthentication.RedirectFromLoginPage(customerSessionData.FirstName + " " + customerSessionData.LastName, false);
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }
    }
}