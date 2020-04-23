<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AnimalSetup.aspx.cs" Inherits="AlmostHome.Pages.Admin.AnimalSetup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="card-body">
            <a class="btn btn-default btn-round btn-sm float-right" href="/Pages/Admin/Index">
                <i class="material-icons">keyboard_backspace</i> Return to Admin Home
                <div class="ripple-container"></div>
            </a>
            <h3 class="background"><span>Animal List</span></h3>
            <div class="tabset">
                <!-- Tab 1 -->
                <input type="radio" name="tabset" id="tab1" aria-controls="activeAnimals" checked>
                <label for="tab1">Available Animals</label>
                <!-- Tab 2 -->
                <input type="radio" name="tabset" id="tab2" aria-controls="rehomedAnimals">
                <label for="tab2">Rehomed Animals</label>

                <div class="tab-panels">
                    <section id="activeAnimals" class="tab-panel">
                        <div class="row">
                            <asp:ListView ID="lstAnimal" runat="server">
                                <LayoutTemplate>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="col-md-2 float-left">
                                        <div class="card">
                                            <div class="card-header-animal">
                                                <div class="card-text">
                                                    <h4 class="card-title"><%#Eval("AnimalName")%></h4>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <img alt="" src="/images/ImageAnimals/<%# Eval("ImageUrl").ToString()==""? "default.png" : Eval("ImageUrl") %>" height="75" width="75" style="min-height: 75px" />
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
                        <button class="btn btn-default mr-auto ml-auto" onclick="location.href = '/Pages/Admin/AnimalForm';" type="button">
                            <i class="material-icons">library_add</i> Add Animal
                        </button>
                    </section>
                    <section id="rehomedAnimals" class="tab-panel">
                        <div class="row">
                            <asp:ListView ID="lstRehomed" runat="server">
                                <LayoutTemplate>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="col-md-2 float-left">
                                        <div class="card">
                                            <div class="card-header-animal">
                                                <div class="card-text">
                                                    <h4 class="card-title"><%#Eval("AnimalName")%></h4>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <img alt="" src="/images/ImageAnimals/<%# Eval("ImageUrl").ToString()==""? "default.png" : Eval("ImageUrl") %>" height="75" width="75" style="min-height: 75px"/>
                                                <div class="mt-1">
                                                    <p>Age: <%#Eval("AnimalAge")%></p>
                                                </div>
                                                <asp:Button ID="btnMoveToActive" runat="server" Text="Move To Active"  CssClass="btn btn-default btn-sm pr-1 pl-1" AnimalID='<%#Eval("AnimalID")%>' OnClick="btnMoveToActive_OnClick"/>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
