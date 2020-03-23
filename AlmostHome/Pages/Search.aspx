<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="AlmostHome.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center row" style="padding: 0 0;">
            <div class="col-md-12 card">
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
        <asp:Panel ID="panelSearchResult" runat="server">
            <div class="text-center row">
                <div class="col-md-12 card">
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
                        <ul class="pagination">
                            <asp:Repeater ID="rptPager" runat="server">
                                <ItemTemplate>
                                    <li runat="server" class='<%# Convert.ToBoolean(Eval("Enabled")) ? "page-item" : "page-item active" %>'>
                                        <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                                            CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled page-link" : "page_disabled page-link" %>'
                                            OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <div class="row">
                            <asp:ListView ID="lstSearchResult" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-3 float-left">
                                        <div class="card">
                                            <div class="card-header-animal">
                                                <div class="card-text">
                                                    <h4 class="card-title"><%#Eval("AnimalName")%></h4>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <img alt="" src="/images/ImageAnimals/<%# Eval("ImageUrl").ToString()==""? "default.png" : Eval("ImageUrl") %>" height="75" width="75" />
                                                <div class="mt-1">
                                                    <p>Age: <%#Eval("AnimalAge")%></p>
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
            </div>
        </asp:Panel>
    </div>
</asp:Content>
