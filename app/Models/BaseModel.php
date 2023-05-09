<?php

namespace App\Models;

use App\Traits\CommonColumn;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BaseModel extends Model
{
    use CommonColumn;
    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class,'created_by','id');
    }
    public function updater(): BelongsTo
    {
        return $this->belongsTo(User::class,'updated_by','id');
    }
}
