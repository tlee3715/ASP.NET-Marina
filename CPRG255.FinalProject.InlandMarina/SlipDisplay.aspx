<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SlipDisplay.aspx.cs" Inherits="CPRG255.FinalProject.InlandMarina.SlipDisplay" %>

<%@ Register Src="~/UserControls/SlipDisplayUC.ascx" TagPrefix="uc1" TagName="SlipDisplayUC" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <br /><br /><br />
        <uc1:SlipDisplayUC runat="server" id="SlipDisplayUC" />
    </center>
</asp:Content>
