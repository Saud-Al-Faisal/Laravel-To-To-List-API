<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class Task extends BaseModel
{
    use HasFactory, SoftDeletes;

    const TASK_STATUS = [
        'Pending' => 'Pending',
        'Processing' => 'Processing',
        'Complete' => 'Complete'
    ];
    protected $attributes = [
        'status' => self::TASK_STATUS['Pending'],
    ];

    public function toDoList(): BelongsTo
    {
        return $this->belongsTo(ToDoList::class, 'to_do_list_id', 'id');
    }

}
