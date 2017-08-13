<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdatePersonalDataForm.ascx.cs" Inherits="CPRG255.FinalProject.InlandMarina.UserControls.UpdatePersonalDataForm" %>
 
<table  style="color: #000000; font-family: verdana; border: 1px solid" class="auto-style1">
    <tr>
        <td colspan="2" style="text-align:center; height:30px; vertical-align:middle; background-color:#666666">
            <asp:Label ID="Label1" runat="server" Text="Update Personal Information" Font-Names="Calibri" Font-Size="X-Large" Font-Underline="True" ForeColor="White"></asp:Label>
        </td>
    </tr>
                <tr class="hoverMouse">
    <td style="width:150px; text-align:right">
        <br />
        First Name:</td>
    <td style="width:300px; text-align:center">
        <br />
      <asp:TextBox ID="uxFirstName" runat="server" Width="230px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="uxFirstName" ErrorMessage="First Name is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr class="hoverMouse">
    <td style="text-align:right">
        <br />
        Last Name:</td>
    <td style="text-align:center">
        <br />
      <asp:TextBox ID="uxLastName" runat="server" Width="230px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="uxLastName" ErrorMessage="Last Name is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr class="hoverMouse">
    <td style="text-align:right">
        <br />
        Phone:</td>
    <td style="text-align:center">
        <br />
      <asp:TextBox ID="uxPhone" runat="server" Width="230px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="uxPhone" ErrorMessage="Phone is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr class="hoverMouse">
    <td style="text-align:right">
        <br />
        City:</td>
    <td style="text-align:center">
        <br />
      <asp:TextBox ID="uxCity" runat="server" Width="230px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="uxCity" ErrorMessage="City is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
   <tr class="hoverMouse">
    <td style="width:150px; text-align:right">
        <br />
        Username:</td>
    <td style="width:300px; text-align:center">
        <br />
      <asp:TextBox ID="uxUsername" runat="server" Width="230px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="uxUsername" ErrorMessage="Username is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr class="hoverMouse">
    <td style="text-align:right">
        <br />
        Password:</td>
    <td style="text-align:center">
        <br />
      <asp:TextBox ID="uxPassword" runat="server" Width="230px" TextMode="Password"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ControlToValidate="uxPassword" ErrorMessage="uxPassword is Required Field" ForeColor="Red">*</asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr class="hoverMouse">
    <td style="text-align:right">
        <br />
        Confirm Password:</td>
    <td>
        <br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:TextBox ID="uxConfirmPass" runat="server" Width="230px" TextMode="Password"></asp:TextBox>
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
    <td colspan="2" style="text-align:center">
      <input id="Reset2" type="reset" value="Clear" />&nbsp;&nbsp;
        <asp:Button ID="uxUpdate" runat="server" Text="Update" OnClick="uxUpdate_Click" />
        <br />
        <br />
      </td>
  </tr>
  <tr>
    <td colspan="2">
      <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" />
    </td>
  </tr>         
     </table>