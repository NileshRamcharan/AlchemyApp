<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('ingredient', function (Blueprint $table) {
            $table->string('ingredient')->unique();
            $table->string('classificatie');
            $table->string('effect1');
            $table->string('effect2');
            $table->string('effect3');
            $table->string('effect4');
            $table->string('blurb');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ingredient');
    }
};
