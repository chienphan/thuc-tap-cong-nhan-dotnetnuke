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
            _mapTabID.Add(92, 4); //tuyen dung 				
            _mapTabID.Add(95, 7); //hoc bong du hoc 
            _mapTabID.Add(90, 2); //tin nong 		 
            _mapTabID.Add(93, 5);//hop tac quoc te 	
            _mapTabID.Add(96, 8);//tin tuc tren cac bao 
            _mapTabID.Add(91, 3);//   Sinh vien 
            _mapTabID.Add(94, 6);//giao duc dao tao	
            _mapTabID.Add(97, 9);//thong bao 	
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