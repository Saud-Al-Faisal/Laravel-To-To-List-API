<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class ToDoList extends BaseModel
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
        'name'
    ];

    public function tasks(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Task::class,'to_do_list_id','id');
    }

}
