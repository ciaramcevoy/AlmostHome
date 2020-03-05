<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AddSuccessStory.aspx.cs" Inherits="AlmostHome.Pages.AddSuccessStory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container main-content">
        <div class="section text-center" style="padding: 0 0;">
            <div class="card-body">
                <div class="form-group">
                    <div class="small">Owner Name </div>
                    <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="The Owner Name is required."></asp:RequiredFieldValidator>

                </div>
                <div class="form-group">
                    <div class="small">Your Story</div>
                    <asp:TextBox ID="txtStoryDescription" runat="server" class="form-control" Rows="10" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStoryDescription" ErrorMessage="The Story is required."></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <div class="small">Your Story</div>
                    <asp:FileUpload ID="imageUploader" runat="server" />
                   
                </div>
            </div>
        </div>
    </div>
</asp:Content>
