

{!! Form::open(['route' => ['actualizacion.store'], 'method'=>'POST', 'files'=>true,'data-parsley-validate']) !!}

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" align="center">
        <h5 class="modal-title" id="exampleModalLabel">Actualización de Documentos</h5>
        <h3>{{$becario->universidad}}</h3>     
      </div>
      <div class="modal-body">
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
        </form>
      </div>
      <div  class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
         {!! Form::submit('Registrar',['class'=>'btn btn-success','id'=>'btnEmpty' ]) !!}  
      </div>
    </div>
  </div>
</div>       
         {{Form::close()}}