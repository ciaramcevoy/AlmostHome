<%@ Page Title="Volunteer" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Volunteer.aspx.cs" Inherits="AlmostHome.Volunteer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/wizard/form-elements.css" rel="stylesheet" />
    <link href="../Content/wizard/style.css" rel="stylesheet" />
    <script src="../Scripts/wizard/jquery.backstretch.js"></script>
    <script src="../Scripts/wizard/scripts.js"></script>
    <div class="container">
        <div class="row card-body">
            <div class="col-sm-6 col-md-6 col-lg-6">Description</div>
            <div class="col-sm-6 col-md-6 col-lg-6">Images</div>
        </div>
        
       <div class="row">
                    <div class="col-sm-10 col-md-12 col-lg-12 form-box">
                    	<form role="form" action="" method="post" class="f1" runat="server">
                    		<h3>Volunteer To Help</h3>
                    		<p>Answer qustion to apply</p>
                    		<div class="f1-steps">
                    			<div class="f1-progress">
                    			    <div class="f1-progress-line" data-now-value="6.5" data-number-of-steps="6" style="width: 6.5%;"></div>
                    			</div>
                    			<div class="f1-step active">
                    				<div class="f1-step-icon"><i class="fa fa-user"></i></div>                    				
                    			</div>
                    			<div class="f1-step">
                    				<div class="f1-step-icon"><img class='img-number' src="../images/icons/one.svg"/></div>
                    			</div>
                    			<div class="f1-step">
                    				<div class="f1-step-icon"><img class='img-number' src="../images/icons/two.svg"/></div>
                    			</div>
                    		    <div class="f1-step">
                    				<div class="f1-step-icon"><img class='img-number' src="../images/icons/three.svg"/></div>
                    			</div>
                                <div class="f1-step">
                                    <div class="f1-step-icon"><img class='img-number' src="../images/icons/four.svg"/></div>
                                </div>
                                <div class="f1-step">
                                    <div class="f1-step-icon"><img class='img-number' src="../images/icons/five.svg"/></div>
                                </div>
                    		</div>
                    		
                    		<fieldset>
                    			<div class="form-group">
                                    <asp:TextBox ID="txtFirstName" runat="server"  class="form-control" placeholder="First Name"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtLastName" runat="server"  class="form-control" placeholder="Last Name"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmail" runat="server"  class="form-control" placeholder="Email"></asp:TextBox>
                                </div>
                                <div class="f1-buttons">
                                    <button type="button" class="btn btn-next">Next</button>
                                </div>
                            </fieldset>

                            <fieldset>
                                <div class="form-group">
                                    <h5>Have you got experience with animals?</h5>
                                    <asp:RadioButtonList ID="RadioQ1" runat="server">
                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                        <asp:ListItem Value="0">No</asp:ListItem>
                                        <asp:ListItem Value="2">Somewhat</asp:ListItem>
                                    </asp:RadioButtonList>
                                    
                                </div>
                                <div class="f1-buttons">
                                    <button type="button" class="btn btn-previous">Previous</button>
                                    <button type="button" class="btn btn-next">Next</button>
                                </div>
                            </fieldset>
                            
                            <fieldset>
                                <div class="form-group">
                                    <h5>Do you have a keen interest in animals?</h5>
                                    <asp:RadioButtonList ID="RadioQ2" runat="server">
                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                        <asp:ListItem Value="0">No</asp:ListItem>
                                        <asp:ListItem Value="2">Somewhat</asp:ListItem>
                                    </asp:RadioButtonList>
                                    
                                </div>
                                <div class="f1-buttons">
                                    <button type="button" class="btn btn-previous">Previous</button>
                                    <button type="button" class="btn btn-next">Next</button>
                                </div>
                            </fieldset>

                            <fieldset>
                                <div class="form-group">
                                    <h5>Are you able to commit to 2 hours per week?</h5>
                                    <asp:RadioButtonList ID="RadioQ3" runat="server">
                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                        <asp:ListItem Value="0">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                    
                                </div>
                                <div class="f1-buttons">
                                    <button type="button" class="btn btn-previous">Previous</button>
                                    <button type="button" class="btn btn-next">Next</button>
                                </div>
                            </fieldset>

                            <fieldset>
                                <div class="form-group">
                                    <h5>Do you have access to your own car?</h5>
                                    <asp:RadioButtonList ID="RadioQ4" runat="server">
                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                        <asp:ListItem Value="0">No</asp:ListItem>
                                        <asp:ListItem Value="3">No but transport avaialble</asp:ListItem>
                                    </asp:RadioButtonList>
                                    
                                </div>
                                <div class="f1-buttons">
                                    <button type="button" class="btn btn-previous">Previous</button>
                                    <button type="button" class="btn btn-next">Next</button>
                                </div>
                            </fieldset>

                            <fieldset>
                                <div class="form-group">
                                    <h5>Do you have your tetanus vaccine?</h5>
                                    <asp:RadioButtonList ID="RadioQ5" runat="server">
                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                        <asp:ListItem Value="0">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="f1-buttons">
                                    <button type="button" class="btn btn-previous">Previous</button>
                                    <button type="submit" class="btn btn-submit">Submit</button>
                                </div>
                            </fieldset>
                    	
                    	</form>
                    </div>
                </div>
    </div>
</asp:Content>