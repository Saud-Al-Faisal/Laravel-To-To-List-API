<?php

namespace App\Traits;

use App\Models\User;
use Illuminate\Support\Str;

trait CommonColumn
{
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (!$model->uuid) {
                $model->uuid = Str::uuid()->toString();
            }
            $model->created_by =  auth('sanctum')->id() ?? User::orderBy('id','asc')->first()->id;
        });

        static::updating(function ($model) {
            $model->updated_by = auth('sanctum')->id();
        });

        static::deleting(function ($model) {
            $model->deleted_by = auth('sanctum')->id();
        });
    }

}
