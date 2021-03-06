@extends('sidebar.sidebar')


@section('content')

   <!-- page content -->
        <div class="right_col" role="main">
        
         
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Pago Meses Universidades</h2>
                   
                    <div class="clearfix"></div>
                  </div>
                  <div class="fondo-beca" >
                    <br/>                    
                
 			


					
                  <div class="x_content" >
                
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                        <th class="alinear">Codigo</th>                       
                        <th>Imagen</th>
                        <th>Universidad</th>
                        <th>Abreviatura</th>                      
                     
                        </tr>
                      </thead>

                      <tbody>
 					@foreach ($universidades as $universidad)         
                                <tr>
                                    <th class="alinear"><font size="10">{{$universidad->id}}</font></th>      
                                    <td class="center">
                                        <a href="{{route('meses.perfil', $universidad->id)}}">                                    
                                            <img class="center-imagen" width="80" height="80" src="/logo-universidades/{{$universidad->url_imagen}}">
                                        </a>    
                                    </td>
                                    <td class="alinear" >{{$universidad->nombre}}</td>
                                    <td>{{$universidad->abreviatura}}</td>
                                </tr>
                        @endforeach                         
                      </tbody>
                    </table>
                  </div>


                  </div>
                </div>
              </div>
            </div>
         
        </div>
        <!-- /page content -->
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


@endsection