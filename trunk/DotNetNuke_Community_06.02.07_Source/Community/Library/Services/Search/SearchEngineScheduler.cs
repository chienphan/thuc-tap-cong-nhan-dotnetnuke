#region Copyright
// 
// DotNetNuke� - http://www.dotnetnuke.com
// Copyright (c) 2002-2012
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
#endregion
#region Usings

using System;

using DotNetNuke.Services.Scheduling;

#endregion

namespace DotNetNuke.Services.Search
{
    /// -----------------------------------------------------------------------------
    /// Namespace:  DotNetNuke.Services.Search
    /// Project:    DotNetNuke
    /// Class:      SearchEngineScheduler
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The SearchEngineScheduler implements a SchedulerClient for the Indexing of
    /// portal content.
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    ///		[cnurse]	11/15/2004	documented
    /// </history>
    /// -----------------------------------------------------------------------------
    public class SearchEngineScheduler : SchedulerClient
    {
        public SearchEngineScheduler(ScheduleHistoryItem objScheduleHistoryItem)
        {
            ScheduleHistoryItem = objScheduleHistoryItem;
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// DoWork runs the scheduled item
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        ///		[cnurse]	11/15/2004	documented
        /// </history>
        /// -----------------------------------------------------------------------------
        public override void DoWork()
        {
            try
            {
                var se = new SearchEngine();
                se.IndexContent();
                ScheduleHistoryItem.Succeeded = true;
                ScheduleHistoryItem.AddLogNote("Completed re-indexing content");
            }
            catch (Exception ex)
            {
                ScheduleHistoryItem.Succeeded = false;
                ScheduleHistoryItem.AddLogNote("EXCEPTION: " + ex.Message);
                Errored(ref ex);
                Exceptions.Exceptions.LogException(ex);
            }
        }
    }
}