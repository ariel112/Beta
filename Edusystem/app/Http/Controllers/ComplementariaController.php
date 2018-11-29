<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Complementaria_planilla;
use App\Datos_personales;
use App\Nombre_complementaria;
use DB;
use Carbon\Carbon;

use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ComplementariaExport;


class ComplementariaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {  

       $datos = Datos_personales::all();

       return view('planilla_complementaria/index')->with('datos', $datos);
    }



     public function perfil($id)    
    {
        $becarios = DB::select("                                    
                                  SELECT  
                                   A.id as id,         
                                   A.id_cargo AS cargo, 
                                   A.identidad AS identidad,
                                   A.nombre AS  nombre,
                                   A.genero AS genero, 
                                   A.estado_civil AS estado_civil, 
                                   A.fecha_nacimiento AS fecha_nacimiento,
                                   A.email AS email, 
                                   A.cuenta_universitaria AS cuenta_universitaria, 
                                   A.ciudad AS ciudad,
                                   A.celular AS celular,
                                   C.nombre AS carrera,
                                   D.nombre AS facultad,
                                   E.nombre AS campus,
                                   F.nombre AS universidad,
                                   F.url_imagen AS imagenUniversidad,
                                   F.abreviatura AS abreUniversidad,
                                   G.identidad AS identidadDependiente,
                                   G.nombre_completo AS nombreDependiente,
                                   G.email AS emailDependiente,
                                   G.celular AS celularDependiente,
                                   G.parentesco AS parentesco,
                                   H.identidad AS identidadPadre,
                                   H.nombre_completo AS nombrePadre,
                                   H.email AS emailPadre,
                                   H.celular AS celularPadre,
                                   I.identidad AS identidadMadre,
                                   I.nombre_completo AS nombreMadre,
                                   I.email AS emailMadre,
                                   I.celular AS celularMadre,
                                   J.nombre AS beca,
                                   J.monto AS montoBeca,
                                   k.nombre_cargo AS cargo,
                                   K.monto AS montoCargo
                                   
                                   
                            FROM datos_personales A
                            INNER JOIN datos_personales_has_carreras B
                            ON(A.id=B.id_datos_personales)
                            INNER JOIN carreras C
                            ON(B.carrera_id=C.id)
                            INNER JOIN facultad D
                            ON(C.facultad_id=D.id)
                            INNER JOIN campus E
                            ON(D.campus_id=E.id)
                            INNER JOIN universidad F
                            ON(E.universidad_id=F.id)
                            INNER JOIN persona_dependiente G
                            ON(A.id=G.id_datos_personales)
                            LEFT JOIN datos_padre H
                            ON(A.id_padre=H.id)
                            LEFT JOIN datos_madre I
                            ON(A.id_madre=I.id)
                            INNER JOIN becas J
                            ON(A.becas_id=J.id)
                            LEFT JOIN tipo_cargo K
                            ON(A.id_cargo=K.id_cargo)
                            WHERE A.id='$id';
         ");

        $expedientes = DB::select("
            SELECT 
              B.url,
              B.periodo, 
              B.anio
                FROM datos_personales A
                INNER JOIN digitalizacion_documentos B
                ON(A.id=B.datos_personales_id)
                WHERE A.id='$id';        
                         ");

        
          
$nombres = DB::select("

                SELECT X.id as id, X.nombre as nombre, X.estado as estado, X.fecha as fecha
                FROM nombre_complementaria X
                LEFT JOIN (
                SELECT A.nombre_complementaria_id AS id, A.datos_personales_id
                FROM planilla_complementaria A
                WHERE A.datos_personales_id='$id') Y
                ON(Y.id=X.id)
                WHERE Y.id IS NULL  AND X.estado= 'Activo'

                 
           ");

$complementaria = DB::select("
             SELECT B.nombre AS complementaria, date_format(B.fecha, '%Y-%m' )as mes, A.created_at as fecha, C.name AS usuario
              FROM planilla_complementaria A
              INNER JOIN nombre_complementaria B
              ON(A.nombre_complementaria_id=B.id)
              INNER JOIN users C
              ON(A.users_id=C.id)
              WHERE A.datos_personales_id='$id';
   ");


        return view('planilla_complementaria/perfil')->with("becarios",$becarios)->with('expedientes',$expedientes)->with('nombres',$nombres)->with('complementaria',$complementaria); 
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $nuevo='NO';
        $complementarias = DB::select("
                        SELECT *
            FROM nombre_complementaria;
         ");
            
        return view('planilla_complementaria/complementaria')->with('nuevo',$nuevo)->with('complementarias',$complementarias);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
      public function store(Request $request)
    {   
        $fechas= DB::select("
            SELECT *
              FROM nombre_complementaria
              WHERE id='$request->nombre_complementaria_id';
                          ");

        foreach ($fechas as $fecha) {
          $mes=$fecha->fecha;
        }

        $complementaria= new Complementaria_planilla($request->all());
        $complementaria->fecha =$mes;
        
        
        $complementaria->save();

    return redirect()->route('complementaria.perfil',$complementaria->datos_personales_id);
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        dd('estas aqui');
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

    public function generacomplementaria(Request $request){
      $fecha1= Nombre_complementaria::find($request->complementaria);

      $date= $fecha1->id;
      
      $carbon=Carbon::now();     
        $fecha = Carbon::parse($fecha1->fecha);
        
        $mfecha = $fecha->format("m");
        $yfecha =  $fecha->format("Y");
      
        
        /*condicion para sacar el mes en espanol*/
         if($mfecha==01)    
            $mesP='Enero';
         if($mfecha==02)    
            $mesP='Febrero';
         if($mfecha==03)    
            $mesP='Marzo';
         if($mfecha==04)    
            $mesP='Abril';
         if($mfecha==05)    
            $mesP='Mayo';
         if($mfecha==06)    
            $mesP='Junio';
         if($mfecha==07)    
            $mesP='Julio';
         if($mfecha==8)    
            $mesP='Agosto';
         if($mfecha==9)    
            $mesP='Septiembre';
         if($mfecha==10)    
            $mesP='Octubre';
         if($mfecha==11)    
            $mesP='Noviembre';
         if($mfecha==12)    
            $mesP='Diciembre';
       


      $nuevo = DB::select("
          SELECT 
                    A.nombre,
                    B.datos_personales_id,
                    C.genero AS genero,
                    C.identidad AS identidad,
                    C.nombre AS nombre,
                    C.celular AS celular,
                    I.departamento AS departamento,
                    X.nombre AS universidad,
                    X.abreviatura as abreviatura
                FROM nombre_complementaria A
                LEFT JOIN planilla_complementaria B
                ON(B.nombre_complementaria_id=A.id)
                INNER JOIN datos_personales C
                ON(B.datos_personales_id=C.id)
                INNER JOIN datos_personales_has_carreras D
                ON(D.id_datos_personales=C.id)
                INNER JOIN carreras E
                ON(D.carrera_id=E.id)
                INNER JOIN facultad F
                ON(E.facultad_id=F.id)
                INNER JOIN campus G
                ON(F.campus_id=G.id)
                INNER JOIN universidad X
                ON(G.universidad_id=X.id)
                INNER JOIN municipio H
                ON(G.id_municipio=H.id_municipio)
                INNER JOIN departamento I
                ON(H.id_depto=I.id_depto)
          WHERE A.id = '$request->complementaria';
         ");
      $complementarias = DB::select("
                        SELECT *
            FROM nombre_complementaria;
         ");

      
      return view('planilla_complementaria/complementaria')->with('nuevo',$nuevo)->with('complementarias',$complementarias)->with('mesP',$mesP)->with('date',$date);
       
    }



    public function GETcomplementaria($complementaria){
      $complementarias= select::DB("
        SELECT 
              A.nombre,
                B.datos_personales_id,
                C.genero AS genero,
                C.identidad AS identidad,
                C.nombre AS nombre,
                C.celular AS celular,
                I.departamento AS departamento
            FROM nombre_complementaria A
            LEFT JOIN planilla_complementaria B
            ON(B.nombre_complementaria_id=A.id)
            INNER JOIN datos_personales C
            ON(B.datos_personales_id=C.id)
            INNER JOIN datos_personales_has_carreras D
            ON(D.id_datos_personales=C.id)
            INNER JOIN carreras E
            ON(D.carrera_id=E.id)
            INNER JOIN facultad F
            ON(E.facultad_id=F.id)
            INNER JOIN campus G
            ON(F.campus_id=G.id)
            INNER JOIN municipio H
            ON(G.id_municipio=H.id_municipio)
            INNER JOIN departamento I
            ON(H.id_depto=I.id_depto)
            WHERE A.nombre ='complementaria becas';
       ");

      return view('planilla_complementaria/complementaria')->with('complementarias',$complementarias);
    }



public function export($date){
               

return (new ComplementariaExport($date))->download('Complementaria.xlsx');
    }






}
