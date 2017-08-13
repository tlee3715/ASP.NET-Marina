<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegistrationForm.ascx.cs" Inherits="CPRG255.FinalProject.InlandMarina.UserControls.CustomerRegistration" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<style type="text/css">
    .auto-style1 {
        width: 400px;
    }
</style>
<asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" HeaderText="Customer Registration" BackColor="#E6E2D8" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" OnFinishButtonClick="Wizard1_FinishButtonClick">
    <HeaderStyle BackColor="#666666" BorderColor="#E6E2D8" BorderStyle="Solid" Font-Bold="True" Font-Names="Calibri" Font-Size="Large" Font-Underline="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" BorderWidth="2px" />
    <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
    <SideBarButtonStyle ForeColor="White" />
    <SideBarStyle BackColor="#1C5E55" Font-Size="0.9em" VerticalAlign="Top" />
    <StepStyle BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="2px" />
    <WizardSteps>
        <asp:WizardStep ID="WizardStep1" runat="server" Title="Personal Information">
           <br /> <!-- Wizard Step 1: Personal Information -->
            <table  style="color: #000000; font-family: verdana" class="auto-style1">
                <tr>
    <td style="width:150px">First Name:</td>
    <td style="width:300px">
      <asp:TextBox ID="uxFirstName" runat="server" Width="250px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="uxFirstName" ErrorMessage="First Name is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>
        <br />
        Last Name:</td>
    <td>
        <br />
      <asp:TextBox ID="uxLastName" runat="server" Width="250px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="uxLastName" ErrorMessage="Last Name is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>
        <br />
        Phone:</td>
    <td>
        <br />
      <asp:TextBox ID="uxPhone" runat="server" Width="250px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="uxPhone" ErrorMessage="Phone is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>
        <br />
        City:</td>
    <td>
        <br />
      <asp:TextBox ID="uxCity" runat="server" Width="250px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="uxCity" ErrorMessage="City is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td colspan="2" style="text-align:left">
        <br />
      <input id="Reset1" type="reset" value="Clear" /><br />
        <br />
      </td>
  </tr>
  <tr>
    <td colspan="2">
      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    </td>
  </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep2" runat="server" Title="Login Information">
             <br /> <!-- Wizard Step 2: Authenticate Information -->
            <table  style="color: #333300; font-family: verdana" class="auto-style1">
                <tr>
    <td style="width:150px">Username:</td>
    <td style="width:300px">
      <asp:TextBox ID="uxUsername" runat="server" Width="250px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="uxUsername" ErrorMessage="Username is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>
        <br />
        <br />
        Password:</td>
    <td>
        <br />
        <br />
      <asp:TextBox ID="uxPassword" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
    <ajaxToolkit:PasswordStrength ID="uxPassword_PasswordStrength" runat="server" BehaviorID="uxPassword_PasswordStrength" DisplayPosition="AboveLeft" MinimumLowerCaseCharacters="3" PreferredPasswordLength="8" PrefixText="Password strength: " TargetControlID="uxPassword" TextCssClass="passStrength" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ControlToValidate="uxPassword" ErrorMessage="uxPassword is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td>
        <br />
        Confirm Password:</td>
    <td>
        <br />
      <asp:TextBox ID="uxConfirmPass" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ControlToValidate="uxConfirmPass" ErrorMessage="Confirm Password is Required Field" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirm Password and Password must be identical" ControlToCompare="uxPassword" ControlToValidate="uxConfirmPass" Display="Dynamic" ForeColor="Red">*</asp:CompareValidator>
    </td>
  </tr>
  <tr>
    <td>
        <br />
    </td>
    <td>
        <br />
     
    </td>
  </tr>
  <tr>
    <td colspan="2" style="text-align:left">
        <br />
      <input id="Reset2" type="reset" value="Clear" /><br />
        <br />
      </td>
  </tr>
  <tr>
    <td colspan="2">
      <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" />
    </td>
  </tr>
            </table>
        </asp:WizardStep>
    </WizardSteps>
</asp:Wizard>


        