<?php

namespace App\Reportes;

use Illuminate\Database\Eloquent\Model;

class users_has_meses_universidad extends Model
{
    protected $table = "users_has_meses_universidad";

    protected $fillable = 
    [
    	'id',
    	'users_id',
    	'pagos_meses_universidad_id',
    	'tipo_accion_id'
    ];
}
