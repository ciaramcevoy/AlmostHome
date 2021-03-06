﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="AlmostHome.Pages.Admin.AdminRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
                    <asp:Label ID="lblSuccess" runat="server"></asp:Label>
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
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 ml-auto mr-auto">
                        <div class="card card-login">
                            <div class="card-header text-center">
                                <h4 class="card-title">Register Admin</h4>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">face</i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" TextMode="SingleLine" placeholder="Username" />
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername"
                                        CssClass="text-danger small" ErrorMessage="The Username field is required." />
                                </div>
                                <div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">lock_outline</i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Password" />
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                                        CssClass="text-danger small" ErrorMessage="The Password field is required." />
                                </div>
                                <div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">lock_outline</i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="Confirm Password" />
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword"
                                                                CssClass="text-danger small" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                    <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                                                          CssClass="text-danger small" Display="Dynamic" ErrorMessage="The Password and Confirmation password do not match." />
                                </div>
                            </div>
                            <div class="footer text-center mb-3">
                                <asp:Button runat="server" OnClick="Register" Text="Register" CssClass="btn btn-default" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
