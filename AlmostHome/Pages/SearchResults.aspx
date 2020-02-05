<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="AlmostHome.Pages.SearchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div style="text-align: center">
        <asp:GridView ID="GridViewResult" runat="server" AutoGenerateColumns="False" CssClass="Grid" >
            <Columns>
                <asp:BoundField DataField="AnimalType" HeaderText="Animal Type" SortExpression="AnimalType" />
                <asp:BoundField DataField="AnimalName" HeaderText="Animal Name" SortExpression="AnimalName" />
                <asp:BoundField DataField="AnimalAge" HeaderText="Animal Age" SortExpression="AnimalAge" />
                <asp:ImageField DataImageUrlField="ImageUrl" ControlStyle-Width="100" ControlStyle-Height = "100" ItemStyle-Width="50px">
                    
<ControlStyle Height="100px" Width="100px"></ControlStyle>

<ItemStyle Width="50px"></ItemStyle>
                    
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [AnimalType], [AnimalName], [AnimalAge], [Children], [SecureGarden], [OtherPets] FROM [Animal]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
        <br />
    </form>
</asp:Content>

