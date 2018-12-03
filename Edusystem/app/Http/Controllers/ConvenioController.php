<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Universidad;
use DB;
use App\Imports\ConvenioImports;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Controllers\Controller;
use App\Temporal_actualizacion_periodo;
use App\Datos_personales;
use App\Actualizacion_periodo;

class ConvenioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    { 
        $respuesta= 'NO';
        $temporales = Temporal_actualizacion_periodo::all(); 
        $mensaje1 = DB::select("
            SELECT 
               CONCAT('Hay ',COUNT(*),' registros de PROMEDIO GLOBAL con nota mayor a 100!!! Por favor verifique su informacion') as mensaje, COUNT(*) as contador 
                FROM temporal_actualizacion_periodo
                WHERE promedio_global>100;

         ");
        $mensaje2 = DB::select("
            SELECT 
            CONCAT('Hay ',COUNT(*),' registros de PROMEDIO PERIODO con nota mayor a 100!!! Por favor verifique su informacion') as mensaje, COUNT(*) as contador
                FROM temporal_actualizacion_periodo 
                WHERE promedio_periodo>100;    

         ");
        $mensaje3 = DB::select("
        SELECT CONCAT('El sistema dectecto solo ',COUNT(*), ' Identidades que concuerdan con nuestra base de datos' ) as mensaje
                FROM temporal_actualizacion_periodo A
                INNER JOIN datos_personales B
                WHERE A.identidad=B.identidad 
         ");

        return view('convenio.cargar_convenio')->with('respuesta',$respuesta)->with('temporales',$temporales)->with('mensaje1',$mensaje1)->with('mensaje2',$mensaje2)->with('mensaje3',$mensaje3);
    }

     public function importFile()
    {    

         DB::table('temporal_actualizacion_periodo')->truncate();          
         
         Excel::import(new ConvenioImports, request()->file('excel'));
         $respuesta= 'NO';
         $temporales = Temporal_actualizacion_periodo::all(); 
          $mensaje1 = DB::select("
            SELECT 
               CONCAT('Hay ',COUNT(*),' registros de promedio periodo con nota mayor a 100!!! Por favor verifique su informacion') as mensaje
                FROM temporal_actualizacion_periodo
                WHERE promedio_global>100;

         ");
        $mensaje2 = DB::select("
            SELECT 
            CONCAT('Hay ',COUNT(*),' registros de promedio periodo con nota mayor a 100!!! Por favor verifique su informacion') as mensaje
                FROM temporal_actualizacion_periodo 
                WHERE promedio_periodo>100;    

         ");
         return view('convenio.cargar_convenio')->with('temporales',$temporales)->with('respuesta',$respuesta)->with('mensaje1',$mensaje1)->with('mensaje2',$mensaje2);
    }

    public function verifica(){

        $temporales = Temporal_actualizacion_periodo::all();     
        $datos = Datos_personales::all();
 
        foreach ($datos as $dato) {
            foreach ($temporales as $temporal) {
                    if($dato->identidad==$temporal->identidad){
                         $temporal = Temporal_actualizacion_periodo::find($temporal->id);
                         $temporal->id_datos_personales=$dato->id;
                         $temporal->save();
    
                      }
            }
        }
       
        return redirect()->route('convenio.index');
    }

    public function cargo(){

        $temporales = Temporal_actualizacion_periodo::all(); 
            foreach ($temporales as $temporal) {

            $verificas = DB::select("
                SELECT COUNT(*) as estado
                FROM actualizacion_periodo 
                WHERE id_datos_personales='$temporal->id_datos_personales' AND calendario_universidad_id= '$temporal->calendario_universidad_id';
             ");
             foreach($verificas as $verifica)   
                        if($verifica->estado==0 AND $temporal->id_datos_personales!=''){                            
                        $actualizacion = new Actualizacion_periodo();
                        $actualizacion->id_datos_personales = $temporal->id_datos_personales;
                        $actualizacion->calendario_universidad_id =$temporal->calendario_universidad_id;
                        $actualizacion->promedio_global =$temporal->promedio_global;
                        $actualizacion->promedio_periodo =$temporal->promedio_periodo;
                        $actualizacion->save();
                        
                        }
        }
        return redirect()->route('convenio.index');
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {   $universidades = Universidad::all();
        return view('convenio/create')->with('universidades',$universidades);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

   
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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

   
}
