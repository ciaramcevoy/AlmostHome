<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AnimalSetup.aspx.cs" Inherits="AlmostHome.Pages.Admin.AnimalSetup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center row">
            <div class="col-md-4 card">
                <div class="card-header">
                    <h4 class="card-title">Add New Animals</h4>
                </div>
                <div class="card-body">
                    <div class="form-group col-md-12">
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
                    <div class="form-group col-md-12">
                        <label for="ddlAnimalType">Animal Type</label>
                        <asp:DropDownList ID="ddlAnimalType" runat="server" class="form-control" DataTextField="AnimalType" DataValueField="AnimalType"></asp:DropDownList>
                    </div>
                    <div class="form-group col-md-12">
                        <label for="txtAnimalName" style="position: static;">Animal Name</label>
                        <asp:TextBox ID="txtAnimalName" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAnimalName" runat="server"
                            ControlToValidate="txtAnimalName" ErrorMessage="The Animal Name field is required."
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-12">
                        <label for="txtAnimalAge" class="text-center" style="position: static;">Animal Age</label>
                        <asp:TextBox ID="txtAnimalAge" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" runat="server"
                            ControlToValidate="txtAnimalAge" ErrorMessage="The Animal Age field is required."
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-12">
                        <label for="ddlChildren">Children</label>
                        <asp:DropDownList ID="ddlChildren" runat="server" class="form-control">
                            <asp:ListItem Value="True">Yes</asp:ListItem>
                            <asp:ListItem Value="False">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-12">
                        <label for="ddlSecureGarden">Secure Garden</label>
                        <asp:DropDownList ID="ddlSecureGarden" runat="server" class="form-control">
                            <asp:ListItem Value="True">Yes</asp:ListItem>
                            <asp:ListItem Value="False">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-12">
                        <label for="ddlOtherPets">Secure Garden</label>
                        <asp:DropDownList ID="ddlOtherPets" runat="server" class="form-control">
                            <asp:ListItem Value="True">Yes</asp:ListItem>
                            <asp:ListItem Value="False">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-12">
                        <asp:FileUpload ID="imageUpload" runat="server" class="form-control" AllowMultiple="False" />
                        <asp:RegularExpressionValidator ID="regexValidator" runat="server"
                            ControlToValidate="imageUpload"
                            ErrorMessage="Only jpg, gif, or png images are allowed"
                            ForeColor="red"
                            ValidationExpression=".*(\.[Jj][Pp][Gg]|\.[Gg][Ii][Ff]|\.[Jj][Pp][Ee][Gg]|\.[Pp][Nn][Gg])">
                        </asp:RegularExpressionValidator>
                    </div>
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-default" OnClick="SaveAnimal" />
                </div>
            </div>
            <div class="col-md-8 card">
                <div class="card-header">
                    <h4 class="card-title">Available Animals</h4>
                </div>
                <div class="card-body">
                    <asp:ListView ID="lstAnimal" runat="server">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="col-md-3 float-left">
                                <div class="card">
                                    <div class="card-header-animal">
                                        <div class="card-text">
                                            <h4 class="card-title"><%#Eval("AnimalName")%></h4>
                                        </div>
                                    </div>
                                    <div class="card-body">

                                        <img alt="" src="/images/ImageAnimals/<%#Eval("ImageUrl")%>" height="75" width="75" />
                                        <p>Age: <%#Eval("AnimalAge")%></p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
