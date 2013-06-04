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

namespace DNN.Modules.DepartmentsPage
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// The Controller class for DepartmentsPage 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    public class DepartmentsPageController : ISearchable, IPortable
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
        public List<DepartmentsPageInfo> GetDepartmentsPages(int ModuleId)
        {

            return CBO.FillCollection<DepartmentsPageInfo>(DataProvider.Instance().GetDepartmentsPages(ModuleId));

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
        public DepartmentsPageInfo GetDepartmentsPage(int ModuleId, int ItemId)
        {

            return (DepartmentsPageInfo)CBO.FillObject(DataProvider.Instance().GetDepartmentsPage(ModuleId, ItemId), typeof(DepartmentsPageInfo));

        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// adds an object to the database 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="objDepartmentsPage">The DepartmentsPageInfo object</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public void AddDepartmentsPage(DepartmentsPageInfo objDepartmentsPage)
        {

            if (objDepartmentsPage.Content.Trim() != "")
            {
                DataProvider.Instance().AddDepartmentsPage(objDepartmentsPage.ModuleId, objDepartmentsPage.Content, objDepartmentsPage.CreatedByUser);
            }

        }

        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// saves an object to the database 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="objDepartmentsPage">The DepartmentsPageInfo object</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public void UpdateDepartmentsPage(DepartmentsPageInfo objDepartmentsPage)
        {

            if (objDepartmentsPage.Content.Trim() != "")
            {
                DataProvider.Instance().UpdateDepartmentsPage(objDepartmentsPage.ModuleId, objDepartmentsPage.ItemId, objDepartmentsPage.Content, objDepartmentsPage.CreatedByUser);
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
        public void DeleteDepartmentsPage(int ModuleId, int ItemId)
        {

            DataProvider.Instance().DeleteDepartmentsPage(ModuleId, ItemId);

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

            List<DepartmentsPageInfo> colDepartmentsPages = GetDepartmentsPages(ModInfo.ModuleID);
            foreach (DepartmentsPageInfo objDepartmentsPage in colDepartmentsPages)
            {
                SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDepartmentsPage.Content, objDepartmentsPage.CreatedByUser, objDepartmentsPage.CreatedDate, ModInfo.ModuleID, objDepartmentsPage.ItemId.ToString(), objDepartmentsPage.Content, "ItemId=" + objDepartmentsPage.ItemId.ToString());
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

            List<DepartmentsPageInfo> colDepartmentsPages = GetDepartmentsPages(ModuleID);
            if (colDepartmentsPages.Count != 0)
            {
                strXML += "<DepartmentsPages>";
                foreach (DepartmentsPageInfo objDepartmentsPage in colDepartmentsPages)
                {
                    strXML += "<DepartmentsPage>";
                    strXML += "<content>" + XmlUtils.XMLEncode(objDepartmentsPage.Content) + "</content>";
                    strXML += "</DepartmentsPage>";
                }
                strXML += "</DepartmentsPages>";
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

            XmlNode xmlDepartmentsPages = Globals.GetContent(Content, "DepartmentsPages");
            foreach (XmlNode xmlDepartmentsPage in xmlDepartmentsPages.SelectNodes("DepartmentsPage"))
            {
                DepartmentsPageInfo objDepartmentsPage = new DepartmentsPageInfo();
                objDepartmentsPage.ModuleId = ModuleID;
                objDepartmentsPage.Content = xmlDepartmentsPage.SelectSingleNode("content").InnerText;
                objDepartmentsPage.CreatedByUser = UserId;
                AddDepartmentsPage(objDepartmentsPage);
            }

        }

        #endregion

    }
}