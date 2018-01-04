<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="SeekSubstitute_New.frmLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="https://www.gstatic.com/firebasejs/4.5.1/firebase.js"></script>
    <script src="Script_Sign_In.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
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
                        <legend>Login Form <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Email" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:textbox class="field" placeholder="Email" id="email" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:textbox>
                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Password" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:textbox class="field" placeholder="Password" id="password" runat="server" textmode="Password" ClientIDMode="Static" CssClass="form-control"></asp:textbox>
                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:button class="btn" id="SignIn" runat="server" commandname="Login"  CssClass="btn btn-primary" text="Log In" validationgroup="Login1" OnClick="SignIn_Click" ClientIDMode="Static" ></asp:button>
                                <asp:Button class="btn" id="Cancel" runat="server" Text="Cancel" CssClass="btn btn-warning" OnClick="Cancel_Click"/>  
                                <br /><br />
                                <asp:LinkButton ID="SignUp" runat="server" Font-Bold="true" Font-Size="Medium" OnClick="SignUp_Click">Join Now</asp:LinkButton>
                                <br />
                                <asp:LinkButton ID="PasswordReset" runat="server" Font-Bold="true" Font-Size="Medium" ClientIDMode="Static">Forgot Password?</asp:LinkButton>
                                <%--<asp:Button class="btn" id="SignUp" runat="server" Text="Sign Up" CssClass="btn btn-warning" OnClick="SignUp_Click"/>  

                                <asp:Button class="btn" ID="PasswordReset" runat="server" Text="Password Reset" ClientIDMode="Static" />               --%>            
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
