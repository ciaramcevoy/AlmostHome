<%@ Page Title="Volunteer" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Volunteer.aspx.cs" Inherits="AlmostHome.Volunteer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/wizard/form-elements.css" rel="stylesheet" />
    <link href="../Content/wizard/style.css" rel="stylesheet" />
    <script src="../Scripts/wizard/jquery.backstretch.js"></script>
    <script src="../Scripts/wizard/scripts.js"></script>
    <script type="text/javascript">
        function submitWizard() {
            document.getElementById("<%=btnSubmitQuiz.ClientID%>").click();
        }

    </script>
    <div class="container main-content">
        <div class="row card-body">
            <div class="col-12">
                <h3 class="title">Volunteering at the shelter</h3>
            </div>
            <div class="col-md-6">
                <h4 class="title text-left">There are many ways to be involved</h4>

                <p class="text-muted"><i class="mr-2 material-icons small">pets</i>Transporting dogs and cats.</p>
                <p class="text-muted">
                    <i class="mr-2 material-icons small">pets</i>Working hands on here at the shelter, cleaning, feeing, socialising, dog walking
                    Helping with home visits.
                </p>
                <p class="text-muted"><i class="mr-2 material-icons small">pets</i>Transporting dogs and cats.</p>
                <p class="text-muted"><i class="mr-2 material-icons small">pets</i>Working in our puppy unit, a messy job but a lovely one. Who can resist lots of puppy cuddles.</p>
                <p class="text-muted"><i class="mr-2 material-icons small">pets</i>Making posters to display.</p>

            </div>
            <div class="col-md-6">
                <div class="card card-raised card-carousel">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3" class=""></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="4" class=""></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="../images/img/vol1.jpg" alt="First slide" />
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../images/img/vol2.jpg" alt="Second slide" />
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../images/img/vol3.jpg" alt="Third slide" />
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../images/img/vol4.jpg" alt="Third slide" />
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../images/img/vol5.jpg" alt="Third slide" />
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <i class="material-icons">keyboard_arrow_left</i>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <i class="material-icons">keyboard_arrow_right</i>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <h4 class="title text-left">Volunteers aren’t paid, not because they’re worthless but because they’re priceless.</h4>

                <p>By volunteering even an hour of your time you will make a huge difference to that particular animals life. In order to volunteer you must be over the age of 16 years or over 14 if accompanied by an adult. If you volunteer we ask that you be committed and try where possible to be there, or give as much notice as you can if not able to make it. The animals will rely on you</p>

                <p>
                    If interested in applying to volunteer with us, please complete the below quiz, to ensure you are the correct fit to work with us. You can only complete the below quiz once every 6 months so make sure you answer the questions correctly. Good Luck!
                </p>
            </div>
        </div>

        <div class="row wizard">
            <div class="col-sm-10 col-md-12 col-lg-12 form-box">
                <form role="form" action="" method="post" class="f1" runat="server">
                    <h3 class="title">Volunteer To Help</h3>
                    <div class="f1-steps">
                        <div class="f1-progress">
                            <div class="f1-progress-line" data-now-value="6.5" data-number-of-steps="6" style="width: 6.5%;"></div>
                        </div>
                        <div class="f1-step active">
                            <div class="f1-step-icon"><i class="fa fa-user"></i></div>
                        </div>
                        <div class="f1-step">
                            <div class="f1-step-icon">
                                <img class='img-number' src="../images/icons/one.svg" />
                            </div>
                        </div>
                        <div class="f1-step">
                            <div class="f1-step-icon">
                                <img class='img-number' src="../images/icons/two.svg" />
                            </div>
                        </div>
                        <div class="f1-step">
                            <div class="f1-step-icon">
                                <img class='img-number' src="../images/icons/three.svg" />
                            </div>
                        </div>
                        <div class="f1-step">
                            <div class="f1-step-icon">
                                <img class='img-number' src="../images/icons/four.svg" />
                            </div>
                        </div>
                        <div class="f1-step">
                            <div class="f1-step-icon">
                                <img class='img-number' src="../images/icons/five.svg" />
                            </div>
                        </div>
                    </div>

                    <fieldset>
                        <div class="form-group">
                            <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                        </div>
                        <div class="f1-buttons">
                            <button type="button" class="btn btn-next">Next</button>
                        </div>
                    </fieldset>

                    <fieldset>
                        <div class="form-group">
                            <h4 class="title text-left">Have you got experience with animals?</h4>
                            <asp:RadioButtonList ID="RadioQ1" runat="server">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                                <asp:ListItem Value="2">Somewhat</asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                        <div class="f1-buttons">
                            <button type="button" class="btn btn-previous">Previous</button>
                            <button type="button" class="btn btn-next">Next</button>
                        </div>
                    </fieldset>

                    <fieldset>
                        <div class="form-group">
                            <h4 class="title text-left">Do you have a keen interest in animals?</h4>
                            <asp:RadioButtonList ID="RadioQ2" runat="server">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                                <asp:ListItem Value="2">Somewhat</asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                        <div class="f1-buttons">
                            <button type="button" class="btn btn-previous">Previous</button>
                            <button type="button" class="btn btn-next">Next</button>
                        </div>
                    </fieldset>

                    <fieldset>
                        <div class="form-group">
                            <h4 class="title text-left">Are you able to commit to 2 hours per week?</h4>
                            <asp:RadioButtonList ID="RadioQ3" runat="server">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                        <div class="f1-buttons">
                            <button type="button" class="btn btn-previous">Previous</button>
                            <button type="button" class="btn btn-next">Next</button>
                        </div>
                    </fieldset>

                    <fieldset>
                        <div class="form-group">
                            <h4 class="title text-left">Do you have access to your own car?</h4>
                            <asp:RadioButtonList ID="RadioQ4" runat="server">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                                <asp:ListItem Value="3">No but transport avaialble</asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                        <div class="f1-buttons">
                            <button type="button" class="btn btn-previous">Previous</button>
                            <button type="button" class="btn btn-next">Next</button>
                        </div>
                    </fieldset>

                    <fieldset>
                        <div class="form-group">
                            <h4 class="title text-left">Do you have your tetanus vaccine?</h4>
                            <asp:RadioButtonList ID="RadioQ5" runat="server">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="f1-buttons">
                            <button type="button" class="btn btn-previous">Previous</button>
                            <button type="button" class="btn btn-submit" onclick="submitWizard();">Submit</button>
                            <asp:Button ID="btnSubmitQuiz" runat="server" Text="Submit" OnClick="btnSubmitQuiz_Click" Visible="True"/>

                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
