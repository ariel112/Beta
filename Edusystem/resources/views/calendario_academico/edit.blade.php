@extends('sidebar.sidebar')


@section('content')

   <!-- page content -->
        <div class="right_col" role="main">         
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Calendarios Académicos</h2>                   
                    <div class="clearfix"></div>
                  </div>
                  <div class="fondo-beca">                    
                    <br/>

 			 {!! Form::open(['route' => ['calendario.show', $calendario->id], 'method'=>'PUT', 'files'=>true,'data-parsley-validate','class'=>'form-horizontal form-label-left']) !!}
                           <input type="text" name="users_id" style="display: none;" value="{{Auth::user()->id}}">
                           <input type="text" name="universidad_id" style="display: none;" value="{{$calendario->universidad_id}}">                        
                          <div align="center"><h2>CENTRO UNIVERSITARIO</h2></div> 




                           <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Selecione fecha de inicio:
                            </label>
                            <div class="col-md-2 col-sm-2 col-xs-2">
                              <input type="date" min="{{$carbon}}" value="{{$calendario->inicio}}" name="inicio" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Selecione fecha final:
                            </label>
                            <div class="col-md-2 col-sm-2 col-xs-3">
                              <input type="date" min="{{$carbon}}" value="{{$calendario->final}}" name="final" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                            <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Solicitud del convenio:
                            </label>
                            <div class="col-md-2 col-sm-2 col-xs-3">
                              <input type="date" min="{{$carbon}}" value="{{$calendario->solicitud_convenio}}"  name="solicitud_convenio" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
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