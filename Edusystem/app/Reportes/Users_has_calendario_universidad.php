<?php

namespace App\Reportes;

use Illuminate\Database\Eloquent\Model;

class Users_has_calendario_universidad extends Model
{
   protected $table= "users_has_calendario_universidad";
   protected $fillable=
   [
   	'id',
   	'users_id',
   	'calendario_universidad',
   	'tipo_accion_id'
   ];
}
