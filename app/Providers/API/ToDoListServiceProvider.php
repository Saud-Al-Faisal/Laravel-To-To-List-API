<?php

namespace App\Providers\API;

use Illuminate\Support\ServiceProvider;

class ToDoListServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('App\Repositories\Interfaces\ToDoListRepositoryInterface', 'App\Repositories\ToDoListRepository');
        $this->app->bind('App\Repositories\Interfaces\TaskRepositoryInterface', 'App\Repositories\TaskRepository');
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
