<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AlmostHome.Pages.Admin.Index" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">

        <div class="row card-body button-panel">
            <div class="col-md-3">
                <div class="card">
                    <img src="/images/dog1.jpg" alt="Thumbnail Image" class="img-raised rounded img-fluid mr-auto ml-auto card" />
                    <div class="container">
                        <input type="checkbox" name="read-more-trigger1" id="read-more-trigger1" />
                        <div class="content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>
                            <br/>
                        </div>
                        <div class="label-container">
                            <label for="read-more-trigger1" id="read-more-label1"></label>
                        </div>
                    </div>
                    <a class="nav-link mr-auto ml-auto btn btn-default" href="/Pages/Admin/Applicants.aspx" aria-selected="false">
                        <i class="material-icons">library_books</i> Applicants
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <img src="/images/dog1.jpg" alt="Thumbnail Image" class="img-raised rounded img-fluid mr-auto ml-auto card" />
                    <div class="container">
                        <input type="checkbox" name="read-more-trigger2" id="read-more-trigger2" />
                        <div class="content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>
                            <br/>
                        </div>
                        <div class="label-container">
                            <label for="read-more-trigger2" id="read-more-label2"></label>
                        </div>
                    </div>
                    <a class="nav-link mr-auto ml-auto btn btn-default" href="/Pages/Admin/Volunteers.aspx" aria-selected="false">
                        <i class="material-icons">accessibility_new</i> Volunteers
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <img src="/images/dog1.jpg" alt="Thumbnail Image" class="img-raised rounded img-fluid mr-auto ml-auto card" />
                    <div class="container">
                        <input type="checkbox" name="read-more-trigger3" id="read-more-trigger3" />
                        <div class="content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>
                            <br/>
                        </div>
                        <div class="label-container">
                            <label for="read-more-trigger3" id="read-more-label3"></label>
                        </div>
                    </div>
                    <a class="nav-link mr-auto ml-auto btn btn-default" href="/Pages/Admin/AnimalSetup.aspx" aria-selected="false">
                        <i class="material-icons">pets</i> Animals
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <img src="/images/dog1.jpg" alt="Thumbnail Image" class="img-raised rounded img-fluid mr-auto ml-auto card" />
                    <div class="container">
                        <input type="checkbox" name="read-more-trigger4" id="read-more-trigger4" />
                        <div class="content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>
                            <br/>
                        </div>
                        <div class="label-container">
                            <label for="read-more-trigger4" id="read-more-label4"></label>
                        </div>
                    </div>
                    <a class="nav-link mr-auto ml-auto btn btn-default" href="/Pages/Admin/AnimalTypeSetup.aspx" aria-selected="false">
                        <i class="material-icons">library_books</i> Animal Type Setup
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <img src="/images/dog1.jpg" alt="Thumbnail Image" class="img-raised rounded img-fluid mr-auto ml-auto card" />
                    <div class="container">
                        <input type="checkbox" name="read-more-trigger4" id="read-more-trigger5" />
                        <div class="content">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>
                            <br/>
                        </div>
                        <div class="label-container">
                            <label for="read-more-trigger4" id="read-more-label5"></label>
                        </div>
                    </div>
                    <a class="nav-link mr-auto ml-auto btn btn-default" href="/Pages/Admin/ReviewSuccessStories.aspx" aria-selected="false">
                        <i class="material-icons">library_books</i> Success Stories
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
