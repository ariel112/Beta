<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Temporal_actualizacion_periodo extends Model
{
     protected $table = "temporal_actualizacion_periodo";
   protected $fillable = [
   	'identidad',
   	'calendario_universidad_id',
   	'promedio_global',
   	'promedio_periodo',
   	'id_datos_personales',
   	'Universidad_id',
   	'universidad'

   	];
}
