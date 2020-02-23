<%@ Page Title="Home" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AlmostHome._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="portfolio-wrapper">
        <div class="row mb-5">
            <h4>Almost Home are an animal rescue based in Moria in Northern Ireland. We have been open from 2013. We aim to help the unwanted, neglected and abandonded and give them a chance of happiness.Almost Home Animal Rescue is entirely self funded and is run by a very small team of dedicated volunteers. All money raised for Almost Home Animal Rescue goes directly towards the feeding and caring of the animals, this also includes hefty veterinary bills for those that have been mistreated or become ill. Every penny you give goes directly to helping these animals and saving more. </h4>
        </div>
        <div class="row">

            <div class="column">
                <a class="image image-full" href="Logo.jpg">
                    <img src="/images/Logo.jpg" height="150" alt="" /></a>
                <div class="box">
                    <p>Almost Home Animal Rescue NI are based in Moria. We have been open from 2013 and continue to rehome animals.</p>
                    <a href="About.aspx" class="btn">Read our Story</a>
                </div>
            </div>
            <div class="column">
                <a href="Volunteer.aspx" class="image image-full">
                    <img src="/images/Volunteer.png" height="150" alt="" /></a>
                <div class="box">
                    <p>Volunteers are crucial to our animal rescue as they are the structure that keeps all our animals safe.</p>
                    <a href="Volunteer.aspx" class="btn">Volunteer with us</a>
                </div>
            </div>
            <div class="column">
                <a href="Adopt.aspx" class="image image-full">
                    <img src="/images/dog3.jpg" height="150" alt="" /></a>
                <div class="box">
                    <p>We have a wide range of animals needing their forever home. Complete our search and find your perfect pet.</p>
                    <a href="Adopt.aspx" class="btn">Adopt your pet</a>
                </div>
            </div>
            <div class="column">
                <a href="SuccessStories.aspx" class="image image-full">
                    <img src="/images/Success.jpg" height="150" alt="" /></a>
                <div class="box">
                    <p>From 2013 we have rehomed many animals, view some of our animals success stories and where they are today.</p>
                    <a href="SuccessStories.aspx" class="btn">View Success Stories</a>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
