<%@ Page Title="" Language="C#" MasterPageFile="~/stu_masterpage_before.master" AutoEventWireup="true" CodeFile="stu_registration.aspx.cs" Inherits="stu_login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="./Lib/css/style_sheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row container">
        <div class="col s12 m12 l12 card">
            <div class="row">
                <div class="input-field col s12 m12 l12 blue-text">
                    <asp:Label ID="lbl_form_title" runat="server" Text="REGISTRATION" Font-Size="Large"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12">
                    <asp:TextBox ID="txt_enroll_no" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="twm1" runat="server" TargetControlID="txt_enroll_no" WatermarkCssClass="font_gray" WatermarkText="Enrollment No"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Please Enter Enrollment No" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_enroll_no"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m6 l6">
                    <asp:TextBox ID="txt_fn" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txt_fn" WatermarkCssClass="font_gray" WatermarkText="First Name"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter First Name" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_fn"></asp:RequiredFieldValidator>
                </div>
                <div class="input-field col s12 m6 l6">
                    <asp:TextBox ID="txt_ln" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="twm3" runat="server" TargetControlID="txt_ln" WatermarkCssClass="font_gray" WatermarkText="Last Name"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Last Name" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_ln"></asp:RequiredFieldValidator>        
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                        <asp:DropDownList ID="drp_city" runat="server" CssClass="browser-default" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="drp_city_SelectedIndexChanged"></asp:DropDownList>
                    </ContentTemplate></asp:UpdatePanel>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Select City" Font-Size="Small" ForeColor="Red" ControlToValidate="drp_city" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                        <asp:DropDownList ID="drp_clg" runat="server" CssClass="browser-default" AppendDataBoundItems="True">
                        </asp:DropDownList>
                        </ContentTemplate></asp:UpdatePanel>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Select College" Font-Size="Small" ForeColor="Red" ControlToValidate="drp_clg" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12">
                    <asp:TextBox ID="txt_dept" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="txt_dept" WatermarkCssClass="font_gray" WatermarkText="Department"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Department" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_dept"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12">
                    <asp:TextBox ID="txt_sem" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" TargetControlID="txt_sem" WatermarkCssClass="font_gray" WatermarkText="Semester" Enabled="True"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Semester" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_sem"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s4 m3 l3">
                    <asp:DropDownList ID="drp_country_code" runat="server" CssClass="browser-default" AppendDataBoundItems="True">
                    </asp:DropDownList>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Select Country Code" Font-Size="Small" ForeColor="Red" ControlToValidate="drp_country_code" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="input-field col s8 m9 l9">
                    <asp:TextBox ID="txt_mob_no" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" runat="server" TargetControlID="txt_mob_no" WatermarkCssClass="font_gray" WatermarkText="Mobile No."></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Mobile No." Font-Size="Small" ForeColor="Red" ControlToValidate="txt_mob_no"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_mob_no" ValidateRequestMode="Disabled" Font-Size="Small" ForeColor="Red" ValidationExpression="[0-9]{10}" ErrorMessage="Please Enter valid Mobile No."></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12">
                    <asp:RadioButtonList ID="rb_gender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:RadioButtonList>
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
                    <asp:PasswordStrength ID="PasswordStrength1" runat="server" PreferredPasswordLength="8" MinimumSymbolCharacters="1" MinimumNumericCharacters="1" TargetControlID="txt_pswd"></asp:PasswordStrength>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12">
                    <asp:TextBox ID="txt_cpswd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender6" runat="server" TargetControlID="txt_cpswd" WatermarkCssClass="font_gray" WatermarkText="Password"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please Enter Confirm Password" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_cpswd"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_pswd" ControlToValidate="txt_cpswd" ErrorMessage="Password and Confirm Password doesn't match" Font-Size="Small" ForeColor="Red"></asp:CompareValidator>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12 right-align">
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn-large" OnClick="btn_submit_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>