using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using System.Configuration;
using DNN.Modules.DemoGobom.Components;
using System.Collections.Specialized;

namespace DNN.Modules.DemoGobom
{
    public partial class Update : PortalModuleBase
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
                String TagName = dataContext.gobom_Tags.SingleOrDefault(c => c.ID == news.IDTag).TagName;
                String[] ListTagName = (from item in dataContext.gobom_Tags select item.TagName).ToArray();

                foreach (string item in ListTagName)
                {
                    this.dropdownList.Items.Add(item);
                }

                this.dropdownList.SelectedValue = TagName;
                this.txtTitle.Text = news.Title;
                ((DotNetNuke.UI.UserControls.TextEditor)(this.txtContent)).Text = news.Contents;
                this.txtImageURL.Text = news.ImageURL;
                this.txtPoster.Text = news.Poster;
                this.Label1.Text = NewsID.ToString();
            }
            else
            {
                Response.Redirect("~/GettingStarted/TabId/" + this.TabId.ToString() + "/ctl/Manage/mid/450/Default.aspx", true);
            }
        }

        protected void cmdUpdate_Click(object sender, EventArgs e)
        {
            if (!this.txtTitle.Text.Equals("")
                && !(((DotNetNuke.UI.UserControls.TextEditor)(this.txtContent)).Text).Equals("")
                && !this.txtPoster.Text.Equals("")
                && !this.Label1.Text.Equals(""))
            {
                string title = this.txtTitle.Text.Trim();
                string typeNews = this.dropdownList.SelectedItem.Text;
                string imageURL = this.txtImageURL.Text.Trim();
                string content = ((DotNetNuke.UI.UserControls.TextEditor)(this.txtContent)).Text.Trim();
                string poster = this.txtPoster.Text.Trim();

                string stringcon = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
                NewsDatabaseDataContext dataContext = new NewsDatabaseDataContext(stringcon);

                //get Tag ID from tag name
                var tagType = dataContext.gobom_Tags.SingleOrDefault(c => c.TagName.ToString().Equals(typeNews));

                NameValueCollection listParam = Request.QueryString;
                int NewsId = int.Parse(this.Label1.Text);
                
                gobom_New updateRow = dataContext.gobom_News.SingleOrDefault(c => c.ID == NewsId);
                updateRow.ID = NewsId;//
                updateRow.IDTag = tagType.ID;
                updateRow.ImageURL = imageURL;
                updateRow.Title = title;
                updateRow.Contents = content;
                updateRow.Poster = poster;
                //updateRow.DateCreate = System.DateTime.Now.ToString();
                updateRow.DateModified = System.DateTime.Now.ToString();

                try
                {
                    dataContext.SubmitChanges();
                }
                finally
                {
                    Response.Redirect("~/GettingStarted/tabid/55/ctl/Manage/mid/450/Default.aspx", true);
                }
            }
            else
            {
                Response.Redirect("~/GettingStarted/tabid/55/ctl/Manage/mid/450/Default.aspx", true);
            }
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {

        }
    }
}