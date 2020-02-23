<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AlmostHome.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
   
   
    <h3>Contact Us</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr> 07922921852</address>

    <div id="googleMap" style="width:100%;height:400px;"></div>


<script>
function myMap() {
var mapProp= {
  center:new google.maps.LatLng(54.465,-6.1937),
  zoom:5,
};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAtRX9MC_qhr0jpulgg3h0woWupM1c1iRA&callback=myMap"></script>

    <address>
        <span style="font-weight: bold">Email Address:</span>   <a href="mailto:almosthomeadopt@gmail.com">almosthomeadopt@gmail.com</a></address>
        <address>
            &nbsp;</address>
        <webopt:bundlereference runat="server" path="~/Content/default.css" ID="bundlereference1" />
<webopt:bundlereference runat="server" path="~/Content/fonts.css" ID="bundlereference2" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>

    <br />
    <br />
        <section id="Contact">
    <div class="container">
    	<div class="row">
    	    <div class="col-xs-12" style="left: 0px; top: 5px">
        	    <div class="form-wrap">
                
                        <div class="form-group">
                            <label for="FullName" class="sr-only">Full Name</label>
                             <asp:TextBox ID="TextBox3" runat="server" class="form-control" >Full Name</asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="key" class="sr-only">Email</label>
                              <asp:TextBox ID="TextBox4" runat="server" class="form-control">Email</asp:TextBox>
                        </div>
        	    </div>
    		</div> <!-- /.col-xs-12 -->
    	    <div class="col-xs-12" style="left: 0px; top: 5px">
        	    <div class="form-wrap">
                
                        <div class="form-group">
                            <label for="Contact Number" class="sr-only">Contact Number</label>
                             <asp:TextBox ID="TextBox6" runat="server" class="form-control" >Contact Number</asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="key" class="sr-only">Password</label>
                              <br />
                            <textarea id="TextArea1" name="S1" style="width: 268px; height: 74px"></textarea></div>
        	    </div>
    		</div> 
    	</div> <!-- /.row -->
    </div> <!-- /.container -->
</section>


        <address>
                    
                    </address>
        <address>
            &nbsp;</address>
        <address>
            <br />
    </address>

   
</asp:Content>



       