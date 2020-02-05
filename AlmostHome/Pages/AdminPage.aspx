<%@ Page Title="Admin Portal" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="AlmostHome.Pages.AdminPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <form runat="server">
        <asp:Button ID="btnAnimalDb" runat="server" Text="Animal Database" OnClick="btnAnimalDb_Click" />
        <asp:Button ID="btnAnimalApp" runat="server" Text="Animal Application" />
        <asp:Button ID="btnVolunteerApp" runat="server" Text="Volunteer Application" />
    </form>

    <style>
        input[type=submit] {
            width: 25%;
            padding: 13px 20px;
            margin: 7px 0;
            border: 3px solid #ccc;
            border-radius: 25px;
            box-sizing: border-box;
            cursor: pointer;
        }
    </style>
</asp:Content>
