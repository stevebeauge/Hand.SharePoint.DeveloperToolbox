using System;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using Microsoft.SharePoint.ApplicationPages;
using System.Web.UI.WebControls;
using Microsoft.SharePoint.Administration;
using Microsoft.SharePoint.Utilities;
using Hand.SharePoint.DeveloperToolbox.Utilities;

namespace Hand.SharePoint.DeveloperToolbox
{
    public partial class DeveloperDashboard : GlobalAdminPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // wire-up control event handlers  
            btnSubmitTop.Click += btnSubmitTop_Click;
            btnCancelTop.Click += btnCancelTop_Click;
            valPermissionMask.ServerValidate += valPermissionMask_ServerValidate;
            if (!IsPostBack)
            {
                // default value  
                var settings = SPWebService.ContentService.DeveloperDashboardSettings;
                rblDisplayLevel.SelectedValue = settings.DisplayLevel.ToString();
                txtPermissionMask.Text = settings.RequiredPermissions.ToString();
            }
        }

        void valPermissionMask_ServerValidate(object source, ServerValidateEventArgs args)
        {
            SPBasePermissions result;
            args.IsValid = EnumUtilities.TryParse<SPBasePermissions>(args.Value, out result, true);
        }

        void btnSubmitTop_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                // save page values and go back to Application Management
                var newLevel = (SPDeveloperDashboardLevel)Enum.Parse(typeof(SPDeveloperDashboardLevel), rblDisplayLevel.SelectedValue);
                var settings = SPWebService.ContentService.DeveloperDashboardSettings;
                settings.DisplayLevel = newLevel;
                settings.RequiredPermissions = (SPBasePermissions)Enum.Parse(typeof(SPBasePermissions), txtPermissionMask.Text, true);
                SPWebService.ContentService.Update();

                Response.Redirect("/default.aspx");
            }
        }

        void btnCancelTop_Click(object sender, EventArgs e)
        {
            Response.Redirect("/default.aspx");
        }

    }
}
