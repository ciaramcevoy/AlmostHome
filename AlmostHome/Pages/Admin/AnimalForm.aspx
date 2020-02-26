<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AnimalForm.aspx.cs" Inherits="AlmostHome.Pages.Admin.AnimalForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center row" style="padding: 0 0;">

            <div class="col-md-6 card ml-auto mr-auto">
                <div class="card-header">
                    <h4 class="card-title">Animal Details</h4>
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
                        <label for="ddlAnimalType">Animal Type</label>
                        <asp:DropDownList ID="ddlAnimalType" runat="server" class="form-control" DataTextField="AnimalType" DataValueField="AnimalType"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="txtAnimalName" style="position: static;">Animal Name</label>
                        <asp:TextBox ID="txtAnimalName" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAnimalName" runat="server"
                            ControlToValidate="txtAnimalName" ErrorMessage="The Animal Name field is required."
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtAnimalAge" class="text-center" style="position: static;">Animal Age</label>
                        <asp:TextBox ID="txtAnimalAge" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" runat="server"
                            ControlToValidate="txtAnimalAge" ErrorMessage="The Animal Age field is required."
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="ddlChildren">Children</label>
                        <asp:DropDownList ID="ddlChildren" runat="server" class="form-control">
                            <asp:ListItem Value="True">Yes</asp:ListItem>
                            <asp:ListItem Value="False">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlSecureGarden">Secure Garden</label>
                        <asp:DropDownList ID="ddlSecureGarden" runat="server" class="form-control">
                            <asp:ListItem Value="True">Yes</asp:ListItem>
                            <asp:ListItem Value="False">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlOtherPets">Secure Garden</label>
                        <asp:DropDownList ID="ddlOtherPets" runat="server" class="form-control">
                            <asp:ListItem Value="True">Yes</asp:ListItem>
                            <asp:ListItem Value="False">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Image
                            ID="animalImage"
                            runat="server"
                            Width="100"
                            Height="100" />

                        <asp:FileUpload ID="imageUpload" runat="server" class="form-control" AllowMultiple="False" />
                        <asp:RegularExpressionValidator ID="regexValidator" runat="server"
                            ControlToValidate="imageUpload"
                            ErrorMessage="Only jpg, gif, or png images are allowed"
                            ForeColor="red"
                            ValidationExpression=".*(\.[Jj][Pp][Gg]|\.[Gg][Ii][Ff]|\.[Jj][Pp][Ee][Gg]|\.[Pp][Nn][Gg])">
                        </asp:RegularExpressionValidator>
                    </div>
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-default w-25" OnClick="SaveAnimal" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn btn-danger w-25" OnClick="DeleteAnimal" />
                    <asp:HiddenField ID="hdnAnimalID" runat="server" Value="0" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
