<?php

namespace App\Exports;
use App\Invoice;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
use DB;
use Carbon\Carbon;
use Illuminate\Support\Collection as Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Events\AfterSheet;
use App\Nombre_complementaria;

class ComplementariaExport implements FromCollection, ShouldAutoSize, WithHeadings, withEvents
{
      /**
     * @return array
     */
       public function registerEvents(): array
    {
        
             $styleArray = [
                'font' => [
                    'bold'=>true,
                    'size'=>12,
                    ],
                    'borders' => [
                        'outline' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK,
                            'color' => ['argb' => '0000000'],
                        ],
                    ],
                    'fill' => [
                        'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_GRADIENT_LINEAR,
                        'rotation' => 90,
                        'startColor' => [
                            'argb' => '2884bd',
                        ],             
                        'endColor' => [
                            'argb' => '2884bd',
                        ],
                    ],

             ];

        return [ 
            AfterSheet::class => function(AfterSheet $event) use ($styleArray) {
                $event->sheet->getStyle('A1')->applyFromArray($styleArray);
                $event->sheet->getStyle('B1')->applyFromArray($styleArray);
                $event->sheet->getStyle('C1')->applyFromArray($styleArray);
                $event->sheet->getStyle('D1')->applyFromArray($styleArray);
                $event->sheet->getStyle('E1')->applyFromArray($styleArray);
                $event->sheet->getStyle('F1')->applyFromArray($styleArray);
              
            },
        ];        

    }



    use Exportable;
     /**
    * @return \Illuminate\Support\Collection
    */
      public function __construct($date)
    {
        $this->date = $date;
    }



    public function collection()
    { 
    	$fecha1= Nombre_complementaria::find($this->date);

      

      $carbon=Carbon::now();     
        $fecha = Carbon::parse($fecha1->fecha);
        
        $mfecha = $fecha->format("m");
        $yfecha =  $fecha->format("Y");
      
        
        /*condicion para sacar el mes en espanol*/
         if($mfecha==01)    
            $mesP='Enero';
         if($mfecha==02)    
            $mesP='Febrero';
         if($mfecha==03)    
            $mesP='Marzo';
         if($mfecha==04)    
            $mesP='Abril';
         if($mfecha==05)    
            $mesP='Mayo';
         if($mfecha==06)    
            $mesP='Junio';
         if($mfecha==07)    
            $mesP='Julio';
         if($mfecha==8)    
            $mesP='Agosto';
         if($mfecha==9)    
            $mesP='Septiembre';
         if($mfecha==10)    
            $mesP='Octubre';
         if($mfecha==11)    
            $mesP='Noviembre';
         if($mfecha==12)    
            $mesP='Diciembre';
       


      $nuevo = DB::select("
          SELECT 
                    A.nombre,                   
                    C.identidad AS identidad,
                    C.nombre AS nombre,
                    C.celular AS celular,                    
                    X.abreviatura as abreviatura,
                    I.departamento AS departamento
                    
                FROM nombre_complementaria A
                LEFT JOIN planilla_complementaria B
                ON(B.nombre_complementaria_id=A.id)
                INNER JOIN datos_personales C
                ON(B.datos_personales_id=C.id)
                INNER JOIN datos_personales_has_carreras D
                ON(D.id_datos_personales=C.id)
                INNER JOIN carreras E
                ON(D.carrera_id=E.id)
                INNER JOIN facultad F
                ON(E.facultad_id=F.id)
                INNER JOIN campus G
                ON(F.campus_id=G.id)
                INNER JOIN universidad X
                ON(G.universidad_id=X.id)
                INNER JOIN municipio H
                ON(G.id_municipio=H.id_municipio)
                INNER JOIN departamento I
                ON(H.id_depto=I.id_depto)
          WHERE A.id = '$this->date';
         ");

          $data2 =[];
                 foreach ($nuevo as $datos){
                    $row=[];
                    $row['Nombre Completo']=$datos->nombre;
                    $row['Identidad']=$datos->identidad;
                    $row['Celular']=$datos->celular;
                    $row['Universidad']=$datos->abreviatura;
                    $row['Departamento']=$datos->departamento;
                    $row['Mes']=$mesP;
                    $data2[]=$row;
                    } 


        return collect($data2);
    }

    public function headings(): array {
        return [
            'Nombre Completo',
            'Identidad',
            'Celular',
            'Universidad',
            'Departamento',
            'Mes'
        ];
    }




}
