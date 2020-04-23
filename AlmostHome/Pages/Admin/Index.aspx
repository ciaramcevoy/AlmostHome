<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AlmostHome.Pages.Admin.Index" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">

        <div class="row card-body button-panel">
            <div class="col-md-3">
                <div class="card">
                    <a class="btn-box" href="/Pages/Admin/Dashboard.aspx" aria-selected="false">
                        <div class="info ">
                            <div class="icon icon-rose text-center">
                                <i class="material-icons">dashboard</i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Dashboard</h4>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <a class="btn-box" href="/Pages/Admin/Reports.aspx" aria-selected="false">
                        <div class="info ">
                            <div class="icon icon-success text-center">
                                <i class="material-icons">trending_up</i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Reports</h4>
                               
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <a class="btn-box" href="/Pages/Admin/Applicants.aspx" aria-selected="false">
                        <div class="info ">
                            <div class="icon icon-warning text-center">
                                <i class="material-icons">library_books</i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Applicants</h4>
                                
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <a class="btn-box" href="/Pages/Admin/Volunteers.aspx" aria-selected="false">
                        <div class="info ">
                            <div class="icon icon-primary text-center">
                                <i class="material-icons">accessibility_new</i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Volunteers</h4>
                                
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card">
                    <a class="btn-box" href="/Pages/Admin/AnimalSetup.aspx" aria-selected="false">
                        <div class="info ">
                            <div class="icon icon-info text-center">
                                <i class="material-icons">pets</i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Animals</h4>
                               
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card">
                    <a class="btn-box" href="/Pages/Admin/AnimalTypeSetup.aspx" aria-selected="false">
                        <div class="info ">
                            <div class="icon icon-danger text-center">
                                <i class="material-icons">title</i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Animal Types</h4>
                               
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card">
                    <a class="btn-box" href="/Pages/Admin/ReviewSuccessStories.aspx" aria-selected="false">
                        <div class="info ">
                            <div class="icon icon-success text-center">
                                <i class="material-icons">thumb_up_alt</i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Success Stories</h4>
                                
                            </div>
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
