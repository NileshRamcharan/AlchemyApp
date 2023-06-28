<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Arr;

use DB;

class GetController extends Controller
{
    public function showAll()
    {
        $ingredientTabel = DB::table('ingredient')->get();

        $animals = DB::table('ingredient')->where('classificatie', 'Animal')->get();
        $plants = DB::table('ingredient')->where('classificatie', 'Plant')->get();
        $mushrooms = DB::table('ingredient')->where('classificatie', 'Mushroom')->get();
        $harvestables = DB::table('ingredient')->where('classificatie', 'Harvestable')->get();
        $monsters = DB::table('ingredient')->where('classificatie', 'Monster')->get();
        
        $ingredientResponse = array('animals'=>$animals, 'plants'=>$plants, 'mushrooms'=>$mushrooms, 'harvestables'=>$harvestables, 'monsters'=>$monsters);

        $potionResponse = array();

        $potionContent = DB::table('potion')->get();
        for ($i = 0; $i < sizeOf($potionContent); $i++){
            $potionResponse = Arr::add($potionResponse,$potionContent[$i]->effect, $potionContent[$i]->name);
        }


        // $imageResponse = array();

        // $imageContent = DB::table('images')->get();
        // for ($i = 0; $i < sizeOf($imageContent); $i++){
        //     //$image = Storage::get($imageContent[$i]->path);
        //     $image = $imageContent[$i]->path;
        //     array_push($imageResponse, array($imageContent[$i]->name=>$image));
        // }
        
        return response()->json([
            'ingredients'=>$ingredientResponse,
            'potions'=>$potionResponse,
            //'images'=>$imageResponse,
        ]);
    }
}



