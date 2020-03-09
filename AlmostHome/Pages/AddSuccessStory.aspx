<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AddSuccessStory.aspx.cs" Inherits="AlmostHome.Pages.AddSuccessStory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container main-content">
        <div class="section text-center" style="padding: 0 0;">
            <div class="row shadow">
                <div class="card-body">
                    <h3 class="title">Add Your Success Story</h3>
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
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" style="visibility: hidden">
                                                <i class="material-icons"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtName" runat="server" class="form-control" CssClass="form-control" TextMode="SingleLine" placeholder="Owner Name"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="The Owner Name is required." CssClass="text-danger"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" style="visibility: hidden">
                                                <i class="material-icons"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="txtStoryDescription" CssClass="form-control" TextMode="MultiLine" placeholder="Your Story" Rows="10" />

                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStoryDescription" CssClass="text-danger" ErrorMessage="The Story is required."></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" style="visibility: hidden">
                                                <i class="material-icons"></i>
                                            </span>
                                        </div>
                                        <asp:FileUpload ID="imageUploader" runat="server" CssClass="form-control" />
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="imageUploader" CssClass="text-danger" ErrorMessage="Image file is required."></asp:RequiredFieldValidator></div>
                                    <div>
                                        <asp:RegularExpressionValidator runat="server" ErrorMessage="Only images are allowed!" CssClass="text-danger" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.gif|.GIF|.jpg|.JPG|.jpeg|.JPEG)$" Display="None" ControlToValidate="imageUploader"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <img src="/images/success-story.jpg"  width="470"/>
                        </div>
                    </div>

                    <hr />
                    <div class="col-md-6">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit My Story" class="btn btn-default ml-auto mr-auto" OnClick="SubmitStory" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
