<%@ Page Title="Login" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CPRG255.FinalProject.InlandMarina.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
        .auto-style2 {
            width: 176px;
        }
        .auto-style3 {
            width: 174px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /> <br /><br /> <br /><br />
    <center>
 
  <table class="auto-style4">
    <tr>
        <th colspan="2" class="auto-style3" style="font-family: Verdana; font-size: large; background-color: #666666; color: white; border-left: 1px solid"> &nbsp;&nbsp; Login </th>
    </tr>
    <tr>
        <td style="width:150px; color: black; border-left:1px solid; text-align:left"> 
            <br />
            &nbsp;
            Username: </td>
        <td style="width:250px; text-align:left; border-right: 1px solid"> 
            <br />
            <asp:TextBox ID="uxUsername" runat="server" Width="200px"></asp:TextBox> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uxUsername" ErrorMessage="Username is required !" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td> 
    </tr>
    <tr>
        <td style="color: black; border-left:1px solid; text-align:left"> 
            <br />
            &nbsp;
            Password: </td>
        <td style="text-align:left; border-right: 1px solid">
            <br />
            <asp:TextBox ID="uxPassword" runat="server" TextMode="Password" CssClass="col-xs-offset-0" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="uxPassword" ErrorMessage="Password is required !" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:center; border-left:1px solid; border-bottom:1px solid; border-right: 1px solid">
            <br />
            <asp:Button ID="uxSubmit" runat="server" Text="Submit" OnClick="uxSubmit_Click" /> 
            &nbsp;&nbsp; &nbsp;<input id="Reset1" type="reset" value="Clear" />
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:left">
            <br />
            <asp:Label ID="uxMessage" runat="server" Width="390px" ForeColor="Red"></asp:Label>
        </td>
    </tr>
      <tr>
        <td colspan="2" style="text-align:left">
           <br /><asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red"></asp:ValidationSummary>
        </td>
    </tr>
      </table>
     </center>
</asp:Content>
