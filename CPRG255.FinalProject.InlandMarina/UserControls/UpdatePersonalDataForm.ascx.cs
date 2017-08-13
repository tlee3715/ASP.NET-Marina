using CPRG255.FinalProject.Domain;
using CPRG255.FinalProject.InlandMarina.InlandMarinaWcfService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CPRG255.FinalProject.InlandMarina.UserControls
{
    public partial class UpdatePersonalDataForm : System.Web.UI.UserControl
    {
        private Customer _customer = null;

        public Customer customer { get { return _customer; } set { _customer = value; } }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["Customer"] != null)
            {
                customer = (Customer)Session["Customer"];
            }

            if (customer != null)
            {
                uxFirstName.Text = customer.FirstName;
                uxLastName.Text = customer.LastName;
                uxPhone.Text = customer.Phone;
                uxCity.Text = customer.City;

                uxUsername.Text = customer.Authorize.UserName;
                uxPassword.Text = customer.Authorize.Password;
            }
        }

        protected void uxUpdate_Click(object sender, EventArgs e)
        {
            if (Session["Customer"] != null)
            {
                var proxy = new MarinaServiceClient();

                proxy.UpdateCustomer(((Customer)(Session["Customer"])).ID,
                                     uxFirstName.Text,
                                     uxLastName.Text,
                                     uxPhone.Text,
                                     uxCity.Text);//update Customer database

                proxy.UpdateAuthorize(uxUsername.Text,
                                      uxPassword.Text,
                                      ((Customer)(Session["Customer"])).ID);//update associated Customer Authorize data in database 

                Customer cust = (Customer)Session["Customer"];
                cust.FirstName = uxFirstName.Text;
                cust.LastName = uxLastName.Text;
                cust.Phone = uxPhone.Text;
                cust.City = uxCity.Text;
                cust.Authorize.UserName = uxUsername.Text;
                cust.Authorize.Password = uxPassword.Text;

                Session["Customer"] = cust;
                FormsAuthentication.RedirectFromLoginPage(cust.FirstName + " " + cust.LastName, false);
            }
        }
    }
}