﻿<%@ Control Language="C#" Inherits="GobomDNN.Modules.GobomModuleNews.ViewGobomModuleNews"
    AutoEventWireup="true" CodeBehind="ViewGobomModuleNews.ascx.cs" %>
<%--<asp:DataList ID="lstContent" DataKeyField="ItemID" runat="server" CellPadding="4"
    OnItemDataBound="lstContent_ItemDataBound">
    <ItemTemplate>
        <table cellpadding="4" width="100%">
            <tr>
                <td valign="top" width="100%" align="left">
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# EditUrl("ItemID",DataBinder.Eval(Container.DataItem,"ItemID").ToString()) %>'
                        Visible="<%# IsEditable %>" runat="server">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
                            Visible="<%#IsEditable%>" resourcekey="Edit" /></asp:HyperLink>
                    <asp:Label ID="lblContent" runat="server" CssClass="Normal" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>--%>
<p>Xin chào các bạn!</p>
<asp:DataList ID="DataList1" RepeatDirection= "Horizontal" runat="Server">
    <ItemTemplate>
        <p><%# DataBinder.Eval(Container.DataItem, "Title") %></p>
        <br />
        <p><%# DataBinder.Eval(Container.DataItem, "Contents") %></p>
        <br />
    </ItemTemplate>
</asp:DataList>