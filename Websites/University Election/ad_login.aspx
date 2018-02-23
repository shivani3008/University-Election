<%@ Page Title="" Language="C#" MasterPageFile="~/ad_masterpage_before.master" AutoEventWireup="true" CodeFile="ad_login.aspx.cs" Inherits="stu_login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="./Lib/css/style_sheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row container">
        <div class="col s12 m12 l12 card">
            <div class="row">
                <div class="input-field col s12 m12 l12 blue-text">
                    <asp:Label ID="lbl_form_title" runat="server" Text="LOGIN" Font-Size="Large"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12">
                    <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" runat="server" TargetControlID="txt_email" WatermarkCssClass="font_gray" WatermarkText="Email"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please Enter Email" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_email"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter valid Email" Font-Size="Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12">
                    <asp:TextBox ID="txt_pswd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="twm2" runat="server" TargetControlID="txt_pswd" WatermarkCssClass="font_gray" WatermarkText="Password"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Please Enter Password" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_pswd"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12 right-align">
                    <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn-large" OnClick="btn_login_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

