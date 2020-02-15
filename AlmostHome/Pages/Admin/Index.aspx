<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AlmostHome.Pages.Admin.Index" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="row card-body">
            <ul class="nav nav-pills nav-pills-icons">
                <li class="nav-item">
                    <a class="nav-link" href="#dashboard-1" aria-selected="false">
                        <i class="material-icons">pets</i> Animals
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#schedule-1" aria-selected="false">
                        <i class="material-icons">library_books</i> Applicants
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/Pages/Admin/Volunteers.aspx" aria-selected="false">
                        <i class="material-icons">accessibility_new</i> Volunteers
                    </a>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
