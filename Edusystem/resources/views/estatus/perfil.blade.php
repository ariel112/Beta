@extends('sidebar.sidebar')

@section('content')			 					


@foreach($becarios as $becario)

<div class="right_col" role="main">
 <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Perfil del becario (Estatus)</h2>                    
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
                        <li class="active"><a href="#home" data-toggle="tab">Estatus Becario</a>
                        </li>
                        <li><a href="#profile" data-toggle="tab">Informacion de Practica</a>
                        </li>
                        <li><a href="#messages" data-toggle="tab">Persona Dependiente</a>
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
                          <p class="lead">Estatus del becario</p>
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Cambiar Estatus </button>
                           <table id="datatable-fixed-header" class="table table-striped table-bordered">
                                  <thead>
                                    <tr>
                                      <th>Estado</th>
                                      <th>Descripcón</th>
                                      <th>Fecha</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                  @foreach($estado_estudios as $estudio)                        
                                    <tr>
                                      <td>{{$estudio->estado}}</td>
                                      <td>{{$estudio->descripcion}}</td>
                                      <td>{{$estudio->created_at}}</td>                                       
                                    </tr>
                                  @endforeach      
                                  </tbody>
                                </table>
                                                                
                              
                            
                        </div>
                        <div class="tab-pane" id="profile">
                            <p class="lead">Información de Practica</p>
                                  <table id="estatus1" class="table table-striped table-bordered">
                                  <thead style="background: #999; color: white;">
                                    <tr>
                                    <th class="alinear" >Documento</th>
                                    <th>Descripcón</th>
                                    <th>Estado</th>
                                    <th>Inicio</th>
                                    <th>Final</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    @foreach($practicas as $practica)
                                          <tr>
                                             <td class="center">       
                                                  <a href="/documentos/practica/{{$practica->url}}" download="{{$becario->identidad}}">
                                                    <img class="center-imagen" width="50" height="50" src="{{asset('img/pdf.png')}}">
                                                  </a>
                                              </td>
                                              <td>{{$practica->nombre}}</td>
                                              <td>{{$practica->estado}}</td>
                                              <td>{{$practica->inicio}}</td>
                                              <td>{{$practica->final}}</td>                                       
                                           </tr>
                                    @endforeach                                             
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
                 
                     <div class="col-md-12 col-sm-12 col-xs-12">
                          <div class="x_panel">
                            <div class="x_title">
                              <h2>Persona <small>Dependiente</small></h2>                
                              <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                              <ul class="list-unstyled timeline">
                                @if($becario->nombreDependiente!='')
                                <li>
                                  <div class="block">
                                    <div class="tags">
                                      <a href="" class="tag">
                                        <span>Dependiente </span>
                                      </a>
                                    </div>
                                    <div class="block_content">
                                     <!-- <h2 class="title">
                                                      <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                      </h2> -->
                                      
                                      <h2 class="title">
                                        <p class="excerpt">
                                           <b>Nombre Completo:</b> <p style="color: gray;">{{$becario->nombreDependiente}}</p>
                                           <b>Identidad:</b> <p style="color: gray;">{{$becario->identidadDependiente}}</p>
                                           <b>celular:</b> <p style="color: gray;">{{$becario->celularDependiente}}</p>
                                        </p>
                                      </h2>
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
                        <div class="tab-pane" id="ficha">
                            <p class="lead">Ficha de Información del Solicitante</p> 
                        </div>                      
                        <div class="tab-pane" id="settings">
        <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>Datos Familiares</h2>                
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
        <h5 class="modal-title" id="exampleModalLabel">Actualización de Estatus</h5>
        <h3>{{$becario->universidad}}</h3>
     
      </div>
      <div class="modal-body">
        {!! Form::open(['route' => ['estatus.store'], 'method'=>'POST', 'files'=>true]) !!}        
        <input type="text" name="users_id" style="display: none;" value="{{Auth::user()->id}}">
            <input type="text" name="datos_personales_id" style="display: none;" value="{{$becario->id}}" class="form-control" style="width: 60px;">
            <input type="text" name="identidad" style="display: none;" value="{{$becario->identidad}}" class="form-control" style="width: 60px;">

         <div class="form-group" >
            <label for="message-text" class="col-form-label">Estatus:</label>
            <select name="estatus" id="estatus" required class="form-control" >
              <option selected disabled >Seleccione un estatus</option>
              <option value="Practica" >Practica</option>
              <option value="Activo" >Activo</option>
              <option value="Inactivo">Inactivo</option>
              <option value="Egresado">Egresado</option>      
            </select> 
          </div>
          <div id="descripcion-estado" class="form-group" >
              <label for="message-text" class="col-form-label">Descripción:</label>             
              <textarea id="descripcion" name="descripcion" class="form-control"></textarea>
          </div>
          <div id="tiempo-practica">
            <div class="form-group" >
              <label for="message-text" class="col-form-label">Inicio:</label>
              <input  type="date" class="form-control" id="inicio"  name="inicio"  style="width: 220px;">
            </div>
             <div class="form-group" >
              <label for="message-text" class="col-form-label">Final:</label>
              <input id="final" type="date" class="form-control"  name="final"  style="width: 220px;">
            </div>
            <div class="form-group">
              <label  class="col-form-label">Archivos:</label>
              <input id="archivo"  type="file" name="expediente"  >
            </div>
          </div>
        
        
      </div>
      <div  class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="submit" class="btn btn-success" id="registrarE" style="display: none;">Registrar</button> 
         {{Form::close()}}  
      </div>
    </div>
  </div>
</div>

       
            


  @endforeach
</div>
@endsection


@section('script')






 <!--Este script es para las peticiones con ajax -->
    <script src="{{ asset('js/script.js')}}"></script> 


 <!-- Datatables -->
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net/js/jquery.dataTables.js')}}"></script>  
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-buttons/js/dataTables.buttons.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-buttons/js/buttons.flash.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-buttons/js/buttons.html5.min.js')}}"></script>

    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-responsive/js/dataTables.responsive.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/datatables.net-scroller/js/dataTables.scroller.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/jszip/dist/jszip.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/pdfmake/build/pdfmake.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('template/vendors/pdfmake/build/vfs_fonts.js')}}"></script>
    

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