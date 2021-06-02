<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $table = 'order_product';
    protected $primaryKey = 'op_id  ';
    public $timestamps = true; 
    use HasFactory;
}
