using System.Collections.Generic;

namespace TeamLLama.Entity
{
    public class GovResult
    {
        public string resource_id { get; set; }
        public List<Fields> fields{get;set;}
        public List<Pharmacy> records { get; set; }
    }
}