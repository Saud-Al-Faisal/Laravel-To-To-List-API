<?php

namespace App\Repositories;

use App\Models\Task;
use App\Repositories\Interfaces\TaskRepositoryInterface;

class TaskRepository implements TaskRepositoryInterface
{
    public function getAll($query=[],$with=[]): \Illuminate\Contracts\Pagination\LengthAwarePaginator
    {
        return Task::with($with)->paginate(10);
    }

    public function store($data): array
    {
        $toDoListDatum = (new ToDoListRepository())->show($data['to_do_list_id']);
        if (!$toDoListDatum)
            return ['success' => false, 'message' => 'Invalid data submitted'];

        try {
            $newTask = new Task();
            $newTask->name = $data['name'];
            $newTask->to_do_list_id = $toDoListDatum->id;
            $newTask->save();
        } catch (\Exception $e) {
            return ['success' => false, 'message' => $e->getMessage()];
        }

        return ['success' => true, 'data' => $newTask];
    }

    public function show($uuid,$with=[])
    {
        return Task::with($with)->where(['uuid' => $uuid])->first();
    }

    public function update($uuid, $data): array
    {
        $task = $this->show($uuid);
        $toDoListDatum = (new ToDoListRepository())->show($data['to_do_list_id']);
        if (!$task || !$toDoListDatum)
            return ['success' => false, 'message' => 'Query data is invalid'];

        try {
            $task->name = $data['name'];
            $task->to_do_list_id = $toDoListDatum->id;
            $task->update();
        } catch (\Exception $e) {
            return ['success' => false, 'message' => $e->getMessage()];
        }

        return ['success' => true, 'data' => $task];
    }

    public function delete($uuid): array
    {
        $task = $this->show($uuid);
        if (!$task)
            return ['success' => false, 'message' => 'Query data is invalid'];

        try {
            $task->delete();
        } catch (\Exception $e) {
            return ['success' => false, 'message' => $e->getMessage()];
        }

        return ['success' => true, 'message' => 'Data delete success'];

    }
}
