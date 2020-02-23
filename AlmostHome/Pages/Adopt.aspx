<%@ Page Title="Adopt your perfect pet" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Adopt.aspx.cs" Inherits="AlmostHome.Adopt" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center">
            <div class="row">
                <h3 class="title">Adopt your perfect pet</h3>
                <p class="text-left">Finding the pet that best suits your household can be difficult. Please fill out the form below to allow us to find your perfect pet. Using the below questions will complete a search to allow us to work out which of our available animals would fit in well with you.</p>
                <div class="form-row col-md-12">
                    <div class="form-group col-md-2">
                        <label for="ddlAnimalType">Animal Type</label>
                        <asp:DropDownList ID="ddlAnimalType" runat="server" class="form-control" DataTextField="AnimalType" DataValueField="AnimalType"></asp:DropDownList>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="ddlAnimalAge">Animal Age</label>
                        <asp:DropDownList ID="ddlAnimalAge" runat="server" class="form-control">
                            <asp:ListItem Value="1">0-3</asp:ListItem>
                            <asp:ListItem Value="2">3-6</asp:ListItem>
                            <asp:ListItem Value="3">6+</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="ddlChildren">Children</label>
                        <asp:DropDownList ID="ddlChildren" runat="server" class="form-control">
                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                            <asp:ListItem Value="No">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="ddlSecureGarden">Secure Garden</label>
                        <asp:DropDownList ID="ddlSecureGarden" runat="server" class="form-control">
                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                            <asp:ListItem Value="No">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="ddlOtherPets">Secure Garden</label>
                        <asp:DropDownList ID="ddlOtherPets" runat="server" class="form-control">
                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                            <asp:ListItem Value="No">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:Label runat="server" ID="LblSearchMessage"></asp:Label>
    <br />
    <asp:Button ID="SearchBtn" runat="server" OnClick="SearchAnimals" Text="Search" />



</asp:Content>
