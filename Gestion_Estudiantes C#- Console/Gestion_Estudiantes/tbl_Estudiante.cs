//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Gestion_Estudiantes
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_Estudiante
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_Estudiante()
        {
            this.tbl_Control_asistencia = new HashSet<tbl_Control_asistencia>();
        }
    
        public int Matricula { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Sexo { get; set; }
        public string Email { get; set; }
        public Nullable<int> Calificacion { get; set; }
        public Nullable<int> Asignatura_activa { get; set; }
    
        public virtual tbl_Asignatura tbl_Asignatura { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Control_asistencia> tbl_Control_asistencia { get; set; }
    }
}
