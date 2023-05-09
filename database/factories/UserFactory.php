<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;

class UserFactory extends Factory
{
    public function definition()
    {
        return [
            'name' => 'Api user',
            'email' => 'user@api.com',
            'password' => Hash::make('user')
        ];
    }

}
