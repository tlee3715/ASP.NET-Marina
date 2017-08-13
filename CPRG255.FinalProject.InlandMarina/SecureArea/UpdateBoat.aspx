<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UpdateBoat.aspx.cs" Inherits="CPRG255.FinalProject.InlandMarina.SecureArea.UpdateBoat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br /><br />
    <div  style="position:relative; left:60px">
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="299px" Width="576px" HeaderText="Edit Your Boat(s) " EmptyDataText="N/A" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="false"/>
                <asp:BoundField DataField="RegistrationNumber" HeaderText="Registration Number" SortExpression="RegistrationNumber" />
                <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
                <asp:BoundField DataField="ModelYear" HeaderText="Model Year" SortExpression="ModelYear" />
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" SortExpression="CustomerID" ReadOnly="true" InsertVisible="False" visible="false"/>
                <asp:CommandField ShowEditButton="True" UpdateText="Update Boat" >
                <FooterStyle HorizontalAlign="Center" />
                </asp:CommandField>
            </Fields>
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <PagerSettings PageButtonCount="6" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:DetailsView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InlandMarinaConnectionString %>" DeleteCommand="DELETE FROM [Boat] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Boat] ([RegistrationNumber], [Manufacturer], [ModelYear], [Length], [CustomerID]) VALUES (@RegistrationNumber, @Manufacturer, @ModelYear, @Length, @CustomerID)" SelectCommand="SELECT * FROM [Boat] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Boat] SET [RegistrationNumber] = @RegistrationNumber, [Manufacturer] = @Manufacturer, [ModelYear] = @ModelYear, [Length] = @Length WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RegistrationNumber" Type="String" />
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ModelYear" Type="Int32" />
                <asp:Parameter Name="Length" Type="Int32" />
                <asp:Parameter Name="CustomerID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="CustomerID" SessionField="CustID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="RegistrationNumber" Type="String" />
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ModelYear" Type="Int32" />
                <asp:Parameter Name="Length" Type="Int32" />
                <asp:Parameter Name="CustomerID" Type="Int32" /> 
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        


        <br />
         </div> 
</asp:Content>
