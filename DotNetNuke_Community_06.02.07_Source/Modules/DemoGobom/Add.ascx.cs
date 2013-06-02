using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using DotNetNuke.UI.UserControls;
using System.Configuration;
using DNN.Modules.DemoGobom.Components;

namespace DNN.Modules.DemoGobom
{
    public partial class Add : PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string stringcon = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            NewsDatabaseDataContext dataContext = new NewsDatabaseDataContext(stringcon);
            
            var TagList = from item in dataContext.gobom_Tags select item.TagName;

            string[] strArr = TagList.ToArray();
            foreach(string item in strArr)
            {
                this.dropdownList.Items.Add(item);
            }
        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            if(!this.txtTitle.Text.Equals("")
                && !(((DotNetNuke.UI.UserControls.TextEditor)(this.txtContent)).Text).Equals("")
                && !this.txtPoster.Text.Equals(""))
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

                //calculate id of news
                int IDNews = 1;
                try
                {
                    IDNews += dataContext.gobom_News.Max(c => c.ID);
                }
                catch(Exception ex)
                {
                    //TODO
                }
                finally
                {
                    gobom_New newsTable = new gobom_New();
                    newsTable.ID = IDNews;//
                    newsTable.IDTag = tagType.ID;
                    newsTable.ImageURL = imageURL;
                    newsTable.Title = title;
                    newsTable.Contents = content;
                    newsTable.Poster = poster;
                    newsTable.DateCreate = System.DateTime.Now.ToString();
                    newsTable.DateModified = System.DateTime.Now.ToString();

                    dataContext.gobom_News.InsertOnSubmit(newsTable);
                }
                
                try 
                {
                    dataContext.SubmitChanges();
                }
                finally
                {
                    Response.Redirect("",true);
                }
            }
            else
            {
                Response.Redirect("",true);
            }
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            this.txtTitle.Text = null;
            ((DotNetNuke.UI.UserControls.TextEditor)(this.txtContent)).Text = null;
            this.txtImageURL.Text = null;
            this.txtPoster = null;
        }
    }
}