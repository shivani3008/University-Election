<%@ Page Title="" Language="C#" MasterPageFile="~/stu_masterpage_before.master" AutoEventWireup="true" CodeFile="stu_login.aspx.cs" Inherits="stu_login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- CSS  -->
    <link href="./Lib/css/materialize.css" rel="stylesheet" type="text/css" />
    <link href="./Lib/css/materialize.min.css" rel="stylesheet" type="text/css"/>
    <link href="./Lib/css/style_sheet.css" rel="stylesheet" type="text/css" />
    
    <!-- Icons  -->
    <link href="./Lib/icons/materialize-icons.css" rel="stylesheet"/>

    <!-- Js Jquery -->
    <script src="./Lib/jquery/jquery.min.js" type="text/javascript"></script>           
    <script src="./Lib/js/materialize.min.js" type="text/javascript"></script>
    <script>
     /*   $(document).ready(function () {
            $('.carousel').carousel();

            // Next slide
            $('.carousel').carousel('next');
            $('.carousel').carousel('next', 3); // Move next n times.
            // Previous slide
            $('.carousel').carousel('prev');
            $('.carousel').carousel('prev', 4); // Move prev n times.
            // Set to nth slide
            $('.carousel').carousel('set', 4);

            //to remove s3 class
            $('#login1').click(function () {
                $(this).siblings('div').removeClass('s3');
                
            });
        });   */
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div>
        <div class="row container">
         <!--   <div class="col s12 m8 l9 container hide-on-small-and-down">
                <div class="carousel">
                    <a class="carousel-item" href="#one!"><img src="Images/Conmat-01.jpg"/></a>
                    <a class="carousel-item" href="#two!"><img src="Images/Conmat-02.jpg"/></a>
                    <a class="carousel-item" href="#three!"><img src="Images/Conmat-03.jpg"/></a>
                    <a class="carousel-item" href="#four!"><img src="Images/Conmat-04.jpg"/></a>
                    <a class="carousel-item" href="#five!"><img src="Images/Conmat-05.jpg"/></a>
                </div>
            </div>
             -->
            <div class="col s12 m12 l12 card">
                    <div class="row">
                        <div class="input-field col s12 m12 l12 blue-text">
                            <asp:Label ID="lbl_form_title" runat="server" Text="LOGIN" Font-Size="Large"></asp:Label>
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
                        <div class="input-field col s12 m12 l12">
                            <asp:TextBox ID="txt_pswd" runat="server" TextMode="Password" CssClass="width_100"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="twm2" runat="server" TargetControlID="txt_pswd" WatermarkCssClass="font_gray" WatermarkText="Password"></asp:TextBoxWatermarkExtender>
                            <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Enter Password" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_pswd"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 m12 l12 right-align">
                            <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn-large" OnClick="btn_login_Click"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 m12 l12 right-align">
                            <asp:LinkButton CausesValidation="false" ID="lnk_reg" runat="server" OnClick="lnk_reg_Click">Register yourself</asp:LinkButton>
                            <br />
                            <asp:LinkButton CausesValidation="false" ID="lnk_forget_pswd" runat="server" OnClick="lnk_forget_pswd_Click">Forget Password</asp:LinkButton>
                        </div>
                    </div>
            </div>
        </div>
    </div>

</asp:Content>

