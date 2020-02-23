<%@ Page Title="Adopt your perfect pet" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Adopt.aspx.cs" Inherits="AlmostHome.Adopt" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    

        <style>
            input[type=text], select {
                width: 100%;
                padding: 13px 20px;
                margin: 7px 0;
                display: inline-block;
                border: 3px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit] {
                border-style: none;
                border-color: inherit;
                border-width: medium;
                background-color: grey;
                color: white;
                padding: 14px 30px;
                margin: 8px 0;
                border-radius: 6px;
                cursor: pointer;
            }

                input[type=submit]:hover {
                    background-color: black;
                }
        </style>

        <style type="text/css">
            .Button {
                background-color: #FF5A00;
                color: #FFFFFF;
                font-weight: bold;
                margin-right: 2px;
                padding: 4px 20px 4px 21px;
            }

            .auto-style1 {
                width: 236px;
            }

            .auto-style2 {
                width: 621px;
            }
        </style>

        <br />
        <br />
        <h2><%: Title %></h2>
        <br />
        <br />
        <p>Finding the pet that best suits your household can be difficult. Please fill out the form below to allow us to find your perfect pet. Using the below questions will complete a search to allow us to work out which of our available animals would fit in well with you.</p>
        
        Animal Type:<br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource7" DataTextField="AnimalType" DataValueField="AnimalType">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [AnimalType] FROM [Animal]"></asp:SqlDataSource>
        

        Animal Age:<br />
        <asp:DropDownList ID="DropDownList2" runat="server" DataTextField="AnimalAge" DataValueField="AnimalAge">
        </asp:DropDownList>   

        Children:<br />
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="Children" DataValueField="Children">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Children] FROM [Animal]"></asp:SqlDataSource>
        
        
        Secure Garden:<br />
        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="SecureGarden" DataValueField="SecureGarden">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [SecureGarden] FROM [Animal]"></asp:SqlDataSource>
    

        Other Pets:<br />
        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource6" DataTextField="OtherPets" DataValueField="OtherPets">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [OtherPets] FROM [Animal]"></asp:SqlDataSource>


        
        <asp:Label runat="server" ID ="LblSearchMessage"></asp:Label>
        <br />
        <asp:Button ID="SearchBtn" runat="server" OnClick="Button1_Click1" Text="Search" />

   

</asp:Content>
