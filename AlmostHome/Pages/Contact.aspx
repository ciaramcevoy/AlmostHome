<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AlmostHome.Contact" %>

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
        <img src="/images/contact-banner.gif" class="d-block ml-auto mr-auto"/>
        <div class="section text-center" style="padding: 0 0;">
            <div class="row shadow">
                <div class="card-body">
                    <h3 class="title">Contact Almost Home NI</h3>
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
            <div class="row shadow">
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
    
    <script type="text/javascript">
        function Redirect(url) {
            var html =
                '<div id="dvCountDown" style="display:none;font-size:small;">You will be redirected after <span id="lblCount"></span>&nbsp;seconds.</div>';
            $('.lblSuccess').append(html);
            var seconds = 5;
            var dvCountDown = document.getElementById("dvCountDown");
            var lblCount = document.getElementById("lblCount");
            dvCountDown.style.display = "block";
            lblCount.innerHTML = seconds;
            setInterval(function () {
                seconds--;
                lblCount.innerHTML = seconds;
                if (seconds == 0) {
                    window.location = url;
                }
            }, 1000);
        }
    </script>
</asp:Content>



