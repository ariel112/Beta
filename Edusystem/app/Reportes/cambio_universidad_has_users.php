<?php

namespace App\Reportes;

use Illuminate\Database\Eloquent\Model;

class cambio_universidad_has_users extends Model
{
    protected $table = "cambio_universidad_has_users";
    protected $fillable = 
    [
    	'id',
    	'datos_personales_id',
    	'users_id',
    	'tipo_accion_id',
    	'universidad'
    ];
}
