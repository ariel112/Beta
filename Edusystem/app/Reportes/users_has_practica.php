<?php

namespace App\Reportes;

use Illuminate\Database\Eloquent\Model;

class users_has_practica extends Model
{
    protected $table = "users_has_practica";
    protected $fillable = 
    [
    	'id',
    	'users_id',
    	'practica_id',
    	'tipo_accion_id'
    ];
}
