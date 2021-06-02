<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Variation extends Model
{
    protected $table = 'variation';
    protected $primaryKey = 'v_id';
    public $timestamps = true;
    use HasFactory;
}
