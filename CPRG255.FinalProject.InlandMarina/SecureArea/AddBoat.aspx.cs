using CPRG255.FinalProject.Domain;
using CPRG255.FinalProject.InlandMarina.InlandMarinaWcfService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CPRG255.FinalProject.InlandMarina.SecureArea
{
    public partial class BoatInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                for(int i = 2017; i >= 1970; i--)
                {
                    uxModelYear.Items.Add(i.ToString());
                }
            }
        }

        protected void uxSave_Click(object sender, EventArgs e)
        {
            try
            {
                uxMessage.Text = "";
                var proxy = new MarinaServiceClient();

                var registrationNo = uxRegistrationNo.Text;
                var manufacturer = uxManufacturer.Text;
                var modelYear = int.Parse(uxModelYear.SelectedItem.Text);
                var length = int.Parse(uxLength.Text);
                var customerID = ((Customer)Session["Customer"]).ID;

                proxy.AddBoat(registrationNo, manufacturer, modelYear, length, customerID);

                uxMessage.Text = "New boat added successfully for customer" + ((Customer)Session["Customer"]).FirstName + " " + ((Customer)Session["Customer"]).LastName + " !";
                ux2ndMessage.Text = "Boat: Registration No." + registrationNo + ", manufacturer: " + manufacturer + ", length: " + length.ToString() + " (year made: " + modelYear.ToString() + ")";
            }
            catch
            {
                uxMessage.Text = "Error ! Please Contact Administrator for more Information ! (Hint: Length has to be a number)";
            }
        }
    }
}