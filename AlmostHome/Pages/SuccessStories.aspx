<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="SuccessStories.aspx.cs" Inherits="AlmostHome.Pages.SuccessStories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center" style="padding: 0 0;">
            <div class="card-body success-section">
                <h3 class="title ml-auto mr-auto">Animals that made it home</h3>
                <asp:ListView ID="lstSuccessStories" runat="server">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="row story">
                            <div class="col-md-4">
                                <img src="/images/img/<%#Eval("Image")%>" alt="Raised Image" class="img-raised rounded img-fluid" />
                            </div>
                            <div class="col-md-8 text-left">
                                <div class="blockquote ">
                                    <p><%#Eval("StroryDescription")%></p>
                                    <small><%#Eval("Name")%></small>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <div class="row">
                    <ul class="nav nav-pills nav-pills-icons float-right">
                        <li class="nav-item">
                            <a class="nav-link" href="/Pages/AddSuccessStory.aspx" aria-selected="false">
                                <i class="material-icons">playlist_add</i> Add your success story
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
