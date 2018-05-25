<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'invhistory';

    /**
    * The database primary key value.
    *
    * @var string
    */
    protected $primaryKey = 'invHistID';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['invID', 'patID', 'quantity', 'historyStatus', 'dateUpdated'];
    
    public function FunctionName(Type $var = null)
    {
        # code...
    }
}
