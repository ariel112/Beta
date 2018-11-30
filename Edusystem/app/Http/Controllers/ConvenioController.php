<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Universidad;
use DB;
use App\Imports\ConvenioImports;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Controllers\Controller;
use App\Temporal_actualizacion_periodo;

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
        return view('convenio.cargar_convenio')->with('respuesta',$respuesta)->with('temporales',$temporales);
    }

     public function importFile()
    {    
         DB::table('temporal_actualizacion_periodo')->truncate();   
         $temporales = Temporal_actualizacion_periodo::all();        
         
         Excel::import(new ConvenioImports, request()->file('excel'));
$respuesta= 'NO';
         return view('convenio.cargar_convenio')->with('temporales',$temporales)->with('respuesta',$respuesta);
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
