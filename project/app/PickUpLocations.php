<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PickUpLocations extends Model
{
    protected $table = "pickup_locations";
    protected $fillable = ['address','id'];
    public $timestamps = false;
}
