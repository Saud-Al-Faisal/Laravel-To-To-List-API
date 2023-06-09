<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class ToDoListFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->text(100),
            'created_by' => 1
        ];
    }
}
