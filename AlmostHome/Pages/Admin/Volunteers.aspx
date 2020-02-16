<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Volunteers.aspx.cs" Inherits="AlmostHome.Pages.Admin.Volunteers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="card-body">

            <asp:GridView ID="gvVolunteerApplication" runat="server" AutoGenerateColumns="false" Width="100%"
                AllowPaging="true" PageSize="10" OnPageIndexChanging="gvVolunteerApplication_PageIndexChanging" OnRowDataBound="OnRowDataBound"
                DataKeyNames="VolunteerApplicationID"
                CssClass="Grid"
                AlternatingRowStyle-CssClass="alt"
                PagerStyle-CssClass="pgr">
                <Columns>
                    <asp:BoundField DataField="ApplicationDate" HeaderText="Applied Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="ApplicationDate" />
                    <asp:BoundField DataField="VolunteerName" HeaderText="Name" SortExpression="VolunteerName" />
                    <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" SortExpression="ContactNumber" />
                    <asp:BoundField DataField="EmailAddress" HeaderText="Email" SortExpression="EmailAddress" />
                    <asp:TemplateField HeaderText="Availability" SortExpression="Availability">
                        <ItemTemplate>
                            <asp:Label ID="lblAvailability" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Preferred Unit" SortExpression="PreferredUnit">
                        <ItemTemplate>
                            <asp:Label ID="lblPreferredUnit" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' Visible="False" />
                            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                <asp:ListItem Text="Submitted" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Successful" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Waiting list" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>

        </div>
    </div>
</asp:Content>
