<?php

namespace Botble\Contact;

use Botble\PluginManagement\Abstracts\PluginOperationAbstract;
use Botble\Setting\Facades\Setting;
use Illuminate\Support\Facades\Schema;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('contact_replies');
        Schema::dropIfExists('contacts');

        Setting::delete([
            'contact_phone',
            'email_address',
            'office_address',
            'blacklist_keywords',
            'blacklist_email_domains',
            'enable_math_captcha_for_contact_form',
        ]);
    }
}
