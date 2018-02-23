<%@ Page Title="" Language="C#" MasterPageFile="~/stu_masterpage_after.master" AutoEventWireup="true" CodeFile="stu_final_result.aspx.cs" Inherits="stu_live_result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 class="center-align">Final Result</h3>
    <div class="row container">
        
        
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
                                                    <asp:Label ID="lbl_total_votes" runat="server" Text='<%#Bind("vote_count") %>'></asp:Label>&nbsp;
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
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <h4 class="text-center">
                    <asp:Label ID="lbl_msg" runat="server"></asp:Label>
                </h4>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>