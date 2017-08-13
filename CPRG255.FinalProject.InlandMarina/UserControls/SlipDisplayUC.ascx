<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SlipDisplayUC.ascx.cs" Inherits="CPRG255.FinalProject.InlandMarina.UserControls.SlipDisplay" %>
<style type="text/css">
    .auto-style1 {
        margin-right: 1px;
    }
    .grid td, .grid th{
  text-align:center;
}
</style>
<table style="width:400px">
    <tr>
        <td colspan="2" style="text-align:center">
            
            <asp:Label ID="Label3" runat="server" Font-Size="Larger" ForeColor="#0066CC" Text="Slip Information By Location and Dock"></asp:Label>
            
        </td>
    </tr>
    <tr>
        <td colspan="2" style="height:50px"></td>
    </tr>
    <tr>
        <td style="vertical-align: bottom;">
            <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Height="24px" Text="Select Location:" ForeColor="#0066CC"></asp:Label>
        </td>
        <td style="vertical-align: bottom;">          
            
            <asp:DropDownList ID="uxLocations" runat="server" AutoPostBack="True" DataSourceID="LocationDataSource1" DataTextField="Name" DataValueField="ID" Width="250px">
            </asp:DropDownList>
            
        </td>
    </tr>
    <tr>
        <td colspan="2"></td>
    </tr>
    <tr>
        <td style="vertical-align: bottom;">
            <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Height="24px" Text="Select Dock:" ForeColor="#0066CC"></asp:Label>
        </td>
        <td style="vertical-align: bottom;">      
            
            <asp:DropDownList ID="uxDocks" runat="server" AutoPostBack="True" DataSourceID="DockDataSource1" DataTextField="Name" DataValueField="ID" Width="250px">
            </asp:DropDownList>
            
        </td>
    </tr>
     <tr>
        <td colspan="2"></td>
    </tr>
     <tr>
        <td colspan="2" style="height:50px">
            <asp:Label ID="Label4" runat="server" Font-Names="Verdana" Height="24px" Text="Slips:" ForeColor="#0066CC"></asp:Label>
         </td>
    </tr>
    <tr>
        <td colspan="2">

            <asp:GridView ID="uxSlips" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style1 grid" DataSourceID="SlipDataSource1" ForeColor="#333333" GridLines="None" PageSize="8" Width="450px" EnableSortingAndPagingCallbacks="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" VerticalAlign="Middle" />
                <Columns>
                    <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" >
                    </asp:BoundField>
                    <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" >
                    </asp:BoundField>
                    <asp:BoundField DataField="DockID" HeaderText="Dock ID" SortExpression="DockID" />
                </Columns>
                <EditRowStyle BackColor="#999999" HorizontalAlign="Center" VerticalAlign="Middle" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="#FF3300" HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="3" Position="Top" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Font-Italic="True" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

        </td>
    </tr>
</table>
<asp:ObjectDataSource ID="LocationDataSource1" runat="server" SelectMethod="GetLocations" TypeName="CPRG255.FinalProject.InlandMarina.InlandMarinaWcfService.MarinaServiceClient"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="DockDataSource1" runat="server" SelectMethod="GetDocksByLocationId" TypeName="CPRG255.FinalProject.InlandMarina.InlandMarinaWcfService.MarinaServiceClient">
    <SelectParameters>
        <asp:ControlParameter ControlID="uxLocations" DefaultValue="1" Name="id" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="SlipDataSource1" runat="server" SelectMethod="GetAvailableSlipsByDockId" TypeName="CPRG255.FinalProject.InlandMarina.InlandMarinaWcfService.MarinaServiceClient">
    <SelectParameters>
        <asp:ControlParameter ControlID="uxDocks" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
