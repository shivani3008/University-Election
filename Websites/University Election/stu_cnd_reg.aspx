<%@ Page Title="" Language="C#" MasterPageFile="~/stu_masterpage_after.master" AutoEventWireup="true" CodeFile="stu_cnd_reg.aspx.cs" Inherits="stu_login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="./Lib/css/materialize.css" rel="stylesheet" type="text/css" />
    <link href="./Lib/css/materialize.min.css" rel="stylesheet" type="text/css"/>
    <link href="./Lib/css/style_sheet.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row container">
        <div class="col s12 m12 l12 card">
            <div class="row">
                <div class="input-field col s12 m12 l12 blue-text">
                    <asp:Label ID="lbl_form_title" runat="server" Text="CANDIDATE REGISTRATION" Font-Size="Large"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12">
                    <asp:TextBox ID="txt_unions" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txt_unions" WatermarkCssClass="font_gray" WatermarkText="Unions"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Unions" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_unions"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12">
                    <asp:DropDownList ID="drp_post" runat="server" CssClass="browser-default" AppendDataBoundItems="True">
                    </asp:DropDownList>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Select Post" Font-Size="Small" ForeColor="Red" ControlToValidate="drp_post" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s11 m11 l11">
                    <asp:TextBox ID="txt_percentage" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender7" runat="server" TargetControlID="txt_percentage" WatermarkCssClass="font_gray" WatermarkText="Percentage"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Percentage" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_percentage"></asp:RequiredFieldValidator>
                </div>
                <div class="input-field col s1 m1 l1">
                    %
                </div>
            </div>
            <div class="row">
                <div class="input-field col s8 m8 l8">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:FileUpload ID="fu_profile_photo" runat="server"/>
                        </ContentTemplate>
                        <Triggers>
                        <asp:PostBackTrigger ControlID="btn_submit" />
                        </Triggers>
                    </asp:UpdatePanel>            
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12 right-align">
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn-large" OnClick="btn_submit_Click"/>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12 blue-text">
                    <asp:Label ID="lbl_request" runat="server" Visible="false" Text="Your Request has been sent" Font-Size="Large" ForeColor="#00CC00"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>