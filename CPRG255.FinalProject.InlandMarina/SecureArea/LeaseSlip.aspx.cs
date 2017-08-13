using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPRG255.FinalProject.InlandMarina.InlandMarinaWcfService;
using CPRG255.FinalProject.Domain;

namespace CPRG255.FinalProject.InlandMarina.SecureArea
{
    public partial class LeaseSlip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            uxSlip.ToolTip = "Slip 1000 - 1009 : Width = 8 , Length = 16" + Environment.NewLine
                           + "Slip 1010 - 1019 : Width = 8 , Length = 18" + Environment.NewLine
                           + "Slip 1020 - 1029 : Width = 8 , Length = 20" + Environment.NewLine
                           + "Slip 1030 - 1039 : Width = 10 , Length = 22" + Environment.NewLine
                           + "Slip 1040 - 1049 : Width = 10 , Length = 24" + Environment.NewLine
                           + "Slip 1050 - 1059 : Width = 8 , Length = 16" + Environment.NewLine
                           + "Slip 1060 - 1069 : Width = 8 , Length = 18" + Environment.NewLine
                           + "Slip 1070 - 1079 : Width = 8 , Length = 20" + Environment.NewLine
                           + "Slip 1080 - 1089 : Width = 10 , Length = 22" + Environment.NewLine
                           + "Slip 1090 - 1099 : Width = 10 , Length = 24" + Environment.NewLine
                           + "Slip 1100 - 1109 : Width = 10 , Length = 26" + Environment.NewLine
                           + "Slip 1110 - 1123 : Width = 10 , Length = 22" + Environment.NewLine
                           + "Slip 1124 - 1139 : Width = 10 , Length = 24" + Environment.NewLine
                           + "Slip 1140 - 1149 : Width = 12 , Length = 28" + Environment.NewLine;
        }

        protected void uxSave_Click(object sender, EventArgs e)
        {
            try
            {
                uxMessage.Text = "";
                var proxy = new MarinaServiceClient();

                var startDate = Convert.ToDateTime(uxStartDate.Text);
                var endDate = Convert.ToDateTime(uxEndDate.Text);
                var slip = int.Parse(uxSlip.SelectedItem.Value);
                var customerID = ((Customer)Session["Customer"]).ID;
                var leaseType = int.Parse(uxLeaseType.SelectedItem.Value);

                proxy.AddLease(startDate, endDate, slip, customerID, leaseType);

                uxMessage.Text = "Lease ID " + slip.ToString() + " Added Successfully For Customer " + ((Customer)Session["Customer"]).FirstName + " " + ((Customer)Session["Customer"]).LastName + " !";
            }
            catch
            {
                uxMessage.Text = "Error ! Please Contact Administrator for more Information !";
            }           
        }
    }
}