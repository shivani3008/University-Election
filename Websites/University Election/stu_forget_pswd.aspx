<%@ Page Title="" Language="C#" MasterPageFile="~/stu_masterpage_before.master" AutoEventWireup="true" CodeFile="stu_forget_pswd.aspx.cs" Inherits="stu_login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="./Lib/css/materialize.css" rel="stylesheet" type="text/css" />
    <link href="./Lib/css/materialize.min.css" rel="stylesheet" type="text/css"/>
    <link href="./Lib/css/style_sheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="row container">
            <div class="col s12 m12 l12 card">
                <div class="row">
                    <div class="input-field col s12 m12 l12 blue-text">
                        <asp:Label ID="lbl_form_title" runat="server" Text="FORGET PASSWORD" Font-Size="Large"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12 m12 l12">
                        <asp:TextBox ID="txt_enroll_no" runat="server" CssClass="width_100"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="twm1" runat="server" TargetControlID="txt_enroll_no" WatermarkCssClass="font_gray" WatermarkText="Enrollment No"></asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Enter Enrollment No" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_enroll_no"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m12 l12 right-align">
                        <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn-large"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

