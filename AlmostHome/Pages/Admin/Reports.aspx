<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="AlmostHome.Pages.Admin.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="card-body">
            <a class="btn btn-default btn-round btn-sm float-right" href="/Pages/Admin/Index">
                <i class="material-icons">keyboard_backspace</i> Return to Admin Home
                <div class="ripple-container"></div>
            </a>
            <h3 class="background"><span>Generate Reports</span></h3>
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-5">
                            <label for="ddlReportType">Report Type:</label>
                        </div>
                        <div class="col-md-7">
                            <asp:DropDownList ID="ddlReportType" runat="server" class="form-control" OnSelectedIndexChanged="ddlReportType_OnSelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Value="">-- Select --</asp:ListItem>
                                <asp:ListItem Value="1">Animal Applications Report</asp:ListItem>
                                <asp:ListItem Value="2">Volunteer Applications Report</asp:ListItem>
                                <asp:ListItem Value="3">Animals Report</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="ddlReportType" ErrorMessage="Please Select a Report Type"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <asp:Panel ID="panelAnimal" runat="server" Visible="False">
                        <div class="row">
                            <div class="col-md-5">
                                <label for="ddlReportType">Animal Status:</label>
                            </div>
                            <div class="col-md-7">
                                <asp:DropDownList ID="ddlAnimalStatus" runat="server" class="form-control">
                                    <asp:ListItem Value="0">Available Only</asp:ListItem>
                                    <asp:ListItem Value="1">Rehomed Only</asp:ListItem>
                                    <asp:ListItem Value="2">All</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </asp:Panel>
                    <div class="row">
                        <div class="col-md-5">
                            <label for="calFrom">From:</label>
                        </div>
                        <div class="col-md-7">
                            <asp:TextBox ID="txFrom" runat="server" CssClass="form-control datetimepicker"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txFrom" ErrorMessage="Please Select a From Date"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <label for="calTo">To:</label>
                        </div>
                        <div class="col-md-7">
                            <asp:TextBox ID="txtTo" runat="server" CssClass="form-control datetimepicker"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtTo" ErrorMessage="Please Select a To Date"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <hr />
                    <asp:Button ID="RunBtn" runat="server" Text="Run" CssClass="btn btn-default mr-auto ml-auto d-block" OnClick="RunBtn_OnClick" />
                </div>
            </div>

        </div>
    </div>
    <script src="/Scripts/jquery-3.3.1.min.js"></script>
    <script src="/Scripts/moment.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript">
        $('.datetimepicker').datetimepicker({
            format: 'MM/DD/YYYY',
            icons: {
                time: "fa fa-clock-o",
                date: "fa fa-calendar",
                up: "fa fa-chevron-up",
                down: "fa fa-chevron-down",
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                today: 'fa fa-screenshot',
                clear: 'fa fa-trash',
                close: 'fa fa-remove'
            }
        });
    </script>
</asp:Content>
