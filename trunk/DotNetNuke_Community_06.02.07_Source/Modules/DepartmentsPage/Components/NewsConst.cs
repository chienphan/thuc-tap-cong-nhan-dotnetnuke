using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DNN.Modules.DepartmentsPage.Components
{
    public class NewsConst
    {
        NewsConst()
        {
            //hardcode tabid.
            _mapTabID.Add(56, 1);
            _mapTabID.Add(98, 2);		
            _mapTabID.Add(101, 3);
            _mapTabID.Add(99, 4); 		 
            _mapTabID.Add(102, 5);
            _mapTabID.Add(100, 6);
            _mapTabID.Add(103, 7);
        }
        private static NewsConst _instance = null;
        private static Dictionary<int, int> _mapTabID = null;

        public static NewsConst getInstance
        {
            get
            {
                if (_instance == null)
                {
                    _mapTabID = new Dictionary<int, int>();
                    _instance = new NewsConst();
                }
                return _instance;
            }
        }
        public int GetDepertmentIDFromTabID(int TabID)
        {
            try
            {
                return _mapTabID[TabID];
            }
            catch (System.Exception ex)
            {
            	
            }
            return 0;
        }
    }
}