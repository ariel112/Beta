<?php

namespace App\Reportes;

use Illuminate\Database\Eloquent\Model;

class creacion_becarios_has_users extends Model
{
    protected $table = "creacion_becarios_has_users";
    protected $fillable =
    [
    	'id',
    	'datos_personales_id',
    	'users_id',
    	'tipo_accion_id'
    ];
}
