<%@ Page Title="" Language="C#" MasterPageFile="~/stu_masterpage_after.master" AutoEventWireup="true" CodeFile="stu_vote.aspx.cs" Inherits="stu_vote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    <style>  
        .round_corners{
            border-radius: 5px 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="center-align">
            Voting
        </h3>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="drp_post" runat="server" CssClass="browser-default" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="drp_post_SelectedIndexChanged">
                </asp:DropDownList>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:DataList ID="DataList1" runat="server" onitemcommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <div class="row card">
                            <div class="col l12 m12 s12">
                                <blockquote>
                                    <div class="row">
                                        <div class="col l3">
                                            <asp:Image ID="profile_photo" CssClass="responsive-img round_corners" runat="server" ImageUrl='<%# Bind("profile_photo") %>' Height="100px" Width="100px" />
                                        </div>
                                        <div class="col l9">
                                            <div class="row">
                                                <div class="col l12">
                                                    <b><asp:Label ID="lbl_fn" runat="server" Text='<%#Bind("fn") %>'></asp:Label>&nbsp;
                                                    <asp:Label ID="lbl_ln" runat="server" Text='<%#Bind("ln") %>'></asp:Label></b>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col l12">
                                                    <asp:Label ID="lbl_post" runat="server" Text='<%#Bind("post_name") %>'></asp:Label>&nbsp;
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col l12">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="onMore" CommandArgument='<%#Bind("cnd_id") %>' Font-Size="Medium">View More Details</asp:LinkButton>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col l12">
                                                    <asp:LinkButton ID="lnk_vote" CssClass="btn green" runat="server" Text="Vote" CommandName="onVote" CommandArgument='<%#Bind("cnd_id") %>'><span class="glyphicon glyphicon-ok"></span> Vote</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </blockquote>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </ContentTemplate>
        </asp:UpdatePanel>
        <h4 class="text-center">
            <asp:Label ID="lbl_msg" runat="server"></asp:Label>
        </h4>
    </div>
</asp:Content>