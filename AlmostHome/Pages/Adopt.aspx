<%@ Page Title="Adopt your perfect pet" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Adopt.aspx.cs" Inherits="AlmostHome.Adopt" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
    <div class="container main-content">
        <img src="/images/adoptme-banner2.jpg" class="d-block ml-auto mr-auto w-75"/>
        <div class="section text-center row" style="padding: 0 0;">
            <div class="adopt-content shadow">
                <h4 class="title">Adopting an Animal from Almost Home</h4>
                <ol class="live numbers">
                    <li>
                        <h5>Search for the animal that best suits your criteria</h5>
                        We have many types of animals within our care, from puppys, dogs, old dogs, all the way to rabbits. Each of our animals have different needs and requirements, so therefore we need to make sure they are the best fit for you, as you are for them. Complete the search below to find your perfect animal.</li>
                    <li>
                        <h5>Complete a rehoming application form</h5>
                        When you search through our available animals and find your perfect fit. Review to ensure this animal is correct for you, then submit an application by entering your contact details. These details will be sent to us to review. We will update you along the way via email so ensure to enter your email address within the contact details section!</li>
                    <li>
                        <h5>Get to know your chosen Animal</h5>
                        If your application is successful, you will be contacted by a member of our team to arrange a day to come meet your new pet. This will make sure that both you and your chosen pet suit well together. This also allows our staff to get to know you and your situation.</li>
                    <li>
                        <h5>Home visit</h5>
                        After you have met your pet at the rescue and everything has went ok, a member of the team will come out to your house to complete a home check, ensuring the environment is safe for the animal, including fencing and sufficient size garden. A member of the team will contact you to arrange a suitable time to call.</li>
                    <li>
                        <h5>Collect your new pet!</h5>
                        When everyone is happy that your chosen dog is the right animal for you, and that your home is suitable and ready for it's newest addition, it's time to head back to the centre to have your new family member officially signed over!</li>
                </ol>
            </div>
        </div>
        <div class="section text-center row" style="padding: 0 0;">
            <div class="col-md-12 card">
                <div class="card-header">
                    <h4 class="card-title">Adopt your perfect pet</h4>
                    <p class="category text-left">Finding the pet that best suits your household can be difficult. Please fill out the form below to allow us to find your perfect pet. Using the below questions will complete a search to allow us to work out which of our available animals would fit in well with you.</p>
                </div>

                <div class="card-body">
                    <div class="form-row col-md-12">
                        <div class="form-group col-md-2">
                            <label for="ddlAnimalType">Animal Type</label>
                            <asp:DropDownList ID="ddlAnimalType" runat="server" class="form-control" DataTextField="AnimalType" DataValueField="AnimalType"></asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="ddlAnimalAge">Animal Age</label>
                            <asp:DropDownList ID="ddlAnimalAge" runat="server" class="form-control">
                                <asp:ListItem Value="1">0-3</asp:ListItem>
                                <asp:ListItem Value="2">3-6</asp:ListItem>
                                <asp:ListItem Value="3">6+</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="ddlChildren">Children</label>
                            <asp:DropDownList ID="ddlChildren" runat="server" class="form-control">
                                <asp:ListItem Value="True">Yes</asp:ListItem>
                                <asp:ListItem Value="False">No</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="ddlSecureGarden">Secure Garden</label>
                            <asp:DropDownList ID="ddlSecureGarden" runat="server" class="form-control">
                                <asp:ListItem Value="True">Yes</asp:ListItem>
                                <asp:ListItem Value="False">No</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="ddlOtherPets">Secure Garden</label>
                            <asp:DropDownList ID="ddlOtherPets" runat="server" class="form-control">
                                <asp:ListItem Value="True">Yes</asp:ListItem>
                                <asp:ListItem Value="False">No</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <asp:Button ID="SearchBtn" runat="server" OnClick="SearchAnimals" Text="Search" class="btn btn-default" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Panel ID="panelSearchResult" runat="server" Visible="False">
            <div class="text-center row">
                <div class="col-md-12 card">
                    <div class="card-header">
                        <h4 class="card-title">Search Result</h4>
                    </div>
                    <div class="card-body">
                        <asp:Panel ID="panelWarn" runat="server" Visible="False">
                            <div class="warning-msg">
                                <i class="fa fa-warning"></i>
                                <asp:Label ID="lblWarn" runat="server"></asp:Label>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="panelError" runat="server" Visible="False">
                            <div class="error-msg">
                                <i class="fa fa-times-circle"></i>
                                <asp:Label ID="lblError" runat="server"></asp:Label>
                            </div>
                        </asp:Panel>
                        <asp:ListView ID="lstSearchResult" runat="server">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                <asp:DataPager ID="DataPagerResult" runat="server" PagedControlID="lstSearchResult" PageSize="5">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ButtonCssClass="pagerButton"/>
                                        <asp:NumericPagerField ButtonType="Link" NumericButtonCssClass="pagerButton" />
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton = "false"  ButtonCssClass="pagerButton"/>
                                    </Fields>
                                </asp:DataPager>                               
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div class="col-md-3 float-left">
                                    <div class="card">
                                        <div class="card-header-animal">
                                            <div class="card-text">
                                                <h4 class="card-title"><%#Eval("AnimalName")%></h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <img alt="" src="/images/ImageAnimals/<%# Eval("ImageUrl").ToString()==""? "default.png" : Eval("ImageUrl") %>" height="75" width="75" />
                                            <div class="mt-1">
                                                <p>Age: <%#Eval("AnimalAge")%></p>
                                            </div>
                                            <button class="btn btn-default btn-sm btn-round" onclick="location.href = '/Pages/AdoptForm?id=<%#Eval("AnimalID")%>';" type="button">
                                                <i class="material-icons">favorite</i> Adopt Me
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
