<%@ Page Title="" Language="C#" MasterPageFile="~/clg_ad_masterpage_after.master" AutoEventWireup="true" CodeFile="clg_ad_request.aspx.cs" Inherits="Request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    <style>  
        .round_corners{
            border-radius: 5px 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="5000"></asp:Timer>
    <div class="container">
        <h3 class="center-align">
            Request
        </h3>
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
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="onMore" CommandArgument='<%#Bind("cnd_id") %>' Font-Size="Medium">View More Details</asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col l12">
                                            <asp:LinkButton ID="lnk_accept" CssClass="btn green" runat="server" Text="Accept" CommandName="onAccept" CommandArgument='<%#Bind("cnd_id") %>'><span class="glyphicon glyphicon-ok"></span> Accept</asp:LinkButton>
                                            <asp:LinkButton ID="lnk_reject" CssClass="btn red" runat="server" Text="Reject" CommandName="onReject" CommandArgument='<%#Bind("cnd_id") %>'><span class="glyphicon glyphicon-remove"></span> Reject</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </blockquote>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <h3 class="text-center">
            <asp:Label ID="no_request" runat="server" Text="No new Requests" Visible="false"></asp:Label>
        </h3>
    </div>
</asp:Content>