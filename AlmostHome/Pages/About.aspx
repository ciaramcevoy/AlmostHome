<%@ Page Title="About Almost Home" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AlmostHome.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container main-content">
        <div class="section text-center" style="padding: 0 0;">
            <div class="row">
                <div class="card-body">
                    <h3 class="title">About Almost Home Animal Rescue NI</h3>
                    <div class="row col-md-12 mb-5">
                        <p class="text-left text-left">Almost Home are an animal rescue based in Moria in Northern Ireland. We have been open from 2013. We aim to help the unwanted, neglected and abandoned and give them a chance of happiness. Almost Home Animal Rescue is entirely self-funded and is run by a very small team of dedicated volunteers. All money raised for Almost Home Animal Rescue goes directly towards the feeding and caring of the animals, this also includes hefty veterinary bills for those that have been mistreated or become ill. Every penny you give goes directly to helping these animals and saving more. Almost home cater for many types of animals such as dogs, cats, turtles, farm animals and other small pets.</p>
                    </div>
                    <div class="row col-md-12 mb-5">
                        <div class="col-md-6">
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="/images/img/c1.jpeg" />
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="/images/img/c2.jpeg" />
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="/images/img/c3.jpeg" />
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card card-nav-tabs">
                                <div class="card-header">
                                    <h4 class="card-title">Almost Home Commitments</h4>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><b>The rescuing of abandoned and unwanted animals</b></li>
                                    <li class="list-group-item"><b>The rehabilitation of abused and neglected animals</b></li>
                                    <li class="list-group-item"><b>The education of the public in the care and treatment of animals</b></li>
                                    <li class="list-group-item"><b>The promotion of spaying and neutering animals</b></li>
                                </ul>
                            </div>

                        </div>

                    </div>
                    <div class="row col-md-12 mb-5">
                        <p class="text-left">Almost Home Animal Rescue is entirely self funded and is run by a very small team of dedicated volunteers. All money raised for Almost Home Animal Rescue goes directly towards the feeding and caring of the animals, this also includes hefty veterinary bills for those that have been mistreated or become ill. Every penny you give goes directly to helping these animals and saving more. </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
