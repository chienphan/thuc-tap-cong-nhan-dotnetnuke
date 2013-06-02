<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Update.ascx.cs" Inherits="DNN.Modules.DemoGobom.Update" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<table width=100% cellspacing="0" cellpadding="0" border="0" summary="Edit Table">
    <tr>
		<td class="SubHead" width="125"><h3>Type :</h3></td>
		<td>
            <asp:dropdownlist ID="dropdownList" runat="server">
            </asp:dropdownlist>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator4" resourcekey="valContent.ErrorMessage" ControlToValidate="txtContent"
				CssClass="NormalRed" Display="Dynamic" ErrorMessage="<br>Content is required" Runat="server" />
		</td>
	</tr>
	<tr>
		<td class="SubHead" width="125"><h3>Title :</h3></td>
		<td>
			<asp:textbox id="txtTitle" width="50%" runat="server" />
			<asp:RequiredFieldValidator ID="valContent" resourcekey="valContent.ErrorMessage" ControlToValidate="txtContent"
				CssClass="NormalRed" Display="Dynamic" ErrorMessage="<br>Content is required" Runat="server" />
		</td>
	</tr>
    <tr>
		<td class="SubHead" width="125"><h3>Image's URL :</h3></td>
		<td>
			<asp:textbox id="txtImageURL" width="50%" runat="server" />
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" resourcekey="valContent.ErrorMessage" ControlToValidate="txtContent"
				CssClass="NormalRed" Display="Dynamic" ErrorMessage="<br>Content is required" Runat="server" />
		</td>
	</tr>
    <tr valign="top" height="300">
		<td class="SubHead" width="125"><h3><dnn:Label id="lblContent" runat="server" controlname="lblContent" suffix="Content :"></dnn:Label></h3></td>
		<td>
			<dnn:texteditor id="txtContent" runat="server" height=100% width=100% />
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" resourcekey="valContent.ErrorMessage" ControlToValidate="txtContent"
				CssClass="NormalRed" Display="Dynamic" ErrorMessage="<br>Content is required" Runat="server" />
		</td>
	</tr>
    <tr >
		<td class="SubHead" width="125"><h3>Poster :</h3></td>
		<td>
			<asp:textbox id="txtPoster" runat="server" />
			<asp:RequiredFieldValidator ID="RequiredFieldValidator3" resourcekey="valContent.ErrorMessage" ControlToValidate="txtContent"
				CssClass="NormalRed" Display="Dynamic" ErrorMessage="<br>Content is required" Runat="server" />
		</td>
	</tr>
</table>
<p>
    <asp:linkbutton cssclass="CommandButton" id="cmdUpdate" resourcekey="cmdUpdate" runat="server" borderstyle="none" text="Update" OnClick="cmdUpdate_Click"></asp:linkbutton>&nbsp;
    <asp:linkbutton cssclass="CommandButton" id="cmdCancel" resourcekey="cmdCancel" runat="server" borderstyle="none" text="Cancel" causesvalidation="False" OnClick="cmdCancel_Click"></asp:linkbutton>&nbsp;
</p>
<asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>