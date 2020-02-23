<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AnimalDatabase.aspx.cs" Inherits="AlmostHome.Pages.AnimalDatabase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Animal Database</h2>
  
        <asp:GridView ID="GridAnimalDb" runat="server" AutoGenerateColumns="False" CssClass="Grid" Width="100%">
            <Columns>
                <asp:BoundField DataField="AnimalType" HeaderText="Type" SortExpression="AnimalType" />
                <asp:BoundField DataField="AnimalName" HeaderText="Name" SortExpression="AnimalName" />
                <asp:BoundField DataField="AnimalAge" HeaderText="Age" SortExpression="AnimalAge" />
                <asp:BoundField DataField="Children" HeaderText="Children" SortExpression="Children" />
                <asp:BoundField DataField="SecureGarden" HeaderText="Secure Garden" SortExpression="SecureGarden" />
                <asp:BoundField DataField="OtherPets" HeaderText="Other Pets" SortExpression="OtherPets" />
                <asp:ImageField DataImageUrlField="ImageUrl" ControlStyle-Width="100" ControlStyle-Height="100" ItemStyle-Width="50px">
                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                </asp:ImageField>
            </Columns>
        </asp:GridView>


</asp:Content>
