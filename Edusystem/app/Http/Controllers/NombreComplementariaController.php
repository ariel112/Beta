<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Nombre_complementaria;
use App\Reportes\users_has_nombre_complementaria;
use DB;

class NombreComplementariaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$nombres = Nombre_complementaria::all();   
        return view('nombre_complementaria.index');
    }
    
     public function mostrar(){
        $nombres = Nombre_complementaria::all();
        $nombres= DB::select("
        SELECT id, users_id, nombre,  Date_format(fecha,'%Y-%m') as fecha, estado
            FROM nombre_complementaria
            ORDER BY fecha DESC; 
            ");   
        return view('nombre_complementaria.mostrar')->with('nombres',$nombres);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        

      return view('nombre_complementaria.create');
    }

    /*
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {          
        if( isset($request) ) {
                $nombre = new Nombre_complementaria($request->all());
                $nombre->fecha = $request->fecha.'-01';
                $nombre->save();
                              }

        $reporte = new users_has_nombre_complementaria();
        $reporte->users_id = $request->users_id;
        $reporte->nombre_complementaria_id = $nombre->id;       
        $reporte->tipo_accion_id =7;
        $reporte->save();        

        return redirect()->route('complementaria.mostrar')->with('success','Pago meses creado con exito!!');;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   public function show($id)
    {
       $nombre = Nombre_complementaria::find($id);
       $nombre->estado ='Desactivo'; 
       $nombre->save(); 
       return redirect()->route('complementaria.mostrar')->with('error','Desactivado con exito!!');
    }
    

    public function reporte($id, $id_usuario)
    {
        $nombre = Nombre_complementaria::find($id);
        $nombre->estado ='Desactivo';
        $nombre->save();

        /*Reporte */
        $reporte = new users_has_nombre_complementaria();
        $reporte->users_id = $id_usuario;
        $reporte->nombre_complementaria_id = $id;       
        $reporte->tipo_accion_id =8;  
        $reporte->save();  
       
       return redirect()->route('complementaria.mostrar') ->with('error','Desactivado con exito!!');
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
