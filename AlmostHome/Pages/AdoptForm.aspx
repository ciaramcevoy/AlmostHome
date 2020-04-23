<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AdoptForm.aspx.cs" Inherits="AlmostHome.Pages.AdoptForm" %>

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
                <div class="col-md-6 card ml-auto mr-auto">
                    <div class="card-header">
                        <h4 class="card-title">Applicant Details</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="txtApplicantName" style="position: static;">Applicant Name</label>
                            <asp:TextBox ID="txtApplicantName" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorApplicantName" runat="server"
                                ControlToValidate="txtApplicantName" ErrorMessage="The Applicant Name field is required."
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtContactNumber" style="position: static;">Contact Number</label>
                            <asp:TextBox ID="txtContactNumber" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please enter a valid Contact Number." CssClass="text-danger" Display="Dynamic" ClientValidationFunction="ValidateContactNumberClient" EnableClientScript="True"></asp:CustomValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtEmailAddress" style="position: static;">Email Address</label>
                            <asp:TextBox ID="txtEmailAddress" runat="server" class="form-control" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmailAddress" runat="server"
                                ControlToValidate="txtEmailAddress" ErrorMessage="The Email Address field is required."
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <asp:HiddenField ID="hdnAnimalID" runat="server" Value="0" />
                    </div>
                </div>
                <div class="col-md-6 card ml-auto mr-auto">
                    <div class="card-header">
                        <h4 class="card-title">Animal Details</h4>
                    </div>
                    <div class="card-body">

                        <asp:Image ID="animalImage" runat="server" Width="200" Height="200" />
                        <p>
                            Name:
                            <asp:Label ID="lblAnimalName" runat="server"></asp:Label>
                        </p>
                        <p>
                            Age:
                            <asp:Label ID="lblAnimalAge" runat="server"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>


            <div class="row">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Application" class="btn btn-default ml-auto mr-auto" OnClick="SubmitApplication" />
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

        function ValidateContactNumberClient(sender, args) {
            var v = document.getElementById('<%=txtContactNumber.ClientID%>').value;
            if (v.length == 11) {
                args.IsValid = true;  
            }
            else {
                args.IsValid = false;
            }
        }
    </script>
</asp:Content>
