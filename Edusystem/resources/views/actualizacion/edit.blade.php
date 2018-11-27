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
                    <h2>Editando el promedio del becario</h2>                   
                    <div class="clearfix"></div>
                  </div>
                  <div class="fondo-beca">                    
                    <br/>

 		{!! Form::open(['route' => ['actualizacion.update',$actualizacion->id], 'method'=>'PUT', 'files'=>true,'data-parsley-validate']) !!}	 			 <input type="text" name="users_id" style="display: none;" value="{{Auth::user()->id}}">		                 
         <input type="text" name="id_datos_personales" style="display: none;" value="{{$actualizacion->id_datos_personales}}">                                         
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Indice Global:</label>
            <input onkeypress="return valida(event)" maxlength="3" type="text" value="{{$actualizacion->promedio_periodo}}" name="promedio_global" class="form-control" style="width: 60px;" required>
          </div>
          <div class="form-group" >
            <label for="message-text" class="col-form-label">Indice del periodo:</label>
            <input onkeypress="return valida(event)" maxlength="3" type="text" value="{{$actualizacion->promedio_global}}" name="promedio_periodo" class="form-control " style="width: 60px;" required>
          </div>     
             </div>
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


@endsection







