<%@ Page Title="" Language="C#" MasterPageFile="~/clg_ad_masterpage_after.master" AutoEventWireup="true" CodeFile="clg_ad_eSchedule_view.aspx.cs" Inherits="clg_ad_eSchedule_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row container">
                <div class="col s12 m12 l12">
                    <asp:UpdatePanel runat="server"><ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" ValidateRequestMode="Disabled" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField AccessibleHeaderText="es_id" HeaderText="Clg Id">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_ees_id" runat="server" Text='<%# Eval("es_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_es_id" runat="server" Text='<%# Bind("es_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField AccessibleHeaderText="clg_id" HeaderText="Clg Id">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_eclg_id" runat="server" Text='<%# Eval("clg_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_clg_id" runat="server" Text='<%# Bind("clg_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Election Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_date" TextMode="Date" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_date" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Time">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_start_time" TextMode="Time" runat="server" Text='<%# Bind("start_time") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_start_time" runat="server" Text='<%# Bind("start_time") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Time">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_end_time" TextMode="Time" runat="server" Text='<%# Bind("end_time") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_end_time" runat="server" Text='<%# Bind("end_time") %>'></asp:Label>
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
                        
                        <EditRowStyle BackColor="White" />
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