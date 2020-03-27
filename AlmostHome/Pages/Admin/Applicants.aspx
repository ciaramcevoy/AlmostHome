<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Applicants.aspx.cs" Inherits="AlmostHome.Pages.Admin.Applicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="card-body">
            <a class="btn btn-default btn-round btn-sm float-right" href="/Pages/Admin/Index">
                <i class="material-icons">keyboard_backspace</i> Return to Admin Home
                <div class="ripple-container"></div>
            </a>
            <asp:GridView ID="gvAdoptApplication" runat="server" AutoGenerateColumns="false" Width="100%"
                AllowPaging="true" PageSize="10" OnPageIndexChanging="gvAdoptApplication_PageIndexChanging" OnRowDataBound="OnRowDataBound"
                DataKeyNames="ApplicationID,AnimalID"
                CssClass="Grid"
                AlternatingRowStyle-CssClass="alt"
                PagerStyle-CssClass="pgr">
                <Columns>
                    <asp:BoundField DataField="ApplicationID" HeaderText="Application ID" SortExpression="ApplicationID" />
                    <asp:BoundField DataField="ApplicantName" HeaderText="Applicant Name" SortExpression="ApplicantName" />
                    <asp:BoundField DataField="AnimalName" HeaderText="Animal Name" SortExpression="AnimalName" />
                    <asp:BoundField DataField="ApplicationDate" HeaderText="Applied Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="ApplicationDate" />
                    <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" SortExpression="ContactNumber" />
                    <asp:BoundField DataField="EmailAddress" HeaderText="Email" SortExpression="EmailAddress" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' Visible="False" />
                            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                <asp:ListItem Text="Submitted" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Successful" Value="2"></asp:ListItem>
                                <asp:ListItem Text="In Progress" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Unsuccessful" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>

        </div>
    </div>
</asp:Content>
