<%@ Page Title="Adopt your perfect pet" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Adopt.aspx.cs" Inherits="AlmostHome.Adopt" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center row">
            <div class="col-md-12 card">
                <div class="card-header">
                    <h4 class="card-title">Adopt your perfect pet</h4>
                    <p class="category text-left">Finding the pet that best suits your household can be difficult. Please fill out the form below to allow us to find your perfect pet. Using the below questions will complete a search to allow us to work out which of our available animals would fit in well with you.</p>
                </div>

                <div class="card-body">
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
                                <asp:ListItem Value="True">Yes</asp:ListItem>
                                <asp:ListItem Value="False">No</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="ddlSecureGarden">Secure Garden</label>
                            <asp:DropDownList ID="ddlSecureGarden" runat="server" class="form-control">
                                <asp:ListItem Value="True">Yes</asp:ListItem>
                                <asp:ListItem Value="False">No</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="ddlOtherPets">Secure Garden</label>
                            <asp:DropDownList ID="ddlOtherPets" runat="server" class="form-control">
                                <asp:ListItem Value="True">Yes</asp:ListItem>
                                <asp:ListItem Value="False">No</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <asp:Button ID="SearchBtn" runat="server" OnClick="SearchAnimals" Text="Search" class="btn btn-default" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Panel ID="panelSearchResult" runat="server" Visible="False">
            <div class="text-center row">
                <div class="col-md-12 card">
                    <div class="card-header">
                        <h4 class="card-title">Search Result</h4>
                    </div>
                    <div class="card-body">
                        <asp:Panel ID="panelWarn" runat="server" Visible="False">
                            <div class="warning-msg">
                                <i class="fa fa-warning"></i>
                                <asp:Label ID="lblWarn" runat="server"></asp:Label>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="panelError" runat="server" Visible="False">
                            <div class="error-msg">
                                <i class="fa fa-times-circle"></i>
                                <asp:Label ID="lblError" runat="server"></asp:Label>
                            </div>
                        </asp:Panel>
                        <asp:ListView ID="lstSearchResult" runat="server">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div class="col-md-3 float-left">
                                    <div class="card">
                                        <div class="card-header-animal">
                                            <div class="card-text">
                                                <h4 class="card-title"><%#Eval("AnimalName")%></h4>
                                            </div>
                                        </div>
                                        <div class="card-body">

                                            <img alt="" src="/images/ImageAnimals/<%#Eval("ImageUrl")%>" height="75" width="75" />
                                            <div class="mt-1">
                                                <p>Age: <%#Eval("AnimalAge")%></p>
                                                <p>Children: <%#Eval("Children").ToString() == "True" ? "Yes" : "No" %></p>
                                                <p>Secure Garden: <%#Eval("SecureGarden").ToString() == "True" ? "Yes" : "No"%></p>
                                                <p>Other Pets: <%#Eval("OtherPets").ToString() == "True" ? "Yes" : "No"%></p>
                                            </div>
                                            <button class="btn btn-default btn-sm btn-round" onclick="location.href = '/Pages/AdoptForm?id=<%#Eval("AnimalID")%>';" type="button">
                                                <i class="material-icons">favorite</i> Adopt Me
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
