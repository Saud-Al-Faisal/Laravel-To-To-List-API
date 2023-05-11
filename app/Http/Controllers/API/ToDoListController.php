<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\StoreToDoListRequest;
use App\Http\Resources\ToDoListCollection;
use App\Http\Resources\ToDoListResource;
use App\Repositories\Interfaces\ToDoListRepositoryInterface;

class ToDoListController extends ApiController
{
    private $repository;

    public function __construct(ToDoListRepositoryInterface $repository)
    {
        $this->repository = $repository;
    }

    public function index(): \Illuminate\Http\JsonResponse
    {
        return $this->sendResponse('Data fetched', ToDoListResource::collection($this->repository->getAll())->response()->getData(true));
    }

    public function store(StoreToDoListRequest $request): \Illuminate\Http\JsonResponse
    {
        $storeData = $this->repository->store($request->validated());
        if ($storeData['success'])
            return $this->sendResponse('Data has been stored successfully', new ToDoListResource($storeData['data']));
        return $this->sendError('message');
    }

    public function show(string $uuid): \Illuminate\Http\JsonResponse
    {
        $toDoListDatum = $this->repository->show($uuid);
        if (!$toDoListDatum)
            return $this->sendError('Query data is invalid');

        return $this->sendResponse('Data fetched', new ToDoListResource($toDoListDatum));
    }

    public function update(StoreToDoListRequest $request, $uuid): \Illuminate\Http\JsonResponse
    {
        $updateData = $this->repository->update($uuid, $request->validated());
        if (!$updateData['success'])
            return $this->sendError($updateData['message']);

        return $this->sendResponse('Data has been updated successfully', new ToDoListResource($updateData['data']));
    }

    public function destroy(string $uuid): \Illuminate\Http\JsonResponse
    {
        $deleteData = $this->repository->delete($uuid);
        if (!$deleteData['success'])
            return $this->sendError($deleteData['message']);

        return $this->sendResponse($deleteData['message']);
    }
}
