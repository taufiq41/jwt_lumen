<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nama');
            $table->string('email',50);
            $table->string('no_hp',15);
            $table->string('alamat');
            $table->string('password');
            $table->string('kota_kab_id',10)->nullable();
            $table->string('kecamatan_id',10)->nullable();
            $table->string('token_registrasi')->nullable();
            $table->string('token_lupa_password')->nullable();
            $table->enum('status',['active','inactive','register']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
