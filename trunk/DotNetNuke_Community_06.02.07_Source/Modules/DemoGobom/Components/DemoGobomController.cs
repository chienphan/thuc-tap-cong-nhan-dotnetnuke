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

namespace DNN.Modules.DemoGobom
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// The Controller class for DemoGobom 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    public class DemoGobomController : ISearchable, IPortable
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
        public List<DemoGobomInfo> GetDemoGoboms(int ModuleId)
        {

            return CBO.FillCollection<DemoGobomInfo>(DataProvider.Instance().GetDemoGoboms(ModuleId));

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
        public DemoGobomInfo GetDemoGobom(int ModuleId, int ItemId)
        {

            return (DemoGobomInfo)CBO.FillObject(DataProvider.Instance().GetDemoGobom(ModuleId, ItemId), typeof(DemoGobomInfo));

        }
        public DemoGobomInfo GetDemo(int ModuleId, int ItemId, int GobomId)
        {

            return (DemoGobomInfo)CBO.FillObject(DataProvider.Instance().GetDemo(ModuleId, ItemId, GobomId), typeof(DemoGobomInfo));

        }
        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// adds an object to the database 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="objDemoGobom">The DemoGobomInfo object</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public void AddDemoGobom(DemoGobomInfo objDemoGobom)
        {

            if (objDemoGobom.Content.Trim() != "")
            {
                DataProvider.Instance().AddDemoGobom(objDemoGobom.ModuleId, objDemoGobom.Content, objDemoGobom.CreatedByUser);
            }

        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// saves an object to the database 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="objDemoGobom">The DemoGobomInfo object</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public void UpdateDemoGobom(DemoGobomInfo objDemoGobom)
        {

            if (objDemoGobom.Content.Trim() != "")
            {
                DataProvider.Instance().UpdateDemoGobom(objDemoGobom.ModuleId, objDemoGobom.ItemId, objDemoGobom.Content, objDemoGobom.CreatedByUser);
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
        public void DeleteDemoGobom(int ModuleId, int ItemId)
        {

            DataProvider.Instance().DeleteDemoGobom(ModuleId, ItemId);

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

            List<DemoGobomInfo> colDemoGoboms = GetDemoGoboms(ModInfo.ModuleID);
            foreach (DemoGobomInfo objDemoGobom in colDemoGoboms)
            {
                SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDemoGobom.Content, objDemoGobom.CreatedByUser, objDemoGobom.CreatedDate, ModInfo.ModuleID, objDemoGobom.ItemId.ToString(), objDemoGobom.Content, "ItemId=" + objDemoGobom.ItemId.ToString());
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

            List<DemoGobomInfo> colDemoGoboms = GetDemoGoboms(ModuleID);
            if (colDemoGoboms.Count != 0)
            {
                strXML += "<DemoGoboms>";
                foreach (DemoGobomInfo objDemoGobom in colDemoGoboms)
                {
                    strXML += "<DemoGobom>";
                    strXML += "<content>" + XmlUtils.XMLEncode(objDemoGobom.Content) + "</content>";
                    strXML += "</DemoGobom>";
                }
                strXML += "</DemoGoboms>";
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

            XmlNode xmlDemoGoboms = Globals.GetContent(Content, "DemoGoboms");
            foreach (XmlNode xmlDemoGobom in xmlDemoGoboms.SelectNodes("DemoGobom"))
            {
                DemoGobomInfo objDemoGobom = new DemoGobomInfo();
                objDemoGobom.ModuleId = ModuleID;
                objDemoGobom.Content = xmlDemoGobom.SelectSingleNode("content").InnerText;
                objDemoGobom.CreatedByUser = UserId;
                AddDemoGobom(objDemoGobom);
            }

        }

        #endregion

    }
}