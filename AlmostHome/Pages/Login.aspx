<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AlmostHome.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center">
            <%--style="background-image: url('Content/images/login-bg.jpg');"--%>
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 ml-auto mr-auto">
                        <div class="card card-login">
                            <div class="card-header text-center">
                                <h4 class="card-title">Admin Login</h4>
                            </div>
                            <div class="card-body">
                                <asp:Panel ID="panelError" runat="server" Visible="False">
                                    <div class="error-msg">
                                        <i class="fa fa-times-circle"></i>
                                        <asp:Label ID="lblError" runat="server"></asp:Label>
                                    </div>
                                </asp:Panel>
                               
                                <div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">face</i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" />
                                    </div>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server"
                                        ControlToValidate="txtUsername" ErrorMessage="Please Enter Your Username"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server"
                                        ControlToValidate="txtPassword" ErrorMessage="Please Enter Your Password"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <div class="footer text-center mb-3">
                                <asp:Button ID="LoginBtn" runat="server" OnClick="LoginBtn_Click" Text="Login" CssClass="btn btn-default" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

