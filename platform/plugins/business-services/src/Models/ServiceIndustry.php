<?php

namespace Botble\BusinessService\Models;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class ServiceIndustry extends BaseModel
{
    protected $table = 'bs_service_industries';

    protected $fillable = [       
        'name',
        'image',
        'description',
        'content',       
        'status',
    ];

    protected $casts = [       
        'status' => BaseStatusEnum::class,
    ];

    
}
