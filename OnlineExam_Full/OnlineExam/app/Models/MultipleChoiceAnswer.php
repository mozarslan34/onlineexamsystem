<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MultipleChoiceAnswer extends Model
{
    use HasFactory;
    protected $table = "multiple_choice_answers";
    protected $guarded = [];
    public function question()
    {
        return $this->hasMany(Question::class);
    }


}
