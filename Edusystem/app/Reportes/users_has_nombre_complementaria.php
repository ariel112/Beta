<?php

namespace App\Reportes;

use Illuminate\Database\Eloquent\Model;

class users_has_nombre_complementaria extends Model
{
    protected $table = "users_has_nombre_complementaria";
    protected $fillable = 
    [
    	'id',
    	'users_id',
    	'nombre_complementaria_id',
    	'tipo_accion_id'
    ];
}
