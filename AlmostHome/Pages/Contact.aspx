<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AlmostHome.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center" style="padding: 0 0;">
            <div class="row">
                <div class="card-body">
                    <h3 class="title">Contact Almost Home NI</h3>
                    <div class="row pb-3">
                    <asp:Panel ID="panelError" runat="server" Visible="False" CssClass="panel-center">
                        <div class="error-msg">
                            <i class="fa fa-times-circle"></i>
                            <asp:Label ID="lblError" runat="server"></asp:Label>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="panelSuccess" runat="server" Visible="False" CssClass="panel-center">
                        <div class="success-msg">
                            <i class="fa fa-check"></i>
                            <asp:Label ID="lblSuccess" runat="server"></asp:Label>
                        </div>
                    </asp:Panel>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <i class="material-icons">person</i>
                                    </span>
                                </div>
                                <asp:TextBox runat="server" ID="txtContactName" CssClass="form-control" TextMode="SingleLine" placeholder="Name" />
                            </div>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContactName"
                                CssClass="text-danger" ErrorMessage="Name is required." />
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <i class="material-icons">mail</i>
                                    </span>
                                </div>
                                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" placeholder="Email" />
                            </div>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                CssClass="text-danger" ErrorMessage="Email is required." />
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <i class="material-icons">phone</i>
                                    </span>
                                </div>
                                <asp:TextBox runat="server" ID="txtContactNumber" CssClass="form-control" TextMode="Number" placeholder="Contact Number" />
                            </div>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContactNumber"
                                CssClass="text-danger" ErrorMessage="Contact Number is required." />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <i class="material-icons">subject</i>
                                    </span>
                                </div>
                                <asp:TextBox runat="server" ID="txtSubject" CssClass="form-control" TextMode="SingleLine" placeholder="Subject" />

                            </div>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSubject"
                                CssClass="text-danger" ErrorMessage="Subject is required." />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="visibility: hidden">
                                        <i class="material-icons">message</i>
                                    </span>
                                </div>
                                <asp:TextBox runat="server" ID="txtMessage" CssClass="form-control" TextMode="MultiLine" placeholder="Message" Rows="10" />

                            </div>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMessage"
                                CssClass="text-danger" ErrorMessage="Message is required." />
                        </div>
                    </div>
                    <hr />
                    <div class="col-md-12">
                        <asp:Button runat="server" Text="Send Message" CssClass="btn btn-default" OnClick="SendContactUsEmail" />
                    </div>
                </div>
            </div>
        </div>
        <div class="section text-center">
            <div class="row">
                <div class="col-md-9">
                    <iframe width="100%" height="400" frameborder="0" style="border: 0" src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJR7FVWEP9YEgREEK9WBg4z4M&key=AIzaSyAr923H27qKCWJFpQ-p4MOPqQaKKoSwvT0" allowfullscreen></iframe>
                </div>
                <div class="col-md-3">
                    <address>
                        6 Grovehill Road<br />
                        Moira<br />
                        Craigavon, UK<br />
                        <br />
                        Phone: 07922921852<br />
                        <br />
                        Email: <a href="mailto:almosthomeadopt@gmail.com">almosthomeadopt@gmail.com</a>
                    </address>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



