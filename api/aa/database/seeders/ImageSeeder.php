<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class ImageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $imageNames = array("Ash creep cluster","Ashen grass pod","Blue mountain flower","Canis root","Creep cluster","Crimson nirnroot","Deathbell","Dragons tongue","Elves ear","Emperor parasol moss","Felsaad tern feathers","Frost mirriam","Garlic","Giant lichen","Gleamblossom","Grass pod","Hanging moss","Jazbay grapes","Juniper berries","Lavender","Nightshade","Nirnroot","Poison bloom","Purple mountain flower","Red mountain flower","Scathecraw","Snowberries","Thistle branch","Trama root","Tundra cotton","Wheat","Yellow mountain flower","Abecaen longfin","Ash hopper Jelly","Bear claws","Boar tusk","Charred skeever hide","Chaurus hunter antennae","Cirodillic spadetail","Eye of saber cat","Hawk beak","Hawk feathers","Histcarp","Large antlers","Mudcrab chitin","Netch jelly","River betty","Saber cat tooth","Salmon roe","Silverside perch","Skeever tail","Slaughterfish scales","Small antlers","Bleeding crown","Blister wort","Fly Amanita","Glowing mushroom","Imp stool","Mora tapinella","Namiras rot","Scaly Pholiota","Swamp fungal pod","White cap","Ancestor Moth Wing","Bee","Beehive husk","Blue butterfly wing","Blue dartwing","Butterfly wing","Chaurus eggs","Chicken's egg","Dwarven oil","Hawk's egg","Honeycomb","Human flesh","Human heart","Luna moth wings","Moon sugar","Nordic barnacle","Orange dartwing","Pearl","Pine thrush egg","Powdered mammoth tusk","Rock warbler egg","Salt pile","Slaughterfish egg","Small pearl","Spider egg","Spriggan Sap","Torchbug thorax","Bone meal","Briar heart","Burnt spriggen wood","Daedra heart","Ectoplasm","Falmer ear","Fire salts","Frost salts","Giants toe","Glow dust","Hagraven claw","Hagraven feathers","Ice wraith teeth","Spawn ash","Taproot","Troll fat","Vampire dust","Void salt","Wisp wrapping");
        for ($i = 0; $i < sizeOf($imageNames); $i++){
            $imagePath = explode(" ", $imageNames[$i]);
            for ($j = 0; $j < sizeOf($imagePath); $j++){
                $imagePath[$j] = ucfirst($imagePath[$j]);
            }
            $imagePath = implode("_", $imagePath);
            $imagePath = "images/ingredientImgs/" . $imagePath . ".png";
            DB::table('images')->insert([
                "name" => $imageNames[$i],
                "path" => $imagePath,
              ]);
            
        }
    }
}
