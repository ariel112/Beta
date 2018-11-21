<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pagos_retenido extends Model
{
    protected $table= "retenido";
    protected $fillable = 
    [
    	'id',
    	'id_datos_personales',
    	'descripcion',
    	'inicio',
    	'final'
    ];

}
