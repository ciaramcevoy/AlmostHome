<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AnimalSetup.aspx.cs" Inherits="AlmostHome.Pages.Admin.AnimalSetup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center row" style="padding: 0 0;">
            <div class="col-md-12 card">
                <div class="card-header">
                    <h4 class="card-title">Available Animals</h4>
                </div>
                <div class="card-body">
                    <asp:ListView ID="lstAnimal" runat="server">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
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
                                        <a href='/Pages/Admin/AnimalForm?id=<%#Eval("AnimalID")%>' class="btn btn-default btn-sm">select</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
