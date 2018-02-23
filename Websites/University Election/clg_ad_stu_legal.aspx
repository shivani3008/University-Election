<%@ Page Title="" Language="C#" MasterPageFile="~/stu_masterpage_after.master" AutoEventWireup="true" CodeFile="clg_ad_stu_legal.aspx.cs" Inherits="stu_login" %>

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
                    <asp:Label ID="lbl_form_title" runat="server" Text="COLLEGE" Font-Size="Large"></asp:Label>
                </div>
            </div>
            <div class="row">
            <div class="col s12 m12 l12">
                <asp:DropDownList ID="drp_city" runat="server" CssClass="browser-default" AppendDataBoundItems="True">
                    <asp:ListItem Selected="True" Text="Select City" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Select City" Font-Size="Small" ForeColor="Red" ControlToValidate="drp_city" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12">
                    <asp:TextBox ID="txt_clg_code" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txt_clg_code" WatermarkCssClass="font_gray" WatermarkText="College code"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter College code" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_clg_code"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12">
                    <asp:TextBox ID="txt_clg" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="twm1" runat="server" TargetControlID="txt_clg" WatermarkCssClass="font_gray" WatermarkText="College"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Please Enter College" Font-Size="Small" ForeColor="Red" ControlToValidate="txt_clg"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12 right-align">
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn-large" OnClick="btn_submit_Click"/>
                </div>
            </div>
        </div>
    </div>
     <div class="row container">
                <div class="col s12 m12 l12">
                    <asp:UpdatePanel runat="server"><ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ValidateRequestMode="Disabled" Width="100%">
                        <Columns>
                            <asp:TemplateField AccessibleHeaderText="stu_id" HeaderText="Stu Id">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_estu_id" runat="server" Text='<%# Eval("stu_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_stu_id" runat="server" Text='<%# Bind("stu_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Enrollment No">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_enroll_no" runat="server" Text='<%# Bind("enroll_no") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_enroll_no" runat="server" Text='<%# Bind("enroll_no") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_fn" runat="server" Text='<%# Bind("fn") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_fn" runat="server" Text='<%# Bind("fn") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField AccessibleHeaderText="clg_id" HeaderText="Clg Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="drp_clg_name" runat="server" CssClass="browser-default" AppendDataBoundItems="True">
                                        <asp:ListItem Text="Select Clg" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_clg_id" runat="server" Text='<%# Bind("clg_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dept">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_dept" runat="server" Text='<%# Bind("dept") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_dept" runat="server" Text='<%# Bind("dept") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sem">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_sem" runat="server" Text='<%# Bind("sem") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_sem" runat="server" Text='<%# Bind("sem") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField AccessibleHeaderText="country_code_id" HeaderText="Country Code Id">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="drp_country_code" runat="server" CssClass="browser-default" AppendDataBoundItems="True">
                                        <asp:ListItem Text="Select Country Code" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_country_code" runat="server" Text='<%# Bind("country_code") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField AccessibleHeaderText="edit" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                            
                    </asp:GridView>
                    </ContentTemplate></asp:UpdatePanel>
                </div>
            </div>
</asp:Content>