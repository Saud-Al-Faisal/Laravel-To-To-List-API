<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ToDoListResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'uuid' => $this->uuid,
            'name' => $this->name,
//            'created_by' => $this->creator->name,
//            'created_at' => $this->created_at->format('d-m-Y'),
//            'updated_by' => $this->updater->name ?? null,
//            'updated_at' => $this->updated_at->format('d-m-Y')

        ];
    }
}
