<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table = 'customers';
    protected $primaryKey = 'customer_id';
    public $timestamps = true;
    protected $fillable = ['name'];
    use HasFactory;
}

