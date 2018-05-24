<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Teeth extends Model
{   
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'teeth';

    /**
    * The database primary key value.
    *
    * @var string
    */
    protected $primaryKey = 'teethID';

    public function schedule()
    {
        return $this->belongsTo('App\Schedule');
    }
}
