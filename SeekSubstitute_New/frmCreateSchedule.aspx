<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCreateSchedule.aspx.cs" Inherits="SeekSubstitute_New.frmCreateSchedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="Coming soon, Bootstrap, Bootstrap 3.0, Free Coming Soon, free coming soon, free template, coming soon template, Html template, html template, html5, Code lab, codelab, codelab coming soon template, bootstrap coming soon template"/>
    <title>Bootstrap Templates</title>
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />

   

    <!-- ============ Add custom CSS here ============ -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />

      <!-- ============ For timePicker control ============ -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/clockface.css" rel="stylesheet" />
    
    <script src="https://www.gstatic.com/firebasejs/4.5.1/firebase.js"></script>
    <script src="Script_BookSchedule.js"></script>

     <!-- ============ For datePicker control ============ -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <script>
  $( function() {
      $("#txtDate").datepicker({ dateFormat: 'yy-mm-dd' });
 });
  </script>     


</head>
<body>
    <form id="form1" runat="server">           
    
   <div class="container">
    <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
       <div class="navbar-header">
                <a class="navbar-brand" href="#">Seek Substitute</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <b><ul class="nav navbar-nav navbar-right">
                    <li><a href="frmMyProfile.aspx">My Profile</a> </li>
                    <li><a href="frmViewSchedule.aspx">View Schedule</a> </li>
                    <li><a href="frmViewRejectedSchedule.aspx">Rejected Jobs</a> </li>
                    <li><a href="frmCreateSchedule.aspx">Create Schedule</a> </li>
                    <li><a href="frmLogin.aspx">LogOut</a> </li>
                </ul></b>
            </div>
       </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                <h1>
                    <strong>Together We Make The Difference</strong></h1>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend style="color:white;">Book Your Schedule<i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Country" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                               <asp:textbox style="background-color:transparent; color:white;" id="txtCountry" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:textbox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label6" runat="server" Text="School" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:textbox style="background-color:transparent; color:white;" id="txtSchool" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:textbox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Subject" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:textbox style="background-color:transparent; color:white;" id="txtSubject" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:textbox>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="Label7" runat="server" Text="Date" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <input style="background-color:transparent; color:white;" type="text" id="txtDate" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">                             
                            <asp:Label ID="Label8" runat="server" Text="Time" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <input style="background-color:transparent; color:white;" type="text" id="txtTime" data-format="hh:mm A" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <input id="btnSave" type="button" value="Save" class="btn btn-primary" />
                                  <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click"/>                              
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
     
    <%--<script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>--%>

        

    <script src="js/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';

        /* ========================== */
        /* ::::::: Backstrech ::::::: */
        /* ========================== */
        // You may also attach Backstretch to a block-level element
        $.backstretch(
        [
            "img/44.jpg",
            "img/colorful.jpg",
            "img/34.jpg",
            "img/images.jpg"
        ],

        {
            duration: 4500,
            fade: 1500
        }
    );
    </script>

        <%--For TimeController--%>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="js/clockface.js"></script>
	<script>
	$(function(){
	    $('#txtTime').clockface();
	});
	</script>
    </form>
</body>
</html>
