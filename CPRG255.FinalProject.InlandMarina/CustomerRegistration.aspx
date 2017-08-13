<%@ Page Title="Register" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="CPRG255.FinalProject.InlandMarina.CustomerRegistration" %>

<%@ Register Src="~/UserControls/CustomerRegistrationForm.ascx" TagPrefix="uc1" TagName="CustomerRegistrationForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br /><br /><br /><br />
    <center>
        <uc1:CustomerRegistrationForm runat="server" id="CustomerRegistrationForm" />
      </center>    
</asp:Content>
