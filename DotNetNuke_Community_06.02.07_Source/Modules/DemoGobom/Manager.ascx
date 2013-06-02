<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Manager.ascx.cs" Inherits="DNN.Modules.DemoGobom.Manager" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width=100%
    EnableModelValidation="True">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
            SortExpression="ID" />
        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="DateCreate" HeaderText="DateCreate" 
            SortExpression="DateCreate" />
        <asp:BoundField DataField="DateModified" HeaderText="DateModified" 
            SortExpression="DateModified" />
        <asp:BoundField DataField="Poster" HeaderText="Poster" 
            SortExpression="Poster" />
        <asp:TemplateField >
            <ItemTemplate>
                  <a href="../../../../../../tabid/55/ctl/Delete/mid/450/NewsID/<%# DataBinder.Eval(Container.DataItem, "ID") %>/Default.aspx">Delete</a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField >
            <ItemTemplate>
                  <a href="../../../../../../tabid/55/ctl/Update/mid/450/NewsID/<%# DataBinder.Eval(Container.DataItem, "ID") %>/Default.aspx">Update</a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

