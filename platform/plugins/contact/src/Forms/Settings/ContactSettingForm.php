<?php

namespace Botble\Contact\Forms\Settings;

use Botble\Base\Facades\Assets;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Contact\Http\Requests\Settings\ContactSettingRequest;
use Botble\Setting\Forms\SettingForm;

class ContactSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        Assets::addStylesDirectly('vendor/core/core/base/libraries/tagify/tagify.css')
            ->addScriptsDirectly([
                'vendor/core/core/base/libraries/tagify/tagify.js',
                'vendor/core/core/base/js/tags.js',
            ]);

        $this
            ->setSectionTitle(trans('plugins/contact::contact.settings.title'))
            ->setSectionDescription(trans('plugins/contact::contact.settings.description'))
            ->setValidatorClass(ContactSettingRequest::class)
            ->add('contact_phone', 'text', [
                'label' => trans('plugins/contact::contact.settings.phone'), 
                'colspan' => 6, 
                'value' => setting('contact_phone'),                  
            ])
            ->add('email_address', 'text', [
                'label' => trans('plugins/contact::contact.settings.email_address'), 
                'colspan' => 6,  
                'value' => setting('email_address'),                      
            ])
           
            ->add('office_address', TextareaField::class, [
                'label' => trans('plugins/contact::contact.settings.office_address'), 
                'colspan' => 6,  
                'rows' => 3,   
                'data-counter' => '250',   
                'value' => setting('office_address'),                   
            ])
            ->add('google_map_location', 'text', [
                'label' => trans('plugins/contact::contact.settings.google_map_location'), 
                'colspan' => 6,  
                'value' => setting('google_map_location'),                      
            ]);
    }
}

