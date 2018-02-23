<%@ Page Title="" Language="C#" MasterPageFile="~/stu_masterpage_after.master" AutoEventWireup="true" CodeFile="stu_cnd_view.aspx.cs" Inherits="stu_login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="./Lib/css/materialize.css" rel="stylesheet" type="text/css" />
    <link href="./Lib/css/materialize.min.css" rel="stylesheet" type="text/css"/>
    <link href="./Lib/css/style_sheet.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row container">
        
        
        <div class="col s12 m12 l12 card">
            <asp:DataList ID="DataList1" runat="server">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingItemStyle BackColor="White" />
                <ItemStyle BackColor="White" ForeColor="#333333" /> 
                <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    <div class="row card">
                        <div class="input-field col s4 m4 l4">
                            <asp:Image ID="img_profile_photo" runat="server"  Height="50px" 
                            ImageUrl='<%# Bind("profile_photo") %>' Width="50px"/>
                        </div>
                        <div class="input-field col s8 m8 l8">
                            <b><asp:Label ID="lbl_fn" runat="server" Text='<%#Bind("fn") %>' Font-Size="Larger"></asp:Label>&nbsp;
                            <asp:Label ID="lbl_ln" runat="server" Text='<%#Bind("ln") %>' Font-Size="Larger"></asp:Label></b>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s4 m4 l4">
                            <b>Union:</b>
                        </div>
                        <div class="input-field col s8 m8 l8">
                            <asp:Label ID="lbl_unions" runat="server" Text='<%#Bind("unions") %>'></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s4 m4 l4">
                            <b>Post:</b>
                        </div>
                        <div class="input-field col s8 m8 l8">
                            <asp:Label ID="lbl_post" runat="server" Text='<%#Bind("post_name") %>'></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s4 m4 l4">
                            <b>Percentage:</b>
                        </div>
                        <div class="input-field col s8 m8 l8">
                            <asp:Label ID="lbl_percentage" runat="server" Text='<%#Bind("percentage") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>