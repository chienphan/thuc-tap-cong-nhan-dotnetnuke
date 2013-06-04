// 
// DotNetNuke® - http://www.dotnetnuke.com 
// Copyright (c) 2002-2013 
// by DotNetNuke Corporation 
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
// to permit persons to whom the Software is furnished to do so, subject to the following conditions: 
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial portions 
// of the Software. 
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE. 
// 

using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;

using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DotNetNuke.Entities.Modules;
using System.Configuration;
using DNN.Modules.DepartmentsPage.Components;
using System.Collections.Specialized;

namespace DNN.Modules.DepartmentsPage
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// The EditDepartmentsPage class is used to manage content 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    partial class EditDepartmentsPage : PortalModuleBase
    {

        #region "Private Members"

        private int ItemId = Null.NullInteger;

        #endregion

        #region "Event Handlers"

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// Page_Load runs when the control is loaded 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        protected void Page_Load(object sender, System.EventArgs e)
        {
            string stringcon = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            DepartmentsDataContext dataContext = new DepartmentsDataContext(stringcon);

            NameValueCollection listParam = Request.QueryString;
            int departmentID = NewsConst.getInstance.GetDepertmentIDFromTabID(this.TabId);

            if (departmentID != 0)
            {
                var item = dataContext.gobom_Departments.SingleOrDefault(c => c.ID == departmentID);
                this.LabelTitle.Text = item.Title;
                this.LabelPoster.Text = item.Poster;
                ((DotNetNuke.UI.UserControls.TextEditor)(txtContent)).HtmlEncode = false;
                ((DotNetNuke.UI.UserControls.TextEditor)(txtContent)).Mode = "BASIC";
                ((DotNetNuke.UI.UserControls.TextEditor)(txtContent)).TextRenderMode = "HTML";
                //((DotNetNuke.UI.UserControls.TextEditor)(txtContent)).Text = item.Contents;
            }
        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// cmdCancel_Click runs when the cancel button is clicked 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect(Globals.NavigateURL(), true);
            }
            catch (Exception exc)
            {
                //Module failed to load 
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// cmdUpdate_Click runs when the update button is clicked 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            string stringcon = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            DepartmentsDataContext dataContext = new DepartmentsDataContext(stringcon);

            NameValueCollection listParam = Request.QueryString;
            int departmentID = NewsConst.getInstance.GetDepertmentIDFromTabID(this.TabId);

            if (departmentID != 0)
            {
                var item = dataContext.gobom_Departments.SingleOrDefault(c => c.ID == departmentID);
                //this.txtTitle = item.Title;
                //item.Contents = ((DotNetNuke.UI.UserControls.TextEditor)(txtContent)).RichText.Text;
                if (!((DotNetNuke.UI.UserControls.TextEditor)(txtContent)).RichText.Text.Equals(""))
                {

                    item.Contents = ((DotNetNuke.UI.UserControls.TextEditor)(txtContent)).RichText.Text;
                } 
                else
                {
                    item.Contents = ((DotNetNuke.UI.UserControls.TextEditor)(txtContent)).Text;
                }
                //item.Contents = (((DotNetNuke.UI.UserControls.TextEditor)(txtContent))).TxtDesktopHTML.Text;
                //item.Poster = this.txtPoster.Text;
                //item.Title = this.txtTitle.Text;

                dataContext.SubmitChanges();
            }
        }

       
        #endregion

    }
}
