<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AnimalTypeSetup.aspx.cs" Inherits="AlmostHome.Pages.Admin.AnimalTypeSetup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center">
            <div class="row">
                <div class="col-md-6">
                    <div class="col-md-12 mb-3">
                        <asp:Panel ID="panelError" runat="server" Visible="False">
                            <div class="error-msg">
                                <i class="fa fa-times-circle"></i>
                                <asp:Label ID="lblError" runat="server"></asp:Label>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="panelSuccess" runat="server" Visible="False">
                            <div class="success-msg">
                                <i class="fa fa-check"></i>
                                <asp:Label ID="lblSuccess" runat="server"></asp:Label>
                            </div>
                        </asp:Panel>
                    </div>

                    <div class="col-md-12">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="material-icons">face</i>
                                </span>
                            </div>
                            <asp:TextBox ID="txtAnimalType" runat="server" CssClass="form-control" placeholder="Animal Type" />
                        </div>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorType" runat="server"
                            ControlToValidate="txtAnimalType" ErrorMessage="The Animal Type field is required."
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-md-12">
                        <asp:Button ID="btnSaveAnimalType" runat="server" OnClick="SaveAnimalType" Text="Save" CssClass="btn btn-default" />
                    </div>
                </div>

                <div class="col-md-6">
                    <h5 class="title">List of Available Animal Types</h5>
                    <div class="ml-10 text-left">
                        <ol class="list list-view-filter">
                            <asp:ListView ID="lstType" runat="server">
                                <LayoutTemplate>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <li><%#Eval("Type")%></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
