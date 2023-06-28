<?php   

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use DB;

class PotionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $potionNames = array("Potion of Alteration","Potion of Haggling","Potion of the Defender","Potion of Strength","Conjurer's Potion","Potion of Destruction","Enchanter's Potion","Potion of the Knight","Potion of Illusion","Skirmisher's Potion","Potion of Lockpicking","Potion of True Shot","Potion of the Warrior","Potion of Glibness","Potion of Pickpocketing","Potion of the Healer","Blacksmith's Potion","Potion of Light Feet","Potion of the Berserker","Potion of Invisibility","Potion of Regeneration","Potion of Lasting Potency","Potion of Vigor","Potion of Resist Fire","Potion of Resist Cold","Potion of Resist Magic","Potion of Resist Shock","Potion of Healing","Potion of Magicka","Potion of Stamina","Potion of Waterbreathing","Cure Poison","Potion of Cure Disease","Potion of Health","Potion of Extra Magicka","Potion of Enhanced Stamina","Poison","Magicka Poison","Stamina Poison","Fear Poison","Frenzy Poison","Paralysis Poison","Aversion to Fire","Aversion to Frost","Aversion to Magic","Aversion to Shock","Magicka Recovery Poison","Vigor Poison","Lingering Poison","Lingering Magicka Poison","Lingering Stamina Poison","Poison of Ravage Magicka","Poison of Ravage Health","Poison of Ravage Stamina","Weakness to Poison Poison","Slowing Poison","Potion of Resist Poison","Potion of the Marksman");
        $potionEffect = array("Fortify alteration","Fortify barter","Fortify block","Fortify carry weight","Fortify conjuration","Fortify destruction","Fortify enchanting","Fortify heavy armor","Fortify illusion","Fortify light armor","Fortify lockpicking","Fortify Archery","Fortify one-handed","Fortify persuasion","Fortify pickpocket","Fortify restoration","Fortify smithing","Fortify sneak","Fortify two-handed","Invisibility","Regenerate health","Regenerate magicka","Regenerate stamina","Resist fire","Resist frost","Resist magic","Resist shock","Restore health","Restore magicka","Restore stamina","Waterbreathing","Cure poison","Cure disease","Fortify health","Fortify magicka","Fortify Stamina","Damage health","Damage magicka","Damage stamina","Fear","Frenzy","Paralysis","Weakness to fire","Weakness to frost","Weakness to magic","Weakness to shock","Damage magicka regen","Damage stamina regen","Lingering damage health","Lingering damage magicka","Lingering damage stamina","Ravage magicka","Ravage health","Ravage stamina","Weakness to poison","Slow","Resist poison","Fortify marksman");
        for ($i = 0; $i < sizeOf($potionNames); $i++){
            DB::table('potion')->insert([
            "effect" => $potionEffect[$i],
            "name" => $potionNames[$i],
          ]);
        } 
    }
}
