<%@ Page Title="" Language="C#" MasterPageFile="~/clg_ad_masterpage_after.master" AutoEventWireup="true" CodeFile="clg_ad_eSchedule.aspx.cs" Inherits="clg_ad_aSchedule" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="text-center">
            Election Schedule
        </h3>
        <div class="row">
            <div class="col s12 m12 l12">
                <asp:TextBox ID="txt_date" Font-Size="Large" runat="server" TextMode="Date" ToolTip="Date of Election "></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqval" runat="server" 
                    ErrorMessage="Please Enter Date of Election" ControlToValidate="txt_date" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col s12 m12 l12">
                <asp:TextBox ID="txt_start_time" Font-Size="Large" runat="server" TextMode="Time" ToolTip="Starting Time"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Please Enter Start time" ControlToValidate="txt_start_time" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col s12 m12 l12">
                <asp:TextBox ID="txt_end_time" Font-Size="Large" runat="server" TextMode="Time" ToolTip="Ending Time"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Please Enter End time" ControlToValidate="txt_end_time" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col s12 m12 l12 right-align">
                <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn-large" OnClick="btn_submit_Click"/>
            </div>
        </div>
    </div>
</asp:Content>