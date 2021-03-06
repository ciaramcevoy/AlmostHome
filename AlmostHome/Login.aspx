﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="AlmostHome.Login2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<webopt:bundlereference runat="server" path="~/Content/default.css" />
<webopt:bundlereference runat="server" path="~/Content/fonts.css" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>

    <form id="form1" runat="server">
        <br />

        <table style="width:100%;">
            <tr>
                <td style="width: 95px">
                    <asp:Label runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="usernameTxt" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server"   
                                                ControlToValidate="usernameTxt" ErrorMessage="Please Enter Your Username"   
                                                ForeColor="Red"></asp:RequiredFieldValidator>  
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 95px">
                    <asp:Label runat="server"  Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="passwordTxt" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server"   
                                                ControlToValidate="passwordTxt" ErrorMessage="Please Enter Your Password"   
                                                ForeColor="Red"></asp:RequiredFieldValidator> 
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 95px">&nbsp;</td>
                <td>
                    <asp:Button ID="LoginBtn" runat="server" OnClick="LoginBtn_Click" Text="Login" />
                </td>
                <td>&nbsp;</td>
            </tr>
            
            <tr>
                <td style="width: 95px">&nbsp;</td>
                <td>
                    <asp:Label ID="LblLoginMessage" runat="server"></asp:Label>  
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>


