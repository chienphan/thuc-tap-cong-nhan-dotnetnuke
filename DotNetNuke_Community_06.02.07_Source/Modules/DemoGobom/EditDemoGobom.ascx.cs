// 
// DotNetNukeŽ - http://www.dotnetnuke.com 
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

using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DotNetNuke.Entities.Modules;

namespace DNN.Modules.DemoGobom
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// The EditDemoGobom class is used to manage content 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    partial class EditDemoGobom : PortalModuleBase
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
            try
            {

                // Determine ItemId of DemoGobom to Update 
                if ((Request.QueryString["ItemId"] != null))
                {
                    ItemId = Int32.Parse(Request.QueryString["ItemId"]);
                }

                // If this is the first visit to the page, bind the role data to the datalist 
                if (Page.IsPostBack == false)
                {

                    cmdDelete.Attributes.Add("onClick", "javascript:return confirm('" + Localization.GetString("DeleteItem") + "');");

                    if (!Null.IsNull(ItemId))
                    {
                        // get content 
                        DemoGobomController objDemoGoboms = new DemoGobomController();
                        DemoGobomInfo objDemoGobom = objDemoGoboms.GetDemoGobom(ModuleId, ItemId);
                        if ((objDemoGobom != null))
                        {
                            //txtContent.Text = objDemoGobom.Content;
                            //ctlAudit.CreatedByUser = objDemoGobom.CreatedByUserName;
                            //ctlAudit.CreatedDate = objDemoGobom.CreatedDate.ToString();
                        }
                        else
                        {
                            // security violation attempt to access item not related to this Module 
                            Response.Redirect(Globals.NavigateURL(), true);
                        }
                    }
                    else
                    {
                        cmdDelete.Visible = false;
                        ctlAudit.Visible = false;
                    }
                }
            }

            catch (Exception exc)
            {
                //Module failed to load 
                Exceptions.ProcessModuleLoadException(this, exc);
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
            try
            {
                DemoGobomController objDemoGoboms = new DemoGobomController();

                DemoGobomInfo objDemoGobom = new DemoGobomInfo();

                objDemoGobom.ModuleId = ModuleId;
                objDemoGobom.ItemId = ItemId;
                //objDemoGobom.Content = txtContent.Text;
                objDemoGobom.CreatedByUser = this.UserId;

                if (Null.IsNull(ItemId))
                {
                    // add the content within the DemoGobom table 
                    objDemoGoboms.AddDemoGobom(objDemoGobom);
                }
                else
                {
                    // update the content within the DemoGobom table 
                    objDemoGoboms.UpdateDemoGobom(objDemoGobom);
                }

                // Redirect back to the portal home page 
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
        /// cmdDelete_Click runs when the delete button is clicked 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            try
            {
                // Only attempt to delete the item if it exists already 
                if (!Null.IsNull(ItemId))
                {

                    DemoGobomController objDemoGoboms = new DemoGobomController();
                    objDemoGoboms.DeleteDemoGobom(ModuleId, ItemId);

                }

                // Redirect back to the portal home page 
                Response.Redirect(Globals.NavigateURL(), true);
            }
            catch (Exception exc)
            {
                //Module failed to load 
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        #endregion

    }
}
