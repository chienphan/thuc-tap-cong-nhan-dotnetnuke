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
using DotNetNuke.Common.Utilities;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using System.Data.SqlClient;
using System.Configuration;
using DotNetNuke.Common;

using DNN.Modules.DemoGobom.Components;

namespace DNN.Modules.DemoGobom
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// The ViewDemoGobom class displays the content 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    partial class ViewDemoGobom : PortalModuleBase, IActionable
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
            NewsDatabaseDataContext dataContext = new NewsDatabaseDataContext(stringcon);
            
            var listOfNews = from news in dataContext.gobom_News
                             orderby news.ID descending
                             select news;
            
            DataList1.DataSource = listOfNews;
            DataList1.DataBind();
            //label1.Text = PortalSettings.ActiveTab.FullUrl;
        }
        protected void link1_Click(object sender, EventArgs e)
        {
            Response.Redirect("", true);
        }

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
                Actions.Add(GetNextActionID(), 
                    //Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile),
                    "Manage News",
                    ModuleActionType.AddContent, 
                    "", 
                    "add.gif", 
                    EditUrl("Manage"), 
                    false, 
                    DotNetNuke.Security.SecurityAccessLevel.Edit,
                    true, 
                    false);

                Actions.Add(GetNextActionID(),
                    "Adding news",
                    ModuleActionType.AddContent,
                    "", 
                    "add.gif", 
                    EditUrl("Add"), 
                    false, 
                    DotNetNuke.Security.SecurityAccessLevel.Edit,
                    true, 
                    true);

                return Actions;
            }
        }

        #endregion

       

    }

}