<?php

namespace App\Repositories\Interfaces;

interface ApiRepositoryInterface
{
    public function getAll($query,$with);

    public function store($data);

    public function show($uuid,$with);

    public function update($uuid, $data);

    public function delete($uuid);
}
