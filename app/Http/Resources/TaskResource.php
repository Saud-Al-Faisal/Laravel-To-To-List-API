<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TaskResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'uuid' => $this->uuid,
            'name' => $this->name,
            'status' => $this->status,
            'to_do_list'=> new ToDoListResource($this->toDoList)
//            'created_by' => $this->creator->name,
//            'created_at' => $this->created_at->format('d-m-Y'),
//            'updated_by' => $this->updater->name ?? null,
//            'updated_at' => $this->updated_at->format('d-m-Y')
        ];
    }
}
