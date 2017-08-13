<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBar.ascx.cs" Inherits="CPRG255.FinalProject.InlandMarina.UserControls.NavBar" %>
<table style="width:800px; height:40px">
    <tr>
        <td style="width:40px"></td>
        <td style="text-align:center; width:550px" class="auto-style1"> 
            <asp:Menu ID="Menu1" runat="server" DataSourceID="SiteMapDataSource1" ForeColor="Black" Orientation="Horizontal" StaticDisplayLevels="2" StaticSubMenuIndent="30px">
                <StaticHoverStyle Font-Bold="False" Font-Italic="True" Font-Underline="True" ForeColor="#990000" />
                <StaticSelectedStyle Font-Bold="True" ForeColor="Red" />
            </asp:Menu>
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
        </td>
        <td class="auto-style2" style="width:210px; text-align:center; border-left: 1px solid black"> 
        <asp:Label ID="uxWelcome" runat="server" Width="124px" Height="16px" ForeColor="#CC0000"></asp:Label>
        </td>
    </tr>
</table>