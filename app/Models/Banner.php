<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    protected $table = 'banner'; //name of the table in database
    protected $primaryKey = 'banner_id '; //primary Key of the table
    public $timestamps = true; //true if this table have timestaps
    use HasFactory;
}
