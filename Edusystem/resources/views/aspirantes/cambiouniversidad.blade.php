@extends('sidebar.sidebar')

@section('script-content')


/*evento para las teclas solo numeros*/
function valida(e){
    tecla = (document.all) ? e.keyCode : e.which;

    //Tecla de retroceso para borrar, siempre la permite
    if (tecla==8){
        return true;
    }
        
    // Patron de entrada, en este caso solo acepta numeros
    patron =/[0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
}


/*Evento para evento de letras */

   function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }

@endsection


@section('content')

      <!-- page content -->
        <div class="right_col" role="main">
        
         
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Cambio de Universidad del becario</h2>
                   
                    <div class="clearfix"></div>
                  </div>
                  <div class="fondo-beca" >
                    <br/>


                    
                
 			 {!! Form::open(['route' => ['update.cambiouniversidad',$aspirante->id], 'method'=>'PUT', 'files'=>true, 'id'=>'formAspi','data-parsley-validate','class'=>'form-horizontal form-label-left']) !!}
  		        <input type="text" name="users_id" style="display: none;" value="{{Auth::user()->id}}">
 					   <div align="center"><h2>INFORMACIÓN DEL(LA) ESTUDIANTE </h2> </div> 
             
                          <br>
                          <br>
                          <div align="center"><h2>CENTRO UNIVERSITARIO</h2></div>                          
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Universidad:
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                            <select id="universidad" class="form-control" name="universidad_id" required>
                              @foreach($universidades as $universidad)
                              @if($listUnivesidad==$universidad->id)
                              <option selected value="{{$universidad->id}}">{{$universidad->nombre}}</option>
                              @else
                               <option value="{{$universidad->id}}">{{$universidad->nombre}}</option>
                              @endif                                                          
                              @endforeach    
		                      </select>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" >Campus
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  id="campus" class="form-control"  required >
			                      <option selected value="{{$id_campus}}">{{$nombre_campus}}</option>		                      
			                    </select>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" >Facultad
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  id="facultad" class="form-control"  required >
                            <option selected value="{{$id_facultad}}">{{$nombre_facultad}}</option>                          
                          </select>
                            </div>
                          </div>
                          <input type="text" name="idd_carrera" style="display: none;" value="{{$idd_carrera}}">
                         <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" >Carrera
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  id="carrera" name="carrera_id" class="form-control"  required >
                            <option selected value="{{$id_carrera}}">{{$nombre_carrera}}</option>                          
                          </select>
                            </div>
                          </div>
                           <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" >Cuenta Universitaria:
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" value="{{$aspirante->cuenta_universitaria}}"  name="cuenta_universitaria" required  onkeypress="return valida(event)" maxlength="11" minlength="11"  class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>                          
						              <br>
                          <br>
						          <div align="center">
                        <div class="ln_solid"></div>
                        <div class="form-group">
                          <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">   
                               {!! Form::submit('Registrar',['class'=>'btn btn-success','id'=>'btnEmpty' ]) !!}
                          </div>
                        </div>    
                      </div>
                    
                  {{Form::close()}}

                  </div>
                </div>
              </div>
            </div>
        </div>
        <!-- /page content -->




@endsection


@section('script')


	    
    <!--Este script es para las peticiones con ajax -->
    <script src="{{ asset('js/script.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js')}}"></script>
    <!-- bootstrap-wysiwyg -->
    <script type="text/javascript" src="{{asset('template/vendors/jquery.hotkeys/jquery.hotkeys.js')}}"></script> 
    <script type="text/javascript" src="{{asset('template/vendors/google-code-prettify/src/prettify.js')}}"></script>    
    <!-- jQuery Tags Input -->
    <script type="text/javascript" src="{{asset('template/vendors/jquery.tagsinput/src/jquery.tagsinput.js')}}"></script>

    

    <!-- Switchery -->
    <script type="text/javascript" src="{{asset('template/vendors/switchery/dist/switchery.min.js')}}"></script>
    <!-- Select2 -->
    <script type="text/javascript" src="{{asset('template/vendors/select2/dist/js/select2.full.min.js')}}"></script>
    <!-- Parsley -->
    <script type="text/javascript" src="{{asset('template/vendors/parsleyjs/dist/parsley.js')}}"></script>
    <!-- Autosize -->
    <script type="text/javascript" src="{{asset('template/vendors/autosize/dist/autosize.min.js')}}"></script>   
    <!-- jQuery autocomplete -->
    <script type="text/javascript" src="{{asset('template/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js')}}"></script>
    <!-- starrr -->
    <script type="text/javascript" src="{{asset('template/vendors/starrr/dist/starrr.js')}}"></script> 
    

@endsection