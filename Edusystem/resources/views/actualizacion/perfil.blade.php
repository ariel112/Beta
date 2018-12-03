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
			 		

@foreach($becarios as $becario)

<div class="right_col" role="main">

 <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Perfil del becario</h2>                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">	
                  <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  @if($becario->genero==1)
                  <div class="x_title"><img class="imagen-aspirantes " src="{{asset('images/estudentM.png')}}">
                  @else
                  <div class="x_title"><img class="imagen-aspirantes " src="{{asset('images/estudentF.png')}}">
                  @endif
                    
                  <div align="center">
                   <h2 class="mt-3">{{$becario->nombre}}</h2>
                  </div>
                  
                    <ul class="nav navbar-right panel_toolbox">
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div class="col-xs-3">
                      <!-- required for floating -->
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs tabs-left">                        
                        <li class="active"><a href="#home" data-toggle="tab">Actualizacón de documentos</a>
                        </li>
                        <li><a href="#profile" data-toggle="tab">Información Universitaria</a>
                        </li>
                        
                        <li><a href="#settings" data-toggle="tab">Datos Familiares</a>
                        </li>
                         <li><a href="#beca" data-toggle="tab">Datos Becas 20/20</a>
                        </li>                       
                      </ul>
                    </div>

                    <div class="col-xs-9">
                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div class="tab-pane active" id="home">             
                         <p class="lead">Actualizacion Documentos</p>                            
                           <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Actualizar Periodo </button>
                                 <table id="datatable" class="table table-striped table-bordered">
                                  <thead>
                                    <tr>
                                    <th>Universidad</th>  
                                    <th class="alinear" >Periodo</th>
                                    <th>Año</th>
                                    <th>Indice Global</th>
                                    <th>Indice del periodo</th>
                                    <th>Observación</th>
                                    <th>Editar</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach($actualizacions as $actualizacion)
                                            <tr>
                                                <td>{{$actualizacion->universidad}}</td>                                              
                                                <td class="center">                                                    
                                                   {{$actualizacion->periodo}} 
                                                </td>
                                                <td>{{$actualizacion->anio}}</td>
                                                <td>{{$actualizacion->globals}}</td>
                                                <td>{{$actualizacion->periodos}}</td>
                                                @if($actualizacion->globals<65 || $actualizacion->periodos<65 )
                                                <td style="color: red;">Reprobado</td> 
                                                @else
                                                <td style="color: green;">Aprobado</td> 
                                                @endif
                                                <td><a href="{{route('actualizacion.edit',$actualizacion->id_actualizacion)}}" class="btn btn-warning">Editar</a> </td>                           
                                            </tr>
                                     @endforeach       
                                  </tbody>
                                </table>                              
                        </div>

                        <div class="tab-pane" id="profile">
                            <p class="lead">Información Universitaria</p>
                                <table id="datatable" class="table table-striped table-bordered" >
                                  <thead style="background: #999; color: white;">
                                    <tr>
                                    <th class="alinear" >Universidad</th>
                                    <th>Campus</th>
                                    <th>Facultad</th>
                                    <th>Carrera</th>
                                    <th>Cuenta</th>                                   
                                    </tr>
                                  </thead>
                                  <tbody>                                  
                                            <tr>                                              
                                                <td class="center">                                                    
                                                   {{$becario->universidad}}
                                                </td>
                                                <td>{{$becario->campus}}</td>
                                                <td>{{$becario->facultad}}</td>
                                                <td>{{$becario->carrera}}</td>                                            
                                                <td>{{$becario->cuenta_universitaria}}</td>  
                                            </tr>
                                        
                                  </tbody>
                                </table>                                      

                        </div>
                        <div class="tab-pane" id="beca">


                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <div class="x_panel">
                                <div class="x_title">
                                  <h2>Información de la Beca</h2>                
                                  <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                  <ul class="list-unstyled timeline">
                                    @if($becario->beca!='')
                                    <li>
                                      <div class="block">
                                        <div class="tags">
                                          <a href="" class="tag">
                                            <span>Beca:</span>
                                          </a>
                                        </div>
                                        <div class="block_content">
                                          <h2 class="title">
                                                      {{$becario->beca}}
                                          </h2>                                          
                                          
                                          </p>
                                        </div>
                                      </div>
                                    </li>
                                    @else

                                    @endif
                                     @if($becario->cargo!='')
                                    <li>
                                      <div class="block">
                                        <div class="tags">
                                          <a href="" class="tag">
                                            <span>Cargo:</span>
                                          </a>
                                        </div>
                                        <div class="block_content">
                                      
                                         
                                          <p class="excerpt">
                                          {{$becario->cargo}}
                                          </p>
                                        </div>
                                      </div>
                                    </li>
                                     @else

                                    @endif                                  
                                  </ul>

                                </div>
                              </div>
                            </div>

                           
                        </div>
                        <div class="tab-pane" id="doc">
                            <p class="lead">Documentos Digitales</p>
                        </div>
                        <div class="tab-pane" id="messages">
                            <p class="lead">Actualizacion Documentos</p>                            
                           <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Actualizar Periodo </button>
                                 <table id="datatable" class="table table-striped table-bordered">
                                  <thead>
                                    <tr>
                                    <th class="alinear" >Imagen</th>
                                    <th>Nombre</th>
                                    <th>Periodo</th>
                                    <th>año</th>
                                    <th>Observación</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                            <tr>
                                                <td class="center">                                                    
                                                    <img class="center-imagen" width="50" height="50" src="{{asset('img/pdf.png')}}">
                                                </td>
                                                <td>forma 03</td>
                                                <td>I Periodo</td>
                                                <td>2018</td>
                                                <td>Aprobado</td>                                        
                                            </tr>
                                  </tbody>
                                </table>                        
                        </div>

                        <div class="tab-pane" id="ficha">
                            <p class="lead">Ficha de Información del Solicitante</p>
                            
                            <div class="container mt-3">                      
                              <h2>  Ficha 01: <img class="center-imagen" width="50" height="50" src="{{asset('img/pdf.png')}}">
                                año:  2018
                              </h2>                          
                             </div>
                        </div>

                        <div class="tab-pane" id="iden">
                            <p class="lead">Identidad digitalizada</p>                            
                            <div class="container mt-3">                               
                                <h2>Identidad: <img class="center-imagen" width="50" height="50" src="{{asset('img/pdf.png')}}"><h2>                        
                             </div>
                        </div>

                        <div class="tab-pane" id="settings">
                           

           <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>Datos <small>Familiares</small></h2>                
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <ul class="list-unstyled timeline">
                    @if($becario->nombrePadre!='')
                    <li>
                      <div class="block">
                        <div class="tags">
                          <a href="" class="tag">
                            <span>Padre </span>
                          </a>
                        </div>
                        <div class="block_content">
                         <!-- <h2 class="title">
                                          <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                          </h2> -->
                          
                          <h2 class="title">
                            <p class="excerpt">
                                  <b>Nombre Completo:</b> <p style="color: gray;">{{$becario->nombrePadre}}</p>
                                  <b>Identidad:</b> <p style="color: gray;">{{$becario->identidadPadre}}</p>
                                  <b>celular:</b> <p style="color: gray;">{{$becario->celularPadre}}</p> 
                            </p>
                          </h2>
                        </div>
                      </div>
                    </li>
                    @else

                    @endif
                    <li>
                      <div class="block">
                        <div class="tags">
                          <a href="" class="tag">
                            <span>Madre</span>
                          </a>
                        </div>
                        <div class="block_content">
                        <h2 class="title">
                               <b>Nombre Completo:</b> <p style="color: gray;">{{$becario->nombreMadre}}</p>
                               <b>Identidad:</b> <p style="color: gray;">{{$becario->identidadMadre}}</p>
                               <b>celular:</b> <p style="color: gray;">{{$becario->celularMadre}}</p>
                          
                        </h2>
                         
                          <p class="excerpt">
                          </p>
                        </div>
                      </div>
                    </li>
                  
                  </ul>

                </div>
              </div>
            </div>

                          
                      
                        </div>
                      </div>
                    </div>

                    <div class="clearfix"></div>

                  </div>
                </div>
              </div>                
             </div>
        </div>
   </div>
</div>



  

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" align="center">
        <h5 class="modal-title" id="exampleModalLabel">Actualización de Documentos</h5>
        <h3>{{$becario->universidad}}</h3>     
      </div>
      {!! Form::open(['route' => ['actualizacion.store'], 'method'=>'POST', 'files'=>true,'data-parsley-validate']) !!}
      <div class="modal-body">
           
          <input type="text" name="universidad" style="display: none;" value="{{$becario->abreUniversidad}}">
          <input type="text" name="users_id" style="display: none;" value="{{Auth::user()->id}}"> 
          <input type="text" name="id_datos_personales" style="display: none;" value="{{$becario->id}}" class="form-control" style="width: 60px;">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label" >Seleccione un periodo: 
            </label>                           
               <select name="calendario_universidad_id"  class="form-control" required>
                 <option selected disabled>Seleccione un periodo</option>
                @foreach($periodos as $periodo)
                 <option value="{{$periodo->id}}">{{$periodo->periodo}}</option>
                @endforeach                                                                  
            </select>                           
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Indice Global:</label>
            <input onkeypress="return valida(event)" maxlength="3" type="text" name="promedio_global" class="form-control" style="width: 60px;" required>
          </div>
          <div class="form-group" >
            <label for="message-text" class="col-form-label">Indice del periodo:</label>
            <input onkeypress="return valida(event)" maxlength="3" type="text" name="promedio_periodo" class="form-control " style="width: 60px;" required>
          </div>
     
      </div>
      <div  class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
         {!! Form::submit('Registrar',['class'=>'btn btn-success','id'=>'btnEmpty' ]) !!} 
         {{Form::close()}} 
      </div>
    </div>
  </div>
</div>       
         
@endforeach

@endsection


@section('script')


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



 <!-- Datatables -->
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net/js/jquery.dataTables.js')}}"></script>  
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-buttons/js/dataTables.buttons.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-buttons/js/buttons.flash.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-buttons/js/buttons.html5.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/net-buttons/js/buttons.print.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-responsive/js/dataTables.responsive.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-scroller/js/dataTables.scroller.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/jszip/dist/jszip.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/pdfmake/build/pdfmake.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/pdfmake/build/vfs_fonts.js')}}"></script>

  
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