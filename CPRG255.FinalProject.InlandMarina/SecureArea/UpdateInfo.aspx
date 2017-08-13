<%@ Page Title="Update Personal Info" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UpdateInfo.aspx.cs" Inherits="CPRG255.FinalProject.InlandMarina.SecureArea.UpdateInfo" %>

<%@ Register Src="~/UserControls/UpdatePersonalDataForm.ascx" TagPrefix="uc1" TagName="UpdatePersonalDataForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <center>
        <uc1:UpdatePersonalDataForm runat="server" id="UpdatePersonalDataForm" />
    </center>
</asp:Content>
