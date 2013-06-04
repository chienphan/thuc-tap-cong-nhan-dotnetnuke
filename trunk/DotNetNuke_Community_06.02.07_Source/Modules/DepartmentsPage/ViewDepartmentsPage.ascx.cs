// 
// DotNetNuke� - http://www.dotnetnuke.com 
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
using DotNetNuke.Common.Utilities;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using System.Configuration;
using DNN.Modules.DepartmentsPage.Components;
using System.Collections.Specialized;

namespace DNN.Modules.DepartmentsPage
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// The ViewDepartmentsPage class displays the content 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    partial class ViewDepartmentsPage : PortalModuleBase, IActionable
    {

        #region "Event Handlers"

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// Page_Load runs when the control is loaded 
        /// </summary> 
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
                this.Label1.Text = item.Contents;
            }
            
        }

        /// ----------------------------------------------------------------------------- 
        /// <summary>
        /// lstContent_ItemDataBound runs when items are bound. Here the 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// ----------------------------------------------------------------------------- 
        //protected void lstContent_ItemDataBound(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
        //{
        //    string strContent = "";

        //    // add content to template 
        //    if (!string.IsNullOrEmpty((string)Settings["template"]))
        //    {
        //        strContent = (string)Settings["template"];
        //        ArrayList objProperties = CBO.GetPropertyInfo(typeof(DepartmentsPageInfo));
        //        foreach (PropertyInfo objPropertyInfo in objProperties)
        //        {
        //            strContent = strContent.Replace("[" + objPropertyInfo.Name.ToUpper() + "]", Server.HtmlDecode(DataBinder.Eval(e.Item.DataItem, objPropertyInfo.Name).ToString()));
        //        }
        //    }
        //    else
        //    {
        //        strContent = DataBinder.Eval(e.Item.DataItem, "Content").ToString();
        //    }

        //    // assign the content 
        //    Label lblContent = (Label)e.Item.FindControl("lblContent");
        //    lblContent.Text = strContent;
        //}

        #endregion

        #region "Optional Interfaces"

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// Registers the module actions required for interfacing with the portal framework 
        /// </summary> 
        /// <value></value> 
        /// <returns></returns> 
        /// <remarks></remarks> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(GetNextActionID(), /*Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile)*/"Update info",
                   ModuleActionType.AddContent, "", "add.gif", EditUrl(), false, DotNetNuke.Security.SecurityAccessLevel.Edit,
                    true, false);
                return Actions;
            }
        }

        #endregion

    }

}