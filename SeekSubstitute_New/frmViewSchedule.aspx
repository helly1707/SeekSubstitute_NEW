<%@ Page Title="" Language="C#" MasterPageFile="~/MasterLogout.Master" AutoEventWireup="true" CodeBehind="frmViewSchedule.aspx.cs" Inherits="SeekSubstitute_New.frmViewSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://www.gstatic.com/firebasejs/4.5.1/firebase.js"></script>
    
  
    <script src="Script_ViewMySchedule.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
     <div class="container">
        <asp:Button ID="lnkFeed" runat="server" CssClass="btn btn-warning" Text="Feeds" ClientIDMode="Static" OnClick="lnkViewData_Click"/>
         <%--<input id="lnkFeed" type="button" value="Save" class="btn btn-primary"/>--%>
        <textarea id="demo" cols="80" rows="10" name="demo" hidden="hidden"></textarea>
        <asp:HiddenField ID="hfemail" runat="server" ClientIDMode="Static" />
         <textarea id="emailid" cols="80" rows="10" name="emailid" hidden="hidden"></textarea>
         <asp:Panel ID="Panel1" runat="server" Visible="false" ClientIDMode="Static">
         <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal"> 
                    <fieldset>
                    <legend>Booked Schedule<i class="fa fa-pencil pull-right"></i></legend>
                    <asp:ListView ID="lvSchedule" runat="server" ClientIDMode="Static" GroupItemCount="1" OnItemCommand="lvSchedule_ItemCommand">
                <EmptyDataTemplate>
                    <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Country" CssClass="col-lg-2 control-label"></asp:Label>
                    </div>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server" class="form-group" >
                        <table>
                            <tr>
                                <td>Country</td>
                                <td style="padding-left:50px;"><%# Eval("Country") %></td>
                            </tr>
                            <tr>
                               <td>Date</td>
                                <td style="padding-left:50px;"><%# Eval("Date") %></td>
                            </tr>
                            <tr>
                                <td>Time</td>
                                <td style="padding-left:50px;"><%# Eval("Time") %></td>
                            </tr>
                            <tr>
                                <td>School</td>
                                <td style="padding-left:50px;"><%# Eval("SchoolName") %></td>
                            </tr>
                            <tr>
                                <td>Subject</td>
                                <td style="padding-left:50px;"><%# Eval("Subject") %></td>
                            </tr>
                             <tr>
                                <td></td>
                                <td>
                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-2">
                                            <asp:Button ID="btnReject" runat="server" CssClass="btn btn-warning" Text="Reject Job" ClientIDMode="Static" CommandName="RejectJob" CommandArgument='<%#Eval("LectureId") %>' />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
                        </fieldset>
                </div>
            </div>
         </div>
     </asp:Panel>
           
    </div>
</asp:Content>
