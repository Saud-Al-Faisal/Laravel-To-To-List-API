<?php

namespace App\Repositories;

use App\Models\ToDoList;
use App\Repositories\Interfaces\ToDoListRepositoryInterface;
use Illuminate\Support\Facades\DB;

class ToDoListRepository implements ToDoListRepositoryInterface
{
    public function getAll($query = [], $with = []): \Illuminate\Contracts\Pagination\LengthAwarePaginator
    {
        return ToDoList::with($with)->paginate(10);
    }

    public function store($data): array
    {
        try {
            $newToDoList = new ToDoList();
            $newToDoList->name = $data['name'];
            $newToDoList->save();
        } catch (\Exception $e) {
            return ['success' => false, 'message' => $e->getMessage()];
        }
        return ['success' => true, 'data' => $newToDoList];
    }

    public function show($uuid, $with = [])
    {
        return ToDoList::with($with)->where(['uuid' => $uuid])->first();
    }

    public function update($uuid, $data): array
    {
        $toDoListDatum = $this->show($uuid);
        if (!$toDoListDatum)
            return ['success' => false, 'message' => 'Query data is invalid'];

        try {
            $toDoListDatum->name = $data['name'];
            $toDoListDatum->update();
        } catch (\Exception $e) {
            return ['success' => false, 'message' => $e->getMessage()];
        }

        return ['success' => true, 'data' => $toDoListDatum];
    }

    public function delete($uuid): array
    {
        $toDoListDatum = $this->show($uuid, ['tasks']);
        if (!$toDoListDatum)
            return ['success' => false, 'message' => 'Query data is invalid'];

        DB::beginTransaction();
        try {
            $toDoListDatum->tasks->each(function($task) {
                $task->delete();
            });
            $toDoListDatum->delete();
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            return ['success' => false, 'message' => $e->getMessage()];
        }

        return ['success' => true, 'message' => 'Data delete success'];

    }
}
