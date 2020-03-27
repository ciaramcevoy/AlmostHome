﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AnimalTypeSetup.aspx.cs" Inherits="AlmostHome.Pages.Admin.AnimalTypeSetup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <asp:Panel ID="panelSuccess" runat="server" Visible="False">
            <div class="alert alert-success">
                <div class="container">
                    <div class="alert-icon">
                        <i class="material-icons">check</i>
                    </div>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true"><i class="material-icons">clear</i></span>
                    </button>
                    <asp:Label ID="lblSuccess" runat="server" CssClass="lblSuccess"></asp:Label>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="panelError" runat="server" Visible="False">
            <div class="alert alert-danger">
                <div class="container">
                    <div class="alert-icon">
                        <i class="material-icons">error_outline</i>
                    </div>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true"><i class="material-icons">clear</i></span>
                    </button>
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </div>
            </div>
        </asp:Panel>
        <div class="section text-center" style="padding: 0 0;">
            <div class="row">
                <div class="col-md-4 card">
                    <div class="card-header">
                        <h4 class="card-title">Add New Animal Type</h4>
                    </div>
                    <div class="card-body">
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <i class="material-icons">pets</i>
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
                </div>
                <div class="col-md-8 card">
                    <div class="card-header">
                        <h4 class="card-title">List of Available Animal Types</h4>
                    </div>
                    <div class="card-body">
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
    </div>
</asp:Content>
