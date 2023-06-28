<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class IngredientSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $ingredientNamesPlants = array("Ash creep cluster","Ashen grass pod","Blue mountain flower","Canis root","Creep cluster","Crimson nirnroot","Deathbell","Dragons tongue","Elves ear","Emperor parasol moss","Felsaad tern feathers","Frost mirriam","Garlic","Giant lichen","Gleamblossom","Grass pod","Hanging moss","Jazbay grapes","Juniper berries","Lavender","Nightshade","Nirnroot","Poison bloom","Purple mountain flower","Red mountain flower","Scathecraw","Snowberries","Thistle branch","Trama root","Tundra cotton","Wheat","Yellow mountain flower");
        $effect1Plants = array("Damage stamina","Resist fire","Restore health","Damage stamina","Restore magicka","Damage health","Damage health","Resist fire","Restore magicka","Damage health","Restore health","Resist frost","Resist poison","Weakness to shock","Resist magic","Resist poison","Damage magicka","Weakness to magic","Weakness to fire","Resist magic","Damage health","Damage health","Damage health","Restore stamina","Restore magicka","Ravage health","Resist fire","Resist frost","Weakness to shock","Resist magic","Restore health","Resist poison");
        $effect2Plants = array("Invisibility","Weakness to shock","Fortify Conjuration","Fortify one-handed","Damage stamina regen","Damage stamina","Ravage stamina","Fortify barter","Fortify marksman","Fortify magicka","Fortify light armor","Fortify sneak","Fortify stamina","Ravage health","Fear","Ravage magicka","Fortify health","Fortify magicka","Fortify marksman","Fortify stamina","Damage magicka regen","Damage stamina","Slow","Fortify sneak","Ravage magicka","Ravage stamina","Fortify enchanting","Ravage Stamina","Fortify carry weight","Fortify magicka","Fortify health","Fortify restoration");
        $effect3Plants = array("Resist fire","Fortify lockpicking","Fortify health","Fortify marksman","Fortify carry weight","Invisibility","Slow","Fortify illusion","Weakness to frost","Regenerate health","Cure disease","Ravage magicka","Regenerate magicka","Weakness to poison","Regenerate health","Fortify alteration","Damage magicka regen","Regenerate magicka","Regenerate health","Ravage magicka","Lingering damage stamina","Invisibility","Fortify carry weight","Lingering damage magicka","Fortify magicka","Ravage magicka","Resist frost","Resist poison","Damage magicka","Fortify block","Damage stamina regen","Fortify health");
        $effect4Plants = array("Fortify destruction","Fortify sneak","Damage magicka regen","Paralasys","Weakness to magic","Resist magic","Weakness to poison","Fortify two-handed","Resist fire","Fortify two-handed","Resist magic","Damage stamina regen","Regenerate health","Restore magicka","Paralasys","Restore magicka","Fortify one-handed","Ravage health","Damage stamina regen","Fortify conjuration","Fortify destruction","Resist magic","Fear","Resist frost","Damage health","Lingering damage health","Resist shock","Fortify heavy armor","Slow","Fortify barter","Lingering damage stamina","Damage stamina regen");
        $blurbsPlants = array("Harvested from creep cluster plants unique to Solstheim.","Harvested from spiky grass plants unique to Solstheim.","Harvested from the blue variety of Mountain Flower, found throughout Skyrim.","Harvested from Canis Root, found in The Rift and Hjaalmarch.","Harvested from Creep Cluster, found in the volcanic tundra of Eastmarch.","Harvested from Crimson Nirnroot, found in Blackreach.","Harvested from Deathbell, found in Hjaalmarch. ","Harvested from Dragon's Tongue, found in the volcanic tundra of Eastmarch.","Harvested from Dried Elves Ear bunches found in homes and camps.","Harvested from emperor parasol moss plants near Tel Mithryn.","Collected from dead Felsaad terns.","Harvested from Dried Frost Mirriam bunches found in homes and camps.","Food. Can also be harvested from Garlic Braids.","Harvested from Giant Lichen, found in Hjaalmarch.","Harvested from the plant of the same name.","Harvested from Spiky Grass, found in northern regions of Skyrim.","Harvested from Hanging Moss.","Harvested from Jazbay vines, found in the volcanic tundra of Eastmarch.","Harvested from Juniper shrubs, common in The Reach.","Harvested from Lavender, most common in Whiterun Hold.","Harvested from Nightshade, found growing throughout Skyrim. ","Harvested from Nirnroot, found near bodies of water throughout Skyrim. ","Harvested from the plant of the same name.","Harvested from the purple variety of Mountain Flower.","Harvested from the red variety of Mountain Flower.","Harvested from scathecraw plants.","Harvested from Snowberry bushes, found in snowy regions of Skyrim.","Harvested from Thistle.","Harvested from trama root plants.","Harvested from Tundra Cotton, found in Whiterun Hold.","Food. Harvested from wheat bushels, found in various farms.","Harvested from the yellow variety of Mountain Flower.");

        $ingredientNamesAnimals = array("Abecean longfin","Ash hopper Jelly","Bear claws","Boar tusk","Charred skeever hide","Chaurus hunter antennae","Cyrodilic spadetail","Eye of sabre cat","Hawk beak","Hawk feathers","Histcarp","Large antlers","Mudcrab chitin","Netch jelly","River betty","Sabre cat tooth","Salmon roe","Silverside perch","Skeever tail","Slaughterfish scales","Small antlers");
        $effect1Animals = array("Weakness to frost","Restore health","Restore stamina","Fortify stamina","Restore stamina","Damage stamina","Damage stamina","Restore stamina","Restore stamina","Cure disease","Restore stamina","Restore stamina","Restore stamina","Paralysis","Damage health","Restore stamina","Restore stamina","Restore stamina","Damage stamina regen","Resist frost","Weakness to poison");
        $effect2Animals = array("Fortify sneak","Fortify light armor","Fortify health","Fortify health","Cure disease","Fortify conjuration","Fortify restoration","Ravage health","Resist frost","Fortify light armor","Fortify magicka","Fortify stamina","Cure disease","Fortify carry weight","Fortify alteration","Fortify heavy armor","Waterbreathing","Damage stamina regen","Ravage health","Lingering damage health","Fortify restoration");
        $effect3Animals = array("Weakness to poison","Resist shock","Fortify one-handed","Fortify block","Resist poison","Damage magicka regen","Fear","Damage magicka","Fortify carry weight","Fortify one-handed","Damage stamina regen","Slow","Resist poison","Restore stamina","Slow","Fortify smithing","Fortify magicka","Ravage health","Damage health","Fortify heavy armor","Lingering damage stamina");
        $effect4Animals = array("Fortify restoration","Weakness to frost","Damage magicka regen","Frenzy","Restore health","Fortify enchanting","Ravage health","Restore health","Resist shock","Fortify sneak","Waterbreathing","Damage stamina regen","Resist fire","Fear","Fortify carry weight","Weakness to poison","Regenerate magicka","Resist frost","Fortify light armor","Fortify block","Damage health");
        $blurbsAnimals = array("Collected by catching Abacean Longfin fish.","Collected from dead ash hoppers.","Collected from various types of dead Bears.","Collected from dead bristlebacks and rieklings.","Food, collected from dead Skeevers found on roasting spits.","Collected from dead Chaurus Hunters and Chaurus Hunter Fledglings.","Collected by catching Cyrodilic Spadetail fish.","Collected from dead Sabre Cats.","Collected from dead Hawks.","Collected from dead Hawks.","Collected by catching Histcarp fish.","Collected from dead male Elk.","Collected from dead Mudcrabs, found in or near bodies of water.","Collected from dead netch.","Collected by catching River Betty fish.","Collected from dead Sabre cats.","Harvested from jumping Salmon.","Collected by catching Silverside Perch fish.","Collected from dead Skeevers.","Collected from dead Slaughterfish.","Collected from dead female Elk.");

        $ingredientNamesMushrooms = array("Bleeding crown","Blisterwort","Fly Amanita","Glowing mushroom","Imp stool","Mora tapinella","Namira's rot","Scaly Pholiota","Swamp fungal pod","White cap");
        $effect1Mushrooms = array("Weakness to fire","Damage stamina","Resist fire","Resist shock","Damage health","Restore magicka","Damage magicka","Weakness to magic","Resist shock","Weakness to frost");
        $effect2Mushrooms = array("Fortify block","Frenzy","Fortify two-handed","Fortify destruction","Lingering damage health","Lingering damage health","Forify lockpicking","Fortify illusion","Lingering damage magicka","Fortify heavy armor");
        $effect3Mushrooms = array("Weakness to poison","Restore health","Frenzy","Fortify smithing","Paralysis","Regenerate stamina","Fear","Regenerate stamina","Paralysis","Restore magicka");
        $effect4Mushrooms = array("Resist magic","Fortify smithing","Regenerate stamina","Fortify health","Restore health","Fortify illusion","Regenerate health","Fortify carry weight","Restore health","Ravage magicka");
        $blurbsMushrooms = array("Harvested from Bleeding Crown, a mushroom found in various caves.","Harvested from Blisterwort mushrooms found in various caves.","Harvested from Fly Amanita mushrooms, found in various caves.","Harvested from Glowing Mushrooms, found in various caves.","Harvested from Imp Stool mushrooms, found in various caves.","Harvested from Mora Tapinella mushrooms, found growing on dead trees.","Harvested from Namira's Rot mushrooms, found in various caves.","Harvested from Scaly Pholiota mushrooms, found growing on dead trees.","Harvested from Swamp Fungal Pod, common in the tundra marsh of Hjaalmarch.","Harvested from White Cap mushrooms, found in various caves.");

        $ingredientNamesHarvestables = array("Ancestor Moth Wing","Bee","Beehive husk","Blue butterfly wing","Blue dartwing","Butterfly wing","Chaurus eggs","Chicken's egg","Dwarven oil","Hawk's egg","Honeycomb","Human flesh","Human heart","Luna moth wing","Moon sugar","Nordic barnacle","Orange dartwing","Pearl","Pine thrush egg","Powdered mammoth tusk","Rock warbler egg","Salt pile","Slaughterfish egg","Small pearl","Spider egg","Spriggan Sap","Torchbug thorax");
        $effect1Harvestables = array("Damage stamina","Restore stamina","Resist poison","Damage stamina","Resist shock","Restore health","Weakness to poison","Resist magic","Weakness to magic","Resist magic","Restore stamina","Damage health","Damage health","Damage magicka","Weakness to fire","Damage magicka","Restore stamina","Restore stamina","Restore stamina","Restore stamina","Restore health","Weakness to magic","Resist poison","Restore stamina","Damage stamina","Damage magicka regen","Restore stamina");
        $effect2Harvestables = array("Fortify conjuration","Ravage stamina","Fortify light armor","Fortify conjuration","Fortify pickpocket","Fortify barter","Fortify stamina","Damage magicka regen","Fortify illusion","Damage magicka regen","Fortify block","Paralysis","Damage magicka","Fortify light armor","Resist frost","Waterbreathing","Ravage magicka","Fortify block","Fortify lockpicking","Fortify sneak","Fortify one-handed","Fortify restoration","Fortify lockpicking","Fortify one-handed","Damage magicka regen","Fortify enchanting","Lingering damage magicka");
        $effect3Harvestables = array("Damage magicka regen","Regenerate stamina","Fortify sneak","Damage magicka regen","Restore health","Lingering damage stamina","Damage magicka","Waterbreathing","Regenrate magicka","Waterbreathing","Fortify light armor","Restore magicka","Damage magicka regen","Regenerate health","Restore magicka","Regenerate health","Fortify pickpocket","Restore magicka","Weakness to poison","Weakness to fire","Damage stamina","Slow","Lingering damage health","Fortify restoration","Fortify lockpicking","Fortify enchanting","Weakness to magic");
        $effect4Harvestables = array("Fortify enchanting","Weakness to shock","Fortify destruction","Fortify enchanting","Fear","Damage magicka","Invisibility","Lingering damage stamina","Restore magicka","Lingering damage stamina","Ravage stamina","Fortify sneak","Frenzy","Invisibility","Regenerate magicka","Fortify pickpocket","Lingering damage health","Resist shock","Resist shock","Fear","Weakness to magic","Regenerate magicka","Fortify stamina","Resist frost","Fortify marksman","Fortify smithing","Fortify stamina");
        $blurbsHarvestables = array("Collected by catching Ancestor Moths.","Collected from beehives and by catching Bees.","Collected from beehives.","Often found during daylight hours near flowering plants.","Found near rivers and streams below the snow line.","Often found during daylight hours near flowering plants.","Collected from Chaurus Egg Sacs, found in Falmer caves.","Food, harvested from Chicken nests in various farms.","Collected from destroyed Dwarven Automatons, found in Dwarven Ruins.","Harvested from Hawk nests.","Food. Collected from beehives.","Several respawning samples can be found in Volkihar Keep.","Cannot be harvested or collected; limited number of samples available.","Often found near flowers after dark.","Cannot be collected or harvested. Can be purchased from the Khajiit Traders.","Harvested from Nordic Barnacle Clusters, found in or near water.","Found near rivers and streams below the snow line.","Can be harvested from Pearl Oysters in Solstheim.","Harvested from bird nests in forested regions, in particular The Rift.","Cannot be harvested or collected; only available with the Merchant perk.","Harvested from bird nests in rocky regions, in particular The Reach.","Cannot be harvested or collected, but is commonly found in barrels and sacks.","Collected from Slaughterfish Egg Nests, found in or near water.","They can be harvested from Pearl Oysters in Solstheim.","Collected from spider Egg Sacs and Web Sacs.","Cannot be harvested or collected; best source is merchants.","Found below the snowline after dark.");

        $ingredientNamesMonsters = array("Bone meal","Briar heart","Burnt spriggan wood","Daedra heart","Ectoplasm","Falmer ear","Fire salts","Frost salts","Giants toe","Glow dust","Hagraven claw","Hagraven feathers","Ice wraith teeth","Spawn ash","Taproot","Troll fat","Vampire dust","Void salts","Wisp wrappings");
        $effect1Monsters = array("Damage stamina","Restore magicka","Weakness to fire","Restore health","Restore magicka","Damaga health","Weakness to frost","Weakness to fire","Damage stamina","Damaga magicka","Resist magic","Damage magicka","Weakness to frost","Ravage stamina","Weakness to magic","Resist poison","Invisibility","Weakness to shock","Restore stamina");
        $effect2Monsters = array("Resist fire","Fortify block","Fortify alteration","Damage stamina regen","Fortify destruction","Frenzy","Resist fire","Resist frost","Fortify health","Damage magicka regen","Lingering damage magicka","Fortify conjuration","Fortify heavy armor","Resist fire","Fortify illusion","Fortify two-handed","Restore magicka","Resist magick","Fortify destruction");
        $effect3Monsters = array("Fortify conjuration","Paralysis","Damage magicka regen","Damaga magicka","Fortify magicka","Resist poison","Restore magicka","Restore magicka","Fortify carry weight","Fortify destruction","Fortify enchanting","Frenzy","Invisibility","Fortify enchanting","Regenerate magicka","Frenzy","Regenerate health","Damage health","Fortify carry weight");
        $effect4Monsters = array("Ravage stamina","Fortify magicka","Slow","Fear","Damage health","Fortify lockpicking","Regenerate magicka","Fortify conjuration","Damage stamina regen","Resist shock","Fortify barter","Weakness to shock","Weakness to fire","Ravage magicka","Restore magicka","Damage health","Cure disease","Fortify magicka","Resist magic");
        $blurbsMonsters = array("Collected from undead such as skeletons, and Draugr.","Collected from Forsworn Briarhearts.","Collected from dead burnt spriggans.","Collected from dead Dremora.","Collected from undead Ghosts.","Collected from dead Falmer.","Collected from dead Flame Atronachs.","Collected from dead Frost Atronachs.","Collected from dead Giants.","Collected from dead Wisps and Wispmothers.","Collected from dead Hagravens.","Collected from dead Hagravens. Can also be found scattered around their sleeping areas.","Collected from Ice Wraiths.","Collected from dead ash spawn.","Collected from dead Spriggans.","Collected from dead Trolls. ","Collected from dead Vampires.","Collected from dead Storm Atronachs.","Collected from dead Wispmothers.");
        
        for ($i = 0; $i < sizeOf($ingredientNamesPlants); $i++){
            DB::table('ingredient')->insert([
            "ingredient" => $ingredientNamesPlants[$i],
            "classificatie" => "Plant",
            "effect1" => $effect1Plants[$i],
            "effect2" => $effect2Plants[$i],
            "effect3" => $effect3Plants[$i],
            "effect4" => $effect4Plants[$i],
            "blurb" => $blurbsPlants[$i],
          ]);
        } 
        
        for ($i = 0; $i < sizeOf($ingredientNamesAnimals); $i++){
            DB::table('ingredient')->insert([
            "ingredient" => $ingredientNamesAnimals[$i],
            "classificatie" => "Animal",
            "effect1" => $effect1Animals[$i],
            "effect2" => $effect2Animals[$i],
            "effect3" => $effect3Animals[$i],
            "effect4" => $effect4Animals[$i],
            "blurb" => $blurbsAnimals[$i],
          ]);
        } 

        for ($i = 0; $i < sizeOf($ingredientNamesMushrooms); $i++){
            DB::table('ingredient')->insert([
            "ingredient" => $ingredientNamesMushrooms[$i],
            "classificatie" => "Mushroom",
            "effect1" => $effect1Mushrooms[$i],
            "effect2" => $effect2Mushrooms[$i],
            "effect3" => $effect3Mushrooms[$i],
            "effect4" => $effect4Mushrooms[$i],
            "blurb" => $blurbsMushrooms[$i],
          ]);
        } 

        for ($i = 0; $i < sizeOf($ingredientNamesHarvestables); $i++){
            DB::table('ingredient')->insert([
            "ingredient" => $ingredientNamesHarvestables[$i],
            "classificatie" => "Harvestable",
            "effect1" => $effect1Harvestables[$i],
            "effect2" => $effect2Harvestables[$i],
            "effect3" => $effect3Harvestables[$i],
            "effect4" => $effect4Harvestables[$i],
            "blurb" => $blurbsHarvestables[$i],
          ]);
        } 

        for ($i = 0; $i < sizeOf($ingredientNamesMonsters); $i++){
            DB::table('ingredient')->insert([
            "ingredient" => $ingredientNamesMonsters[$i],
            "classificatie" => "Monster",
            "effect1" => $effect1Monsters[$i],
            "effect2" => $effect2Monsters[$i],
            "effect3" => $effect3Monsters[$i],
            "effect4" => $effect4Monsters[$i],
            "blurb" => $blurbsMonsters[$i],
          ]);
        } 

    }
}

//     insertLists($ingredientNamesPlants, "Plant", $effect1Plants, $effect2Plants, $effect3Plants, $effect4Plants, $blurbsPlants);
//     insertLists($ingredientNamesAnimals, "Animal", $effect1Animals, $effect2Animals, $effect3Animals, $effect4Animals, $blurbsAnimals);
//     insertLists($ingredientNamesMushrooms, "Mushroom", $effect1Mushrooms, $effect2Mushrooms, $effect3Mushrooms, $effect4Mushrooms, $blurbsMushrooms);
//     insertLists($ingredientNamesHarvestables, "Harvestable", $effect1Harvestables, $effect2Harvestables, $effect3Harvestables, $effect4Harvestables, $blurbsHarvestables);
//     insertLists($ingredientNamesMonsters, "Monster", $effect1Monsters, $effect2Monsters, $effect3Monsters, $effect4Monsters, $blurbsMonsters);


//     private function insertLists($names, $classification, $effect1, $effect2, $effect3, $effect4, $blurbs): void
//     {
//         for ($i = 0; $i < sizeOf($names); $i++){
//             DB::table('ingredient')->insert([
//             "ingredient" => $names[$i],
//             "classificatie" => $classification,
//             "effect1" => $effect1[$i],
//             "effect2" => $effect2[$i],
//             "effect3" => $effect3[$i],
//             "effect4" => $effect4[$i],
//             "blurb" => $blurbs[$i],
//           ]);
//         }
//     }