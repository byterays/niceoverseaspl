<?php

namespace Botble\BusinessService\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ServiceIndustryRequest extends Request
{
    public function rules(): array
    {
        return [            
            'name' => [
                'required',
                'string',
                'min:3',
                'max:255',
            ],
            'description' => ['nullable', 'string', 'max:400'],
            'content' => ['nullable', 'string'],
            'image' => ['required', 'string'],
            'status' => ['required', 'string', Rule::in(BaseStatusEnum::values())],
        ];
    }
}
