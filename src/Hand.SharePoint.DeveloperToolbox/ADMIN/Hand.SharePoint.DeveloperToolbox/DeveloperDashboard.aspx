<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="wssuc" TagName="ToolBar" Src="~/_controltemplates/ToolBar.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" Src="~/_controltemplates/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" Src="~/_controltemplates/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" Src="~/_controltemplates/ButtonSection.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeveloperDashboard.aspx.cs"
    Inherits="Hand.SharePoint.DeveloperToolbox.DeveloperDashboard" MasterPageFile="~/_admin/admin.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <asp:Panel ID="inputControls" runat="server">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td width="50%">
                    <!-- **************************************
                     use sharepoint buttonsection control
                     to display the "ok" and "cancel" buttons -->
                    <wssuc:buttonsection runat="server" topbuttons="true" bottomspacing="5" showsectionline="false"
                        showstandardcancelbutton="false">
                        <template_buttons>
                        <asp:Button UseSubmitBehavior="false" runat="server"
                            class="ms-ButtonHeightWidth"
                            Text="<%$Resources:wss,multipages_okbutton_text%>"
                            id="btnSubmitTop" ToolTip="Save current settings"
                            accesskey="<%$Resources:wss,okbutton_accesskey%>"
                            Enabled="true"/>
                        <asp:Button UseSubmitBehavior="false" runat="server"
                            class="ms-ButtonHeightWidth"
                            Text="<%$Resources:wss,multipages_cancelbutton_text%>"
                            CausesValidation="False"
                            id="btnCancelTop"
                            CommandName="Cancel"
                            accesskey="<%$Resources:wss,multipages_cancelbutton_accesskey%>"
                            Enabled="true"/>
                    </template_buttons>
                    </wssuc:buttonsection>
                    <!-- *************************************** -->
                    <!-- ***************************************
                    display an input form section -->
                    <wssuc:inputformsection runat="server" title="Developer dashboard settings" description="The developer dashboard can be set up using the following options">
                        <template_inputformcontrols>
                        <wssuc:InputFormControl runat="server"
                            LabelText="Display level" LabelAssociatedControlId="rblDisplayLevel">
                            <Template_Control>
                                
                                <asp:RadioButtonList runat="server" ID="rblDisplayLevel">
                                    <asp:ListItem  Value="Off">
                                        <strong>Off</strong><br />
                                        The developer dashboard won't be displayed.
                                    </asp:ListItem>
                                    <asp:ListItem Value="On">
                                        <strong>On</strong><br />
                                        The developer dashboard will be displayed.
                                    </asp:ListItem>
                                    <asp:ListItem Value="OnDemand" >
                                        <strong>On demand</strong><br />
                                        The developer dashboard will be displayed on demand.
                                    </asp:ListItem>
                                </asp:RadioButtonList>
                            </Template_Control>
                        </wssuc:InputFormControl>
                        <wssuc:InputFormControl runat="server"
                            LabelText="Required permissions" LabelAssociatedControlId="txtPermissionMask">
                            <Template_Control>
                               <SharePoint:InputFormTextBox ID="txtPermissionMask" runat="server" />
                               <SharePoint:InputFormCustomValidator ID="valPermissionMask" runat="server"
                                    ControlToValidate="txtPermissionMask"
                                    Display="Static"
                                    Width="95%"
                                    ErrorMessage="The permission mask is invalid. Please use a correct combination of SPBasePermissions"                                    
                                    />
                            </Template_Control>
                        </wssuc:InputFormControl>

                    </template_inputformcontrols>
                    </wssuc:inputformsection>
                    <!-- ************************************** -->
                </td>
            </tr>
        </table>
    </asp:Panel>
    <!-- Literal Control to display messages -->
    <div style="font-size: 12pt; color: red; font-weight: bold;">
        <asp:Literal ID="litMessages" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Developer Dashboard settings
</asp:Content>
<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea"
    runat="server">
    Developer Dashboard settings
</asp:Content>
<asp:Content ID="PageDescription" ContentPlaceHolderID="PlaceHolderPageDescription"
    runat="server">
    Manage configuration of the developer dashboard.
</asp:Content>
