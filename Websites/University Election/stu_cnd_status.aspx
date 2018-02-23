<%@ Page Title="" Language="C#" MasterPageFile="~/stu_masterpage_after.master" AutoEventWireup="true" CodeFile="stu_cnd_status.aspx.cs" Inherits="stu_login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="./Lib/css/materialize.css" rel="stylesheet" type="text/css" />
    <link href="./Lib/css/materialize.min.css" rel="stylesheet" type="text/css"/>
    <link href="./Lib/css/style_sheet.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="5000"></asp:Timer>
    <asp:Label ID="lbl_request" runat="server" Text="Your Request is unresolved" Visible="false" Font-Size="Large" ForeColor="#0066ff"></asp:Label><br />
    <asp:Label ID="lbl_not_eligible" runat="server" Text="You are not Eligible for Candidate registration" Visible="false" Font-Size="Large" ForeColor="Red"></asp:Label>
</asp:Content>