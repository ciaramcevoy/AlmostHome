<%@ Page Title="Home" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AlmostHome._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <div class="card-header">
            <h4>Almost Home are an animal rescue based in Moria in Northern Ireland. We have been open from 2013. We aim to help the unwanted, neglected and abandonded and give them a chance of happiness.Almost Home Animal Rescue is entirely self funded and is run by a very small team of dedicated volunteers. All money raised for Almost Home Animal Rescue goes directly towards the feeding and caring of the animals, this also includes hefty veterinary bills for those that have been mistreated or become ill. Every penny you give goes directly to helping these animals and saving more. </h4>
        </div>
        <div class="card-body col-md-12">
            <div class="row">
                <div class="card col-md-3">
                    <a class="image image-full" href="Logo.jpg">
                        <div class="card-header">
                            <img src="/images/Logo.jpg" height="150" alt="" />
                        </div>

                    </a>
                    <div class="box mt-4">
                        <p style="min-height: 100px;">Almost Home Animal Rescue NI are based in Moria. We have been open from 2013 and continue to rehome animals.</p>
                        <a href="About.aspx" class="btn ml-auto mr-auto d-block">Read our Story</a>
                    </div>
                </div>
                <div class="card col-md-3">
                    <a href="Volunteer.aspx" class="image image-full">
                        <div class="card-header">
                            <img src="/images/Volunteer.png" height="150" alt="" />
                        </div>

                    </a>
                    <div class="box mt-4">
                        <p style="min-height: 100px;">Volunteers are crucial to our animal rescue as they are the structure that keeps all our animals safe.</p>
                        <a href="Volunteer.aspx" class="btn ml-auto mr-auto d-block">Volunteer with us</a>
                    </div>
                </div>
                <div class="card col-md-3">
                    <a href="Adopt.aspx" class="image image-full">
                        <div class="card-header">
                            <img src="/images/dog3.jpg" height="150" alt="" />

                        </div>
                    </a>
                    <div class="box mt-4">
                        <p style="min-height: 100px;">We have a wide range of animals needing their forever home. Complete our search and find your perfect pet.</p>
                        <a href="Adopt.aspx" class="btn ml-auto mr-auto d-block">Adopt your pet</a>
                    </div>
                </div>
                <div class="card col-md-3">
                    <a href="SuccessStories.aspx" class="image image-full">
                        <div class="card-header">
                            <img src="/images/Success.jpg" height="150" alt="" />

                        </div>
                    </a>
                    <div class="box mt-4">
                        <p style="min-height: 100px;">From 2013 we have rehomed many animals, view some of our animals success stories and where they are today.</p>
                        <a href="SuccessStories.aspx" class="btn ml-auto mr-auto d-block">View Success Stories</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
