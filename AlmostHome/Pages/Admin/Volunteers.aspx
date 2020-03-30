<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Volunteers.aspx.cs" Inherits="AlmostHome.Pages.Admin.Volunteers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="card-body">
            <a class="btn btn-default btn-round btn-sm float-right" href="/Pages/Admin/Index">
                <i class="material-icons">keyboard_backspace</i> Return to Admin Home
                <div class="ripple-container"></div>
            </a>
            <h3 class="background"><span>Volunteer Applications</span></h3>
            <div class="tabset">
                <!-- Tab 1 -->
                <input type="radio" name="tabset" id="tab1" aria-controls="aciveApp" checked>
                <label for="tab1">Active Applications</label>
                <!-- Tab 2 -->
                <input type="radio" name="tabset" id="tab2" aria-controls="pastApp">
                <label for="tab2">Past Applications</label>

                <div class="tab-panels">
                    <section id="aciveApp" class="tab-panel">
                        <div class="table-responsive">
                            <table class="table" style="font-size: 14px;">
                                <thead class=" text-primary">
                                    <tr>
                                        <th>Applied Date</th>
                                        <th>Name</th>
                                        <th>Contact Number</th>
                                        <th>Email</th>
                                        <th>Availability</th>
                                        <th>Preferred Unit</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="lstGrid" runat="server" OnItemDataBound="lstGrid_OnItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("ApplicationDate", "{0:d}")%></td>
                                                <td><%#Eval("VolunteerName")%></td>
                                                <td><%#Eval("ContactNumber")%></td>
                                                <td><%#Eval("EmailAddress")%></td>
                                                <td>
                                                    <asp:Label ID="lblAvailability" runat="server" Availability='<%# Eval("Availability") %>' /></td>
                                                <td>
                                                    <asp:Label ID="lblPreferredUnit" runat="server" PreferredUnit='<%# Eval("PreferredUnit") %>' /></td>
                                                <td>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' Visible="False" />
                                                    <asp:DropDownList VolunteerApplicationID='<%#Eval("VolunteerApplicationID")%>'
                                                        ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" CssClass="form-control-sm btn-info select-center">
                                                        <asp:ListItem Text="Submitted" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Successful" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Waiting list" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <section id="pastApp" class="tab-panel">
                       <div class="table-responsive">
                            <table class="table" style="font-size: 14px;">
                                <thead class=" text-primary">
                                    <tr>
                                        <th>Applied Date</th>
                                        <th>Name</th>
                                        <th>Contact Number</th>
                                        <th>Email</th>
                                        <th>Availability</th>
                                        <th>Preferred Unit</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="lstGridPast" runat="server" OnItemDataBound="lstGridPast_OnItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("ApplicationDate", "{0:d}")%></td>
                                                <td><%#Eval("VolunteerName")%></td>
                                                <td><%#Eval("ContactNumber")%></td>
                                                <td><%#Eval("EmailAddress")%></td>
                                                <td>
                                                    <asp:Label ID="lblAvailability" runat="server" Availability='<%# Eval("Availability") %>' /></td>
                                                <td>
                                                    <asp:Label ID="lblPreferredUnit" runat="server" PreferredUnit='<%# Eval("PreferredUnit") %>' /></td>
                                                <td>Approved</td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
