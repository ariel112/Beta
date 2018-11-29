<?php

namespace App\Imports;

use App\Temporal_actualizacion_periodo;
use Maatwebsite\Excel\Concerns\ToModel;

class ConvenioImports implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {     
                



        return  new Temporal_actualizacion_periodo([
           'id_datos_personales' => $row[0],
           
        ]);
    }
}
