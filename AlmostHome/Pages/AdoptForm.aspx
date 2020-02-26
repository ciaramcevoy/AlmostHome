<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AdoptForm.aspx.cs" Inherits="AlmostHome.Pages.AdoptForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center" style="padding: 0 0;">
            <div class="row">
                <div class="col-md-6 card ml-auto mr-auto">
                    <div class="card-header">
                        <h4 class="card-title">Applicant Details</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:Panel ID="panelError" runat="server" Visible="False">
                                <div class="error-msg">
                                    <i class="fa fa-times-circle"></i>
                                    <asp:Label ID="lblError" runat="server"></asp:Label>
                                </div>
                            </asp:Panel>
                        </div>

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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorContactNumber" runat="server"
                                ControlToValidate="txtContactNumber" ErrorMessage="The Contact Number field is required."
                                ForeColor="Red"></asp:RequiredFieldValidator>
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
                        <p>Name:
                            <asp:Label ID="lblAnimalName" runat="server"></asp:Label></p>
                        <p>Age:
                            <asp:Label ID="lblAnimalAge" runat="server"></asp:Label></p>
                        <p>Children:
                            <asp:Label ID="lblChildren" runat="server"></asp:Label></p>
                        <p>Secure Garden:
                            <asp:Label ID="lblSecureGarden" runat="server"></asp:Label></p>
                        <p>Other Pets:
                            <asp:Label ID="lblOtherPets" runat="server"></asp:Label></p>
                    </div>
                </div>
            </div>


            <div class="row">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Application" class="btn btn-default ml-auto mr-auto"  OnClick="SubmitApplication"/></div>
        </div>

    </div>
</asp:Content>
