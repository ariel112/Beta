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
           'identidad' => $row[0],
           'calendario_universidad_id' => $row[1],
           'promedio_global' => $row[2],
           'promedio_periodo' => $row[3],
           'universidad_id'=>$row[4],
           'universidad'=>$row[5]
           
        ]);
    }
}
