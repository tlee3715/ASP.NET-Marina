<%@ Page Title="Boat Data" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddBoat.aspx.cs" Inherits="CPRG255.FinalProject.InlandMarina.SecureArea.BoatInfo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /> <br /> <br />
     
    <div style="position:relative; left:80px">
         <table style="color: #000000; font-family: verdana; border: 1px solid" class="auto-style3">
     <tr>
         <td colspan ="2" style="text-align:center;vertical-align:middle; background-color:#666666" class="auto-style1"> 
             <asp:Label ID="Label1" runat="server" Text="Add Your Boat" Font-Names="Calibri" Font-Size="X-Large" Font-Underline="True" ForeColor="White"></asp:Label>
         </td>
     </tr>
                <tr>
         <td style="vertical-align:top"> 
             <br />
             &nbsp;&nbsp;Registration Number: </td> 
         <td> 
             <br />
             <asp:TextBox ID="uxRegistrationNo" runat="server" Width="250px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Registration Number is Required !" ForeColor="Red" ControlToValidate="uxRegistrationNo">*</asp:RequiredFieldValidator>
             <br />
         </td>
     </tr>
             <tr>
                  <td style="vertical-align:top"> 
                      <br />
                      &nbsp;&nbsp;Manufacturer: </td> 
                 <td>
                     <br />
                     <asp:TextBox ID="uxManufacturer" runat="server" Width="250px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Manufacturer Name is Required !" ForeColor="Red" ControlToValidate="uxManufacturer">*</asp:RequiredFieldValidator>
                     <br />
                 </td>
             </tr>
     <tr>
         <td style="width:200px"> 
             <br />
             &nbsp;&nbsp;Model Year: </td> 
         <td style="width:350px"> 
             <br />
             <asp:DropDownList ID="uxModelYear" runat="server" Height="25px" Width="134px">
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Model Year is Required !" ForeColor="Red" ControlToValidate="uxModelYear">*</asp:RequiredFieldValidator>
             <br />
         </td>
     </tr>       
     <tr>
         <td> 
             <br />
             &nbsp;&nbsp;Length: </td> 
         <td>            
             <br />
             <asp:TextBox ID="uxLength" runat="server" Width="125px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Boat Length is Required !" ForeColor="Red" ControlToValidate="uxLength">*</asp:RequiredFieldValidator>
             <br />          
         </td>
     </tr>
  
     <tr>
         <td colspan="2" style="text-align:center"> 
             <br />
             <asp:Button ID="uxSave" runat="server" OnClick="uxSave_Click" Text="Add" />
             <br />
             <br />
         </td>
     </tr>
             <tr>
                 <td colspan="2" style="text-align:left">
                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                 </td>
             </tr>
 </table>
    <asp:Label ID="uxMessage" runat="server" Font-Names="Calibri" Font-Size="Medium" ForeColor="#6600FF"></asp:Label>
         <br />
    <asp:Label ID="ux2ndMessage" runat="server" Font-Names="Calibri" Font-Size="Medium" ForeColor="#6600FF"></asp:Label>
         <br />
         <br />
    <asp:Label ID="uxMessage0" runat="server" Font-Names="Calibri" Font-Size="Medium" ForeColor="#6600FF">(Hint: You can edit your boat info on the &quot;Update boat&quot; page)</asp:Label>
         <br />
         <br />
        </div>
    
    </asp:Content>
