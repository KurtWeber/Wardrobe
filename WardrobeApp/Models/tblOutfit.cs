//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WardrobeApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblOutfit
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblOutfit()
        {
            this.tblWardrobes = new HashSet<tblWardrobe>();
        }
    
        public int OutfitID { get; set; }
        public string OutfitName { get; set; }
        public int TypeID { get; set; }
        public int SeasonID { get; set; }
        public int OccasionID { get; set; }
    
        public virtual tblOccasion tblOccasion { get; set; }
        public virtual tblSeason tblSeason { get; set; }
        public virtual tblType tblType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblWardrobe> tblWardrobes { get; set; }
    }
}