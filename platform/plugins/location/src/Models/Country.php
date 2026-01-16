<?php

namespace Botble\Location\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Country extends BaseModel
{
    protected $table = 'countries';

    protected $fillable = [
        'name',
        'content',        
        'image',
        'nationality',
        'currency_name',
        'currency_code',
        'currency_symbol',
        'code',
        'order',
        'is_default',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
        'content' => SafeContent::class,
        'nationality' => SafeContent::class,
        'currency_name' => SafeContent::class,
        'currency_code' => SafeContent::class,
        'currency_symbol' => SafeContent::class,
        'code' => SafeContent::class,
        'is_default' => 'bool',
        'order' => 'int',
    ];

    protected static function booted(): void
    {
        static::deleted(function (Country $country) {
            $country->states()->delete();
            $country->cities()->delete();
        });
    }

    public function states(): HasMany
    {
        return $this->hasMany(State::class);
    }

    public function cities(): HasMany
    {
        return $this->hasMany(City::class);
    }
}
