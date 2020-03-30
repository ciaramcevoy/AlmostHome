<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="ReviewSuccessStories.aspx.cs" Inherits="AlmostHome.Pages.Admin.ReviewSuccessStories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="alert alert-success d-none">
            <div class="container">
                <div class="alert-icon">
                    <i class="material-icons">check</i>
                </div>
                <button type="button" class="close"  aria-label="Close" onclick="hideAlert();">
                    <span aria-hidden="true"><i class="material-icons">clear</i></span>
                </button>
                <asp:Label ID="lblSuccess" runat="server" CssClass="lblSuccess">Success Story Updated</asp:Label>
            </div>
        </div>
        <div class="card-body success-section">
            <a class="btn btn-default btn-round btn-sm float-right" href="/Pages/Admin/Index">
                <i class="material-icons">keyboard_backspace</i> Return to Admin Home
                <div class="ripple-container"></div>
            </a>
            <h3 class="background"><span>Success Stories</span></h3>
            <asp:ListView ID="lstSuccessStories" runat="server">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="row story">
                        <div class="col-md-3">
                            <img src="/images/SuccessStory/<%#Eval("Image")%>" alt="Raised Image" class="img-raised rounded img-fluid" />
                        </div>
                        <div class="col-md-6 text-left">
                            <div class="blockquote">
                                <p><%#Eval("StroryDescription")%></p>
                                <br />
                                <small>By <%#Eval("Name")%></small>
                            </div>

                        </div>
                        
                        <div class="col-md-3">
                            <div class="blockquote">
                                <div class="btn-group btn-toggle" data-id="<%#Eval("StoryID")%>"> 
                                    <button class="btn btn-sm active-btn <%# (bool)Eval("Active") == false ? "btn-default" : "btn-info active" %>">Active</button>
                                    <button class="btn btn-sm  <%# (bool)Eval("Active") == false ? "active btn-info" : "btn-default" %>">Inactive</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
  
    <script src="/Scripts/jquery-3.3.1.min.js"></script>
    <script>
        $('.btn-toggle').click(function () {
            $(this).find('.btn').toggleClass('active');

            if ($(this).find('.btn-info').length > 0) {
                $(this).find('.btn').toggleClass('btn-info');
            }
            $(this).find('.btn').toggleClass('btn-default');
            updateSuccessStoryStatus($(this).attr('data-id'), $(this).find('.active-btn').hasClass('active'));
            return false;

        });


        function updateSuccessStoryStatus(id, status) {
            $.ajax({
                type: "POST",
                url: "<%= ResolveUrl("ReviewSuccessStories.aspx/UpdateSuccessStoryStatus") %>",
                data: JSON.stringify({ 'storyID': id, 'status': status  }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('.alert-success').removeClass('d-none');
                },
                failure: function (response) {
                    
                }
            });
            
        }  

        function hideAlert()
        {
            $('.alert-success').addClass('d-none');
        }
    </script>
</asp:Content>
