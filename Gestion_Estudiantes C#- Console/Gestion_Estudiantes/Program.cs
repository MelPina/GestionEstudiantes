using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestion_Estudiantes
{
    class Program
    {
        static void Main(string[] args)
        {


            using (GESTION_ESTUDIANTESEntities db = new GESTION_ESTUDIANTESEntities())
            {
                
                string elc;
                do
                {
                    Console.Clear();
                    //BY MEL PIÑA
                    Console.WriteLine("----------------------------------------------------------------------");
                    Console.WriteLine("Bienvenido");
                    Console.WriteLine("----------------------------------------------------------------------");
                    Console.WriteLine("1. Consulta o lectura de todos los registro de Estudiantes");
                    Console.WriteLine("2. Agregar un nuevo Estudiante ");
                    Console.WriteLine("3. Actualizar el registro de un Estudiante");
                    Console.WriteLine("4. Borrar el registro de un Estudiante.");
                    Console.WriteLine("5. Pase de lista.");
                    Console.WriteLine("6. Consulta o lectura de todos los registro del Control de Asistencia");
                    Console.WriteLine("------------------------------------------------------------------------");
                    Console.WriteLine("Elija la opción correspondiente: ");
                    string op = Console.ReadLine();

                    switch (op)
                    {
                        case "1":
                            Console.Clear();
                            Console.WriteLine("----------------------------------------------------------------------------------");
                            Console.WriteLine("Consulta o lectura de todos los registro de Estudiantes");

                            Console.WriteLine("");                         
                            var registro = db.tbl_Estudiante;
                            Console.WriteLine("Matricula| Nombre | Apellidos | Sexo  | Email");
                            Console.WriteLine("----------------------------------------------------------------------------------------");
                            foreach (var readRegistro in registro)
                            {                                
                                Console.WriteLine(readRegistro.Matricula + " | " + readRegistro.Nombre + " | " + readRegistro.Apellidos + " | " + readRegistro.Sexo + " | "  + readRegistro.Email);
                            }
                            Console.Read();
                            Console.WriteLine("----------------------------------------------------------------------------------------");
                            break;

                        case "2":
                            Console.Clear();
                            Console.WriteLine("-------------------------------------");
                            Console.WriteLine("Agregar un nuevo Estudiante");
                            Console.WriteLine("-------------------------------------");
                            tbl_Estudiante addRegistro = new tbl_Estudiante();
                            Console.WriteLine("Introduzca el nombre: ");
                            string nombre = Console.ReadLine();
                            addRegistro.Nombre = nombre;
                            Console.WriteLine("Introduzca el Apellido: ");
                            string apellido = Console.ReadLine();
                            addRegistro.Apellidos = apellido;
                            Console.WriteLine("Introduzca el Sexo: ");
                            string sexo = Console.ReadLine();
                            addRegistro.Sexo = sexo;
                            Console.WriteLine("Introduzca el email del estudiante: ");
                            string email = Console.ReadLine();
                            addRegistro.Email = email;
                            Console.WriteLine("------------------------------------------------------");
                            Console.WriteLine("Introduzca el numero correspondiente a la materia activa del estudiante: ");
                            Console.WriteLine("1- Lengua Española ");
                            Console.WriteLine("2- Matemáticas  ");
                            Console.WriteLine("3- Ciencias sociales ");
                            Console.WriteLine("4- Ciencias naturales ");
                            Console.WriteLine("------------------------------------------------------");
                            int asignatura_activa = int.Parse(Console.ReadLine());
                            addRegistro.Asignatura_activa = asignatura_activa;
                            Console.WriteLine("Introduzca La Calificacion del Estudiante: ");
                            int calificacion = int.Parse(Console.ReadLine());
                            addRegistro.Calificacion = calificacion;
                            

                            db.tbl_Estudiante.Add(addRegistro);
                            db.SaveChanges();
                            Console.WriteLine("------------------------------------------------------");
                            Console.WriteLine("Agregado Correctamente!");
                            //BY MEL PIÑA
                            break;

                        case "3":
                            Console.Clear();
                            Console.WriteLine("-------------------------------------");
                            Console.WriteLine("Actualizar un Registro de Estudiante.");
                            Console.WriteLine("-------------------------------------");
                            Console.WriteLine(" 1: Actualizar por nombre ");
                            Console.WriteLine(" 2: Actualizar por apellido");
                            Console.WriteLine("-------------------------------------");
                            Console.WriteLine("Elija la opción correspondiente: ");
                            string opact = Console.ReadLine();
                            switch (opact)
                            {
                                
                                case "1":
                                    Console.WriteLine("-------------------------------------");
                                    Console.WriteLine("Actualizar por nombre");
                                    Console.WriteLine("-------------------------------------");
                                    Console.WriteLine("Introduzca el nombre que ya existe: ");
                                    string nom1 = Console.ReadLine();
                                    Console.WriteLine("Introduzca el nombre nuevo: ");
                                    string nom2 = Console.ReadLine();
                                    tbl_Estudiante editarRegistro = db.tbl_Estudiante.Where(d => d.Nombre == nom1).First();
                                    editarRegistro.Nombre = nom2;

                                    db.Entry(editarRegistro).State = System.Data.Entity.EntityState.Modified;
                                    db.SaveChanges();
                                    Console.WriteLine("Actualizar Correctamente!");
                                    break;
                                case "2":
                                    Console.WriteLine("-------------------------------------");
                                    Console.WriteLine("Actualizar por apellido");
                                    Console.WriteLine("-------------------------------------");
                                    Console.WriteLine("Introduzca el apellido que ya existe: ");
                                    string ape1 = Console.ReadLine();
                                    Console.WriteLine("Introduzca el apellido nuevo: ");
                                    string ape2 = Console.ReadLine();
                                    tbl_Estudiante editRegistroApe = db.tbl_Estudiante.Where(d => d.Apellidos == ape1).First();
                                    editRegistroApe.Apellidos = ape2;

                                    db.Entry(editRegistroApe).State = System.Data.Entity.EntityState.Modified;
                                    db.SaveChanges();
                                    Console.WriteLine("-------------------------------------------------------------------");
                                    Console.WriteLine("Actualizar Correctamente!");
                                    break;

                                default:
                                    Console.WriteLine("Introduzca un número dentro del rango");
                                    break;
                            }
                            //BY MEL PIÑA
                            break;
                        case "4":
                            Console.Clear();
                            Console.WriteLine("-------------------------------------");
                            Console.WriteLine("Borrar el registro de un Estudiante");
                            Console.WriteLine("-------------------------------------");
                            Console.WriteLine("Introduzca la matrícula del Estudiante que desea borrar: ");
                            int matr1 = int.Parse(Console.ReadLine());
                            tbl_Estudiante deleteRegistro = db.tbl_Estudiante.Where(d => d.Matricula == matr1).First();
                            db.tbl_Estudiante.Remove(deleteRegistro);
                            db.SaveChanges();
                            Console.WriteLine("-------------------------------------------------------------------");
                            Console.WriteLine("Eliminado Correctamente!");
                            //BY MEL PIÑA
                            break;
                        case "5":
                            Console.Clear();
                            Console.WriteLine("-------------------------------------");
                            Console.WriteLine("Pase de lista");
                            Console.WriteLine("-------------------------------------");
                            tbl_Control_asistencia addRegis = new tbl_Control_asistencia();
                            string date = DateTime.UtcNow.ToString("MM-dd-yyyy");
                            addRegis.Fecha = date;
                            Console.WriteLine("Introduzca la matrícula del Estudiante: ");
                            int matri = int.Parse(Console.ReadLine());
                            addRegis.matr_estudiante = matri;
                            Console.WriteLine("Introduzca el estado de asistencia del Estudiante: ");
                            Console.WriteLine("[P] Presente   [A] Ausente [E] Excusa");
                            string estado_asistencia = Console.ReadLine();
                            addRegis.Estado = estado_asistencia;

                            db.tbl_Control_asistencia.Add(addRegis);
                            db.SaveChanges();

                            Console.WriteLine("-------------------------------------------------------------------");
                            Console.WriteLine("Terminado Correctamente!");
                            //BY MEL PIÑA
                            break;
                        

                        case "6":
                            Console.Clear();
                            Console.WriteLine("-------------------------------------------------------------------");
                            Console.WriteLine(" Consulta de todos los registro del Control de Asistencia");
                            Console.WriteLine("-------------------------------------------------------------------");
                            var regis = db.tbl_Control_asistencia;
                            Console.WriteLine("Fecha      | Estado | Matrícula del estudiante ");
                            Console.WriteLine("-------------------------------------------------------------------");
                            foreach (var readRegistro in regis)
                            {
                                Console.WriteLine(readRegistro.Fecha + " |  " + readRegistro.Estado + "     | " + readRegistro.matr_estudiante + " ");
                            }
                            Console.Read();
                            Console.WriteLine("-------------------------------------------------------------------");
                            //BY MEL PIÑA
                            break;

                        default:
                            Console.WriteLine("Por favor introduzca again");
                            break;
                    }

                    Console.WriteLine(" Desea volver al menu principal? (si/no): ");
                    elc = Console.ReadLine();
                } while (elc == "si");
                
             
                //BY MEL PIÑA
            }
        }
    }
}
