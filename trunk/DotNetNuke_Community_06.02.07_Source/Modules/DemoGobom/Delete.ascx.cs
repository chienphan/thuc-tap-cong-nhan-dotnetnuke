using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using System.Collections.Specialized;
using System.Configuration;
using DNN.Modules.DemoGobom.Components;

namespace DNN.Modules.DemoGobom
{
    public partial class Delete : PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string stringcon = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            NewsDatabaseDataContext dataContext = new NewsDatabaseDataContext(stringcon);

            NameValueCollection listParam = Request.QueryString;
            if (listParam["NewsID"] != null)
            {
                int NewsID = int.Parse(listParam["NewsID"].ToString());

                gobom_New news = dataContext.gobom_News.SingleOrDefault(c => c.ID == NewsID);

                this.Label1.Text = news.Title;
                this.LinkButtonCancel.Visible = true;
                this.linkButtonOK.Visible = true;
            }
            else
            {
                Response.Redirect("~/GettingStarted/TabId/" + this.TabId.ToString() + "/ctl/Manage/mid/450/Default.aspx", true);
            }
        }

        protected void cmd_OK(object sender, EventArgs e)
        {
            string stringcon = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            NewsDatabaseDataContext dataContext = new NewsDatabaseDataContext(stringcon);

            NameValueCollection listParam = Request.QueryString;
            if (listParam["NewsID"] != null)
            {
                int NewsID = int.Parse(listParam["NewsID"].ToString());

                gobom_New news = dataContext.gobom_News.SingleOrDefault(c => c.ID == NewsID);
                
                dataContext.gobom_News.DeleteOnSubmit(news);
                try
                {
                    dataContext.SubmitChanges();
                }
                catch (System.Exception ex)
                {
                    Response.Redirect("~/GettingStarted/tabid/55/ctl/Manage/mid/450/Default.aspx", true);
                }
                Response.Redirect("~/GettingStarted/tabid/55/ctl/Manage/mid/450/Default.aspx", true);
            }
            else
            {
                Response.Redirect("~/GettingStarted/tabid/55/ctl/Manage/mid/450/Default.aspx", true);
            }
        }

        protected void cmd_Cancel(object sender, EventArgs e)
        {
            Response.Redirect("~/GettingStarted/tabid/55/ctl/Manage/mid/450/Default.aspx", true);
        }
    }
}