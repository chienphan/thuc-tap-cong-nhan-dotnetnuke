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
using System.Data;
using DotNetNuke;

namespace DNN.Modules.DemoGobom
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// An abstract class for the data access layer 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    public abstract class DataProvider
    {

        #region "Shared/Static Methods"

        /// <summary>
        /// singleton reference to the instantiated object 
        /// </summary>
        private static DataProvider objProvider = null;

        /// <summary>
        /// constructor
        /// </summary>
        static DataProvider()
        {
            CreateProvider();
        }

        /// <summary>
        /// dynamically create provider 
        /// </summary>
        private static void CreateProvider()
        {
            objProvider = (DataProvider)DotNetNuke.Framework.Reflection.CreateObject("data", "DNN.Modules.DemoGobom", "");
        }

        /// <summary>
        /// return the provider 
        /// </summary>
        /// <returns></returns>
        public static DataProvider Instance()
        {
            return objProvider;
        }

        #endregion

        #region "Abstract methods"

        public abstract IDataReader GetDemoGoboms(int ModuleId);
        public abstract IDataReader GetDemoGobom(int ModuleId, int ItemId);
        public abstract IDataReader GetDemo(int ModuleId, int ItemId, int GobomId);
        public abstract void AddDemoGobom(int ModuleId, string Content, int UserId);
        public abstract void UpdateDemoGobom(int ModuleId, int ItemId, string Content, int UserId);
        public abstract void DeleteDemoGobom(int ModuleId, int ItemId);

        #endregion

    }
}