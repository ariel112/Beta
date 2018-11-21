<?php

namespace App\Reportes;

use Illuminate\Database\Eloquent\Model;

class users_has_actualizacion_periodo extends Model
{
    protected $table = "users_has_actualizacion_periodo";
    protected $fillable = 
    [
    	'id',
    	'users_id',
    	'actualizacion_periodo',
    	'tipo_accion'
    ];
}
