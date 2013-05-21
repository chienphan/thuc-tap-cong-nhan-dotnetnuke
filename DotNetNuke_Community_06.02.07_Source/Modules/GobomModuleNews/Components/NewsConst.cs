using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GobomDNN.Modules.GobomModuleNews.Components
{
    public class NewsConst
    {
        NewsConst()
        {
            //hardcode tabid.
            _mapTabID.Add(89, 1);//Khoa hoc va cong nghe
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
        public int GetTagNewsIDFromTabID(int TabID)
        {
            return _mapTabID[TabID];
        }
    }
}