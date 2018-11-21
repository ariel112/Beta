<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\depa_asignado;
use App\departamento;
use DB;
use Carbon\Carbon;

use App\Exports\UsersExport;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Controllers\Controller;


class UserController extends Controller
{


    /*Carbon para ponerlo en espanol*/
    public function __construct(){
           Carbon::setLocale('es');
                                 }
    /*Index principal*/
    public function index(){
        $users = DB::select("
            SELECT A.id AS id, A.name AS name, A.type AS type, A.email AS email, A.created_at AS created_at, A.img_url as img_url
              FROM users A
              WHERE A.type !='Administrador';
         ");

    return view("user/index")->with("users",$users);
                        }

    /**/
    public function perfil($id){

            $acciones = DB::select("
              SELECT B.name AS nombre, B.type as type, B.email as email,A.created_at as fecha, C.nombre as accion,E.nombre AS beca, D.color AS color
                FROM users_has_becas A
                INNER JOIN users B
                ON(A.users_id=B.id)
                INNER JOIN tipo_accion c
                on(A.tipo_accion_id=C.id)
                INNER JOIN color D 
                ON(C.color_id=D.id)
                INNER JOIN becas E
                ON(A.becas_id=E.id)
                WHERE B.id='$id';
          
             ");
            $depars =  DB::select("                
                SELECT B.id_depto AS id_depto , b.departamento as departamento
                    FROM(
                    SELECT b.departamento_id_depto as id
                    FROM departamento A
                    RIGHT JOIN depa_asignado B 
                    ON(A.id_depto =B.id)
                    WHERE  B.estado = 'Activo' AND b.users_id ='$id' ) a
                    RIGHT JOIN departamento b
                    ON(a.id= b.id_depto) 
                    WHERE a.id is null
             ");
               
            $sesiones = DB::select("
                 SELECT B.name AS name, B.type AS type, A.created_at AS fecha 
                    FROM historial_sesiones A
                    LEFT JOIN users B 
                    ON(A.users_id=B.id)                  
                    WHERE B.id ='$id'
                    ORDER BY fecha DESC
                    ;
             ");
      
            $carbon=Carbon::now();
            $depas =  DB::select("            
            SELECT B.departamento as name, A.created_at as fecha, A.id as id
            FROM depa_asignado A
            INNER JOIN departamento B 
            ON(A.departamento_id_depto=B.id_depto)
            WHERE users_id ='$id' AND A.estado = 'Activo' ");
            $user = User::find($id);
    return view("user/perfil")->with("user",$user)->with("depas",$depas)->with("carbon",$carbon)->with('depars',$depars)->with('sesiones',$sesiones)->with('acciones',$acciones);
                               }  

    /*Peticion ajac para desactivar los departamentos a los empleados*/ 
    public function estado(Request $request,$id){
           if($request->ajax()){
              $carbon=Carbon::now();
              $depa= depa_asignado::find($id);
              $depa->estado='Inactivo';
              $depa->save();           
               return response()->json([
                "message" => "Se desactivo correctamente"
             ]);  
                              }          

                                               }

    /*Peticion ajax para asiganrle el cargo a los empleados*/
    public function cargo(Request $request,$id){ 
               if($request->ajax()){
                  $carbon=Carbon::now();
                  $users=User::find($id);
                  $users->type=$request->type;              
                  $users->updated_at=$carbon;                 
                  $users->save();
                   return response()->json([
                    "message" => "Se realizo correctamente"
                 ]); 
                                  } 
                                                }

    /*asginarle el departamento*/ 
    public function depa(Request $request, $id){
                if($request->ajax()){
                  $carbon=Carbon::now();
                  $users=User::find($id);
                  $depa= new depa_asignado();
                  $depa->created_at=$carbon;
                  $depa->users_id=$users->id;
                  $depa->departamento_id_depto=$request->departamento_id_depto;
                  $depa->estado="Activo";
                  $depa->save();
                   return response()->json([
                        "message" => "Se realizo correctamente"
                     ]);
                                     }
                                             }


    /*Uso el create para mostrar todas las sesiones de los empleadoas*/
    public function create(){
      $sesiones = DB::select("
          SELECT B.name AS name, B.type AS type, A.created_at AS fecha 
            FROM historial_sesiones A
            LEFT JOIN users B 
            ON(A.users_id=B.id)
            ORDER BY fecha DESC;
         ");
  
    return view("user/sesiones")->with('sesiones',$sesiones);
                            }

    public function store(Request $request)
    {
        //
    }


     /*
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
         
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }



    /*Va a registrar todas las acciones que el usuario haga en el sistema*/
     public function bitacora(){
           $acciones = DB::select("
              
SELECT 
   B.name AS usuario, 
   B.type as type, 
   B.email as email,
   A.created_at as fecha, 
   C.nombre as accion,
   E.nombre AS nombre,
   D.color AS color
                FROM users_has_becas A
                INNER JOIN users B
                ON(A.users_id=B.id)
                INNER JOIN tipo_accion c
                on(A.tipo_accion_id=C.id)
                INNER JOIN color D 
                ON(C.color_id=D.id)
                INNER JOIN becas E
                ON(A.becas_id=E.id)

         UNION ALL       
               
SELECT  
   B.name AS usuario, 
   B.type as type, 
   B.email as email, 
   A.created_at as fecha, 
   C.nombre as accion, 
   CONCAT(E.periodo, ' ',Date_format(E.inicio,'%Y'),' ',F.abreviatura )AS nombre, 
   D.color AS color
                FROM users_has_calendario_universidad A
                INNER JOIN users B
                ON(A.users_id=B.id)
                INNER JOIN tipo_accion c
                on(A.tipo_accion_id=C.id)
                INNER JOIN color D 
                ON(C.color_id=D.id)
                INNER JOIN calendario_universidad E
                ON(A.calendario_universidad_id=E.id)
                INNER JOIN universidad F
                ON(E.universidad_id=F.id)               

        UNION ALL   

SELECT  
   B.name AS usuario, 
   B.type as type, 
   B.email as email, 
   A.created_at as fecha, 
   C.nombre as accion, 
   CONCAT(Date_format(E.created_at,'%Y'),' ',F.abreviatura )AS nombre, 
   D.color AS color
                FROM  users_has_meses_universidad A
                INNER JOIN users B
                ON(A.users_id=B.id)
                INNER JOIN tipo_accion c
                on(A.tipo_accion_id=C.id)
                INNER JOIN color D 
                ON(C.color_id=D.id)
                INNER JOIN pagos_meses_universidad E
                ON(E.id=A.pagos_meses_universidad_id)
                INNER JOIN universidad F
                ON(E.universidad_id=F.id)

    UNION ALL

SELECT 
   B.name AS usuario, 
   B.type as type, 
   B.email as email,
   A.created_at as fecha, 
   C.nombre as accion,
   E.nombre AS nombre,
   D.color AS color
                FROM users_has_nombre_complementaria A
                INNER JOIN users B
                ON(A.users_id=B.id)
                INNER JOIN tipo_accion c
                on(A.tipo_accion_id=C.id)
                INNER JOIN color D 
                ON(C.color_id=D.id)
                INNER JOIN nombre_complementaria E
                ON(A.nombre_complementaria_id=E.id)

      UNION ALL 
SELECT 
   B.name AS usuario, 
   B.type as type, 
   B.email as email,
   A.created_at as fecha, 
   C.nombre as accion,
   F.nombre AS nombre,
   D.color AS color
                FROM users_has_actualizacion_periodo A
                INNER JOIN users B
                ON(A.users_id=B.id)
                INNER JOIN tipo_accion c
                on(A.tipo_accion_id=C.id)
                INNER JOIN color D 
                ON(C.color_id=D.id)
                INNER JOIN actualizacion_periodo E
                ON(A.actualizacion_periodo_id=E.id)
                INNER JOIN datos_personales F
                ON(E.id_datos_personales=F.id)                    ;                         
             ");
           return view("user/bitacora")->with('acciones',$acciones);
    }
}
