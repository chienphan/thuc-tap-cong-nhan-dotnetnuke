using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using System.Configuration;
using DNN.Modules.DemoGobom.Components;
using DotNetNuke.Entities.Modules.Actions;

namespace DNN.Modules.DemoGobom
{
    public partial class Manager : PortalModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string stringcon = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            NewsDatabaseDataContext dataContext = new NewsDatabaseDataContext(stringcon);

            var listNews = from item in dataContext.gobom_News select item;
            
            GridView1.DataSource = listNews;
            GridView1.DataBind();
        }

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
    }
}