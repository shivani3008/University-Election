<%@ Page Title="" Language="C#" MasterPageFile="~/stu_masterpage_before.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="stu_login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="./Lib/css/style_sheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row container">
        <div class="col s12 m12 l12 card">
            <div class="row">
                <div class="input-field col s12 m12 l12 blue-text">
                    <asp:Label ID="lbl_form_title" runat="server" Text="CONTACT" Font-Size="Large"></asp:Label>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>

