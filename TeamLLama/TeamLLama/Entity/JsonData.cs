using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamLLama.Entity
{
    public class JsonData
    {
        public string found { get; set; }
        public string totalNumPages { get; set; }
        public string pageNum { get; set; }
        public List<SearchResults> results { get; set; }
    }
}