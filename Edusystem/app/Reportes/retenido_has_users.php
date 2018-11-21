<?php

namespace App\Reportes;

use Illuminate\Database\Eloquent\Model;

class retenido_has_users extends Model
{
    protected $table = "retenido_has_users";
    protected $fillable =
					    [
					    	'id',
					    	'id_retenido',
					    	'id_users',
					    	'tipo_accion_id'
					    ];
}
