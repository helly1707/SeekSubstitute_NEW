﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmSignUp.aspx.cs" Inherits="SeekSubstitute_New.frmSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="https://www.gstatic.com/firebasejs/4.5.1/firebase.js"></script>
    <script src="Script_Sign_Up.js"></script>
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
                        <legend>Registration Form <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="name" name="name" runat="server" placeholder="Your First Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label8" runat="server" Text="Last Name" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="lastname" name="lastname" runat="server" placeholder="Your Last Name" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label6" runat="server" Text="Email" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="email" name="email" runat="server" placeholder="Email" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Password" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="password" name="password" runat="server" placeholder="Password" TextMode="Password" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="Label7" runat="server" Text="Confirm Password" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="confirmPassword" name="confirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Subject" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox class="field" ID="subject" name="subject" runat="server" placeholder="Subject" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="Label5" runat="server" Text="Country" CssClass="col-lg-2 control-label"></asp:Label>                          
                            <div class="col-lg-10">
                                <asp:TextBox class="field" ID="country" name="country" runat="server" placeholder="Country" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                <%--<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control ddl">
                                    <asp:ListItem>INDIA</asp:ListItem>
                                    <asp:ListItem>USA</asp:ListItem>
                                    <asp:ListItem>UK</asp:ListItem>
                                </asp:DropDownList>  --%>                            
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="Qualification" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox class="field" ID="qualification" name="qualification" runat="server" placeholder="Qualification" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                          <div class="form-group">
                            <asp:Label ID="Label9" runat="server" Text="About Me" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox class="field" ID="txtaboutme" name="bio" runat="server" placeholder="About me" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <input id="btnSave" type="button" value="Save" class="btn btn-primary" />
                                  <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click" />                              
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
