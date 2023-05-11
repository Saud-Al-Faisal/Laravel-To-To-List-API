<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\StoreTaskRequest;
use App\Http\Resources\TaskCollection;
use App\Http\Resources\TaskResource;
use App\Repositories\Interfaces\TaskRepositoryInterface;

class TaskController extends ApiController
{
    private $repository;

    public function __construct(TaskRepositoryInterface $repository)
    {
        $this->repository = $repository;
    }

    public function index(): \Illuminate\Http\JsonResponse
    {
        return $this->sendResponse('Data fetched',   TaskResource::collection($this->repository->getAll([],['toDoList']))->response()->getData(true));
    }

    public function store(StoreTaskRequest $request): \Illuminate\Http\JsonResponse
    {
        $storeData = $this->repository->store($request->validated());
        if ($storeData['success'])
            return $this->sendResponse('Data has been stored successfully', new TaskResource($storeData['data']));
        return $this->sendError('message');
    }

    public function show($uuid): \Illuminate\Http\JsonResponse
    {
        $task = $this->repository->show($uuid);
        if (!$task)
            return $this->sendError('Query data is invalid');

        return $this->sendResponse('Data fetched',  new TaskResource($task));
    }

    public function update(StoreTaskRequest $request, $uuid): \Illuminate\Http\JsonResponse
    {
        $updateData = $this->repository->update($uuid, $request->validated());
        if (!$updateData['success'])
            return $this->sendError($updateData['message']);

        return $this->sendResponse('Data has been updated successfully', new TaskResource($updateData['data']));
    }

    public function destroy($uuid): \Illuminate\Http\JsonResponse
    {
        $deleteData = $this->repository->delete($uuid);
        if (!$deleteData['success'])
            return $this->sendError($deleteData['message']);

        return $this->sendResponse($deleteData['message']);
    }
}
