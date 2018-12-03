@extends('sidebar.sidebar')

@section('link')
 

 <link href="{{ asset('css/main.css') }}" rel="stylesheet">

@endsection    
@section("content")
<div class="right_col" role="main">

<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Cargar convenios  </h2> 
                   
    <div class="container-fluid">
    <section class="main row">
      <article class="col-sm-6 col-md-10">
        <div class="box box-info"><!-- 'route' => 'registro.store', --> 
          {{ Form::open (['url' => 'import-excel', 'method' => 'POST', 'enctype' => 'multipart/form-data', 'class' => 'form-horizontal']) }}
           <div class="box-body">
              <div class="form-group"><br>
                {{ Form::label('fichero', 'Fichero Origen:', ['class' => 'col-sm-4 control-label']) }}
                <span class="btn btn-default btn-file">
                  {{ Form::file('excel', ['class' => 'form-control','id' => 'file','required']) }}
                </span>
                <!-- {{ Form::reset('Cancelar', ['class' => 'btn btn-info']) }} -->
                {{ Form::submit('Subir Fichero', ['class' => 'btn btn-lg btn-primary pull-right', 'id' => 'request', 'onclick' => 'comprueba_extension(this.form, this.form.excel.value)'])}}
              </div>
            </div>
          {{ Form::close() }}
        </div>
    
      </article>
      <div>
        <a  href="{{route('verifica.identidad')}}" class="btn btn-info">Verificar identidades</a>
        <a  href="{{route('cargo.convenio')}}" class="btn btn-info">carga convenio</a>
      </div>
      <aside class="col-sm-6 col-md-2">
        <p>
          1. Ingrese el fichero Excel que se procesara <br><br>

          2. Es necesario que sea un archivo con formato adecuado .xlsx <br>
        </p>

        
      </aside>
    </section>

    @foreach($mensaje1 as $mensaje)
    @if($mensaje->contador==0)
    @else
    <p style="color: red;">{{$mensaje->mensaje}}</p>
    @endif
    @endforeach
    
    @foreach($mensaje2 as $mensaje)
    @if($mensaje->contador==0)
    @else
    <p style="color: red;">{{$mensaje->mensaje}}</p>
    @endif
    @endforeach
    @foreach($mensaje3 as $mensaje)  
    <p style="color: green;">{{$mensaje->mensaje}}</p>    
    @endforeach
    <div class="row">
      <div class="container">
        @if($respuesta=='SI')
        @else
         <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                        <th class="alinear" >Identidad</th>
                        <th>Codigo periodo</th>
                        <th>Promedio Global</th>
                        <th>Promedio Periodo</th>                      
                       
                        </tr>
                      </thead>


                      <tbody>
                         @foreach($temporales as $temporal)
                              @if($temporal->id_datos_personales=='')
                                <tr style="color:red;">                                    
                                    <td class="center">{{$temporal->identidad}}</td>                                    
                                    <td>{{$temporal->calendario_universidad_id}}</td>
                                    <td>{{$temporal->promedio_global}}</td>
                                    <td>{{$temporal->promedio_periodo}}</td> 
                                </tr>
                              @else
                              <tr>                                    
                                    <td class="center">{{$temporal->identidad}}</td>                                    
                                    <td>{{$temporal->calendario_universidad_id}}</td>
                                    <td>{{$temporal->promedio_global}}</td>
                                    <td>{{$temporal->promedio_periodo}}</td> 
                                </tr>
                              @endif  

                        @endforeach
                               

                      
                      </tbody>
                    </table>
        @endif
      </div>
      
      </div>
  </div>

         
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">                
                    
                  </div>
                </div>
              </div>

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