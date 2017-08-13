<%@ Page Title="Lease a Slip" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LeaseSlip.aspx.cs" Inherits="CPRG255.FinalProject.InlandMarina.SecureArea.LeaseSlip" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /> <br /> <br /> <br />
    <div style="position:relative; left:80px">
         <table style="color: #000000; font-family: verdana; border: 1px solid" class="auto-style3">
     <tr>
         <td colspan ="2" style="text-align:center;vertical-align:middle; background-color:#00BFFF" class="auto-style1"> 
             <asp:Label ID="Label1" runat="server" Text="Lease" Font-Names="Calibri" Font-Size="X-Large" Font-Underline="True" ForeColor="White"></asp:Label>
         </td>
     </tr>
                <tr>
         <td style="vertical-align:top"> 
             <br />
             &nbsp;&nbsp;Select Start Date: </td> 
         <td> 
             <br />
             <asp:TextBox ID="uxStartDate" runat="server"></asp:TextBox>           
             <ajaxToolkit:CalendarExtender ID="uxStartDate_CalendarExtender" runat="server" BehaviorID="uxStartDate_CalendarExtender" TargetControlID="uxStartDate">
             </ajaxToolkit:CalendarExtender>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Start Date is Required  !" ForeColor="Red" ControlToValidate="uxStartDate">*</asp:RequiredFieldValidator>
         </td>
     </tr>
             <tr>
                  <td style="vertical-align:top"> 
                      <br />
                      &nbsp;&nbsp;Select End Date: </td> 
                 <td>
                     <br />
             <asp:TextBox ID="uxEndDate" runat="server"></asp:TextBox>           
                     <ajaxToolkit:CalendarExtender ID="uxEndDate_CalendarExtender" runat="server" BehaviorID="uxEndDate_CalendarExtender" TargetControlID="uxEndDate" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="End Date is Required  !" ForeColor="Red" ControlToValidate="uxEndDate">*</asp:RequiredFieldValidator>
                 </td>
             </tr>
     <tr>
         <td style="width:200px"> 
             <br />
             &nbsp;&nbsp;Slip ID: </td> 
         <td style="width:350px"> 
             <br />
             <asp:DropDownList ID="uxSlip" runat="server" Width="300px" DataSourceID="uxSlips" DataTextField="ID" DataValueField="ID" Height="25px">
             </asp:DropDownList>
         </td>
     </tr>       
     <tr>
         <td> 
             <br />
             &nbsp;&nbsp;Lease Type: </td> 
         <td>            
             <br />          
             <asp:DropDownList ID="uxLeaseType" runat="server" Height="25px" Width="300px" DataSourceID="uxLeaseTypes" DataTextField="Name" DataValueField="ID">
             </asp:DropDownList>           
         </td>
     </tr>
  
     <tr>
         <td colspan="2" style="text-align:center"> 
             <br />
             <asp:Button ID="uxSave" runat="server" OnClick="uxSave_Click" Text="Save Lease" />
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
    </div>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="uxMessage" runat="server" Font-Names="Calibri" Font-Size="Medium" ForeColor="#6600FF"></asp:Label>
    <asp:ObjectDataSource ID="uxSlips" runat="server" SelectMethod="GetAllSlips" TypeName="CPRG255.FinalProject.InlandMarina.InlandMarinaWcfService.MarinaServiceClient"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="uxLeaseTypes" runat="server" SelectMethod="GetLeaseTypes" TypeName="CPRG255.FinalProject.InlandMarina.InlandMarinaWcfService.MarinaServiceClient"></asp:ObjectDataSource>
    </asp:Content>
