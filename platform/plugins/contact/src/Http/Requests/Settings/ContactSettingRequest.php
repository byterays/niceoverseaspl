<?php

namespace Botble\Contact\Http\Requests\Settings;

use Botble\Support\Http\Requests\Request;

class ContactSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'blacklist_keywords' => ['nullable', 'string'],
            'contact_phone' => ['nullable', 'string'],
            'email_address' => ['nullable', 'string'],
            'office_address' => ['nullable', 'string'],
            'google_map_location' => ['nullable', 'string']
        ];
    }
}
