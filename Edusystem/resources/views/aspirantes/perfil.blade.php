@extends('sidebar.sidebar')

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
                        <li class="active"><a href="#home" data-toggle="tab">Información General</a>
                        </li>
                        <li><a href="#profile" data-toggle="tab">Información Universitaria</a>
                        </li>
                        <li><a href="#messages" data-toggle="tab">Persona Dependiente</a>
                        </li>
                        <li><a href="#settings" data-toggle="tab">Datos Familiares</a>
                        </li>
                         <li><a href="#beca" data-toggle="tab">Datos Becas 20/20</a>
                        </li>
                        <li><a href="#doc" data-toggle="tab">Expediente</a>
                        </li>
                      
                      </ul>
                    </div>

                    <div class="col-xs-9">
                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div class="tab-pane active" id="home">


                          <div class="col-md-12 col-sm-12 col-xs-12">
                          <div class="x_panel">
                            <div class="x_title">
                              <h2>Información General</h2>                
                              <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                              <ul class="list-unstyled timeline">                    
                                <li>
                                  <div class="block">
                                    <div class="tags">
                                      <a href="" class="tag">
                                        <span><i class="fa fa-credit-card"></i> Identidad </span>
                                      </a>
                                    </div>
                                    <div class="block_content">                   
                                      <h2 class="title">
                                        <p class="excerpt">
                                           <p style="color: gray;">{{$becario->identidad}}</p>
                                        </p>
                                      </h2>
                                    </div>
                                  </div>
                                </li>
                                 <li>
                                  <div class="block">
                                    <div class="tags">
                                      <a href="" class="tag">
                                        <span><i class="fa fa-phone"></i> Celular</span>
                                      </a>
                                    </div>
                                    <div class="block_content">                   
                                      <h2 class="title">
                                        <p class="excerpt">
                                           <p style="color: gray;">{{$becario->celular}}</p>
                                        </p>
                                      </h2>
                                    </div>
                                  </div>
                                </li> 
                              </ul>
                            </div>
                          </div>
                        </div>                              
                            
                        </div>
                        <div class="tab-pane" id="profile">
                            <p class="lead">Información Universitaria</p>
                                <table  class="table table-striped table-bordered" >
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
                                 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Agregar Documentos </button>
                                 <table id="datatable" class="table table-striped table-bordered">
                                  <thead>
                                    <tr>
                                    <th class="alinear" >Documento</th>
                                    <th>Descripcón</th>
                                    <th>año</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                  @foreach($expedientes as $expediente)  
                                            <tr>
                                                <td class="center">       
                                                    <a href="/documentos/expediente/{{$expediente->url}}" download="{{$becario->identidad}}">
                                                      <img class="center-imagen" width="50" height="50" src="{{asset('img/pdf.png')}}">
                                                    </a>
                                                </td>
                                                <td>{{$expediente->periodo}}</td>
                                                <td>{{$expediente->anio}}</td>                                       
                                            </tr>
                                  @endforeach          
                                  </tbody>
                                </table>


                        </div>
                        <div class="tab-pane" id="messages">
                              <div class="col-md-12 col-sm-12 col-xs-12">
                          <div class="x_panel">
                            <div class="x_title">
                              <h2>Persona Dependiente</h2>                
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
        <h5 class="modal-title" id="exampleModalLabel">Actualización de Documentos</h5>
        <h3>{{$becario->universidad}}</h3>
     
      </div>
      <div class="modal-body">
        {!! Form::open(['route' => ['documentos.store'], 'method'=>'POST', 'files'=>true,'class'=>'form-horizontal form-label-left']) !!}
            <input type="text" name="datos_personales_id" style="display: none;" value="{{$becario->id}}" class="form-control" style="width: 60px;">
            <input type="text" name="identidad" style="display: none;" value="{{$becario->identidad}}" class="form-control" style="width: 60px;">

           <div class="form-group">
               <label for="recipient-name" class="col-form-label" >Descripción:</label>
               <input type="text" name="periodo" class="form-control" required>                                                                      
           </div>
           <div class="form-group" >
            <label for="message-text" class="col-form-label">Año:</label>
            <input  type="date" class="form-control"  name="anio" required style="width: 220px;">
          </div>
          <div class="form-group">
            <label  class="col-form-label">Archivos:</label>
            <input   type="file" name="expediente"   required>
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

       
            





<div class="modal fade" id="ficha01" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" align="center">
        <h5 class="modal-title" id="exampleModalLabel">FICHA01 DIGITALIZAR</h5>
        <h3>{{$becario->universidad}}</h3>     
      </div>
      <div class="modal-body">
        {!! Form::open(['route' => ['ficha.store'], 'method'=>'POST', 'files'=>true,'data-parsley-validate','class'=>'form-horizontal form-label-left']) !!}
            <input type="text" name="datos_personales_id" style="display: none;" value="{{$becario->id}}" class="form-control" style="width: 60px;">
            <input type="text" name="identidad" style="display: none;" value="{{$becario->identidad}}" class="form-control" style="width: 60px;">

           <div class="form-group" >
            <label for="message-text" class="col-form-label">Año:</label>
            <input  type="date" class="form-control"  name="anio" required style="width: 220px;">
          </div>
          <div class="form-group">
            <label  class="col-form-label">Archivos:</label>
            <input   type="file" name="ficha"   required>
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