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
using System.Configuration;
using System.Data;
using System.Xml;
using System.Web;
using System.Collections.Generic;

using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Services.Search;
using DotNetNuke.Entities.Modules;

namespace GobomDNN.Modules.GobomModuleNews
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// The Controller class for GobomModuleNews 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    public class GobomModuleNewsController : ISearchable, IPortable
    {

        #region "Public Methods"

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// gets an object from the database 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="ModuleId">The Id of the module</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public List<GobomModuleNewsInfo> GetGobomModuleNewss(int ModuleId)
        {

            return CBO.FillCollection<GobomModuleNewsInfo>(DataProvider.Instance().GetGobomModuleNewss(ModuleId));

        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// gets an object from the database 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="ModuleId">The Id of the module</param> 
        /// <param name="ItemId">The Id of the item</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public GobomModuleNewsInfo GetGobomModuleNews(int ModuleId, int ItemId)
        {

            return (GobomModuleNewsInfo)CBO.FillObject(DataProvider.Instance().GetGobomModuleNews(ModuleId, ItemId), typeof(GobomModuleNewsInfo));

        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// adds an object to the database 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="objGobomModuleNews">The GobomModuleNewsInfo object</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public void AddGobomModuleNews(GobomModuleNewsInfo objGobomModuleNews)
        {

            if (objGobomModuleNews.Content.Trim() != "")
            {
                DataProvider.Instance().AddGobomModuleNews(objGobomModuleNews.ModuleId, objGobomModuleNews.Content, objGobomModuleNews.CreatedByUser);
            }

        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// saves an object to the database 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="objGobomModuleNews">The GobomModuleNewsInfo object</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public void UpdateGobomModuleNews(GobomModuleNewsInfo objGobomModuleNews)
        {

            if (objGobomModuleNews.Content.Trim() != "")
            {
                DataProvider.Instance().UpdateGobomModuleNews(objGobomModuleNews.ModuleId, objGobomModuleNews.ItemId, objGobomModuleNews.Content, objGobomModuleNews.CreatedByUser);
            }

        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// deletes an object from the database 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="ModuleId">The Id of the module</param> 
        /// <param name="ItemId">The Id of the item</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public void DeleteGobomModuleNews(int ModuleId, int ItemId)
        {

            DataProvider.Instance().DeleteGobomModuleNews(ModuleId, ItemId);

        }

        #endregion

        #region "Optional Interfaces"

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// GetSearchItems implements the ISearchable Interface 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="ModInfo">The ModuleInfo for the module to be Indexed</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public DotNetNuke.Services.Search.SearchItemInfoCollection GetSearchItems(ModuleInfo ModInfo)
        {

            SearchItemInfoCollection SearchItemCollection = new SearchItemInfoCollection();

            List<GobomModuleNewsInfo> colGobomModuleNewss = GetGobomModuleNewss(ModInfo.ModuleID);
            foreach (GobomModuleNewsInfo objGobomModuleNews in colGobomModuleNewss)
            {
                SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objGobomModuleNews.Content, objGobomModuleNews.CreatedByUser, objGobomModuleNews.CreatedDate, ModInfo.ModuleID, objGobomModuleNews.ItemId.ToString(), objGobomModuleNews.Content, "ItemId=" + objGobomModuleNews.ItemId.ToString());
                SearchItemCollection.Add(SearchItem);
            }

            return SearchItemCollection;

        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// ExportModule implements the IPortable ExportModule Interface 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="ModuleID">The Id of the module to be exported</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public string ExportModule(int ModuleID)
        {

            string strXML = "";

            List<GobomModuleNewsInfo> colGobomModuleNewss = GetGobomModuleNewss(ModuleID);
            if (colGobomModuleNewss.Count != 0)
            {
                strXML += "<GobomModuleNewss>";
                foreach (GobomModuleNewsInfo objGobomModuleNews in colGobomModuleNewss)
                {
                    strXML += "<GobomModuleNews>";
                    strXML += "<content>" + XmlUtils.XMLEncode(objGobomModuleNews.Content) + "</content>";
                    strXML += "</GobomModuleNews>";
                }
                strXML += "</GobomModuleNewss>";
            }

            return strXML;

        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// ImportModule implements the IPortable ImportModule Interface 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="ModuleID">The Id of the module to be imported</param> 
        /// <param name="Content">The content to be imported</param> 
        /// <param name="Version">The version of the module to be imported</param> 
        /// <param name="UserId">The Id of the user performing the import</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public void ImportModule(int ModuleID, string Content, string Version, int UserId)
        {

            XmlNode xmlGobomModuleNewss = Globals.GetContent(Content, "GobomModuleNewss");
            foreach (XmlNode xmlGobomModuleNews in xmlGobomModuleNewss.SelectNodes("GobomModuleNews"))
            {
                GobomModuleNewsInfo objGobomModuleNews = new GobomModuleNewsInfo();
                objGobomModuleNews.ModuleId = ModuleID;
                objGobomModuleNews.Content = xmlGobomModuleNews.SelectSingleNode("content").InnerText;
                objGobomModuleNews.CreatedByUser = UserId;
                AddGobomModuleNews(objGobomModuleNews);
            }

        }

        #endregion

    }
}