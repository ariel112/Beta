<?php

namespace App\Reportes;

use Illuminate\Database\Eloquent\Model;

class estado_estudios_has_users extends Model
{
    protected $table = "estado_estudios_has_users";
    protected $fillable = 
    [
    	'estado_estudios_id',
    	'users_id_users',
    	'tipo_accion_id'
    ];
}
