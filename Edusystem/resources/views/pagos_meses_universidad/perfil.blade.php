@extends('sidebar.sidebar')


@section("content")


<div class="right_col" role="main">

 <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Perfil Universidad</h2>
                    <ul class="nav navbar-right panel_toolbox">
                                        
                    </ul>
                    <div class="clearfix"></div>
                    @include('flash-message')

                  </div>
                  <div class="x_content">
                
                  	<div align="center">
                  		<h2>{{$universidad->nombre}}</h2>
                 		<h4>{{$universidad->abreviatura}}</h4>
                 		<img class="center-imagen" width="100" height="100" src="/logo-universidades/{{$universidad->url_imagen}}">
                  	</div>
				<br>
				<br>
         
        @if(count($pagos)==0)
         &nbsp;&nbsp;&nbsp;<a href="{{route('meses.show',$universidad->id)}}"><button class="btn btn-success">Agregar nuevo</button>
        @else  
            @foreach($pagos as $pago)
                  @if($pago->anio==$anio)              
                  @else
                   &nbsp;&nbsp;&nbsp;<a href="{{route('meses.show',$universidad->id)}}"><button class="btn btn-success">Agregar nuevo</button></a> 
                  @endif   
            @endforeach
        @endif    
               <div  class="col-md-12 col-sm-12 col-xs-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>PAGOS CONVENIOS CORRESPONDIENTES UNIVERSIDADES <small> </small></h2>
                   
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th>Año</th>
                          <th>ENERO</th>
                          <th>FEBRERO</th>
                          <th>MARZO</th>
                          <th>ABRIL</th>
                          <th>MAYO</th>
                          <th>JUNIO</th>
                          <th>JULIO</th>
                          <th>AGOSTO</th>
                          <th>SEPTIEMBRE</th>
                          <th>OCTUBRE</th>
                          <th>NOVIEMBRE</th>
                          <th>DICIEMBRE</th>
                          <th>Editar</th>
                          
                        </tr>
                      </thead>
                      <tbody>
	                 @foreach($pagos as $pago)
                        <tr>
                          <td>{{$pago->anio}}</td>
                          <td>{{$pago->enero}}</td>
                          <td>{{$pago->febrero}}</td>
                          <td>{{$pago->marzo}}</td>
                          <td>{{$pago->abril}}</td>
                          <td>{{$pago->mayo}}</td>
                          <td>{{$pago->junio}}</td>
                          <td>{{$pago->julio}}</td>
                          <td>{{$pago->agosto}}</td>
                          <td>{{$pago->septiembre}}</td>
                          <td>{{$pago->octubre}}</td>
                          <td>{{$pago->noviembre}}</td>
                          <td>{{$pago->diciembre}}</td>
                          @if($pago->anio==$anio)
                          <td>
                             <a href="{{route('meses.edit',$pago->id)}}">
                              <button type="button" class="btn btn-round btn-warning">Editar mes</button>
                            </a>
                          </td>
                          @else
                          <td>
                          NO DISPONIBLE                           
                          </td>
                          @endif
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

</div>

@endsection