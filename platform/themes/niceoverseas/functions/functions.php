<?php

use Botble\Base\Facades\MetaBox;
use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\Blog\Models\Post;
use Botble\JobBoard\Forms\AccountForm;
use Botble\JobBoard\Forms\Fronts\AccountSettingForm;
use Botble\JobBoard\Models\Account;
use Botble\JobBoard\Models\Category;
use Botble\JobBoard\Models\Job;
use Botble\Media\Facades\RvMedia;
use Botble\Menu\Facades\Menu;
use Botble\Page\Models\Page;
use Botble\Theme\Facades\Theme;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Botble\Widget\Facades\Widget;



app()->booted(function () {

    RvMedia::setUploadPathAndURLToPublic();
    register_page_template([
        'default' => 'Home page',
        'sidebar-layout' => 'Page with sidebar'
    ]);

    add_action(BASE_ACTION_META_BOXES, function ($context, $object) {
        if ($context !== 'advanced' || !($object instanceof Page)) {
            return;
        }

        MetaBox::addMetaBox(
            'page_sidebar_widgets',
            __('Sidebar Widgets'),
            function () use ($object) {

                $widgets = MetaBox::getMetaData($object, 'sidebar_widgets', true);
                $widgets = $widgets ? json_decode($widgets, true) : [];

                return view(
                    Theme::getThemeNamespace() . '::partials.meta-boxes.sidebar-widgets',
                    compact('widgets')
                )->render();
            },
            Page::class,
            'side',
            'default'
        );
    }, 120, 2);

    add_action(BASE_ACTION_AFTER_UPDATE_CONTENT, function ($screen, Request $request, $object) {

        // Ensure this is Page save
        if ($screen !== PAGE_MODULE_SCREEN_NAME) {
            return;
        }

        if (!($object instanceof Page)) {
            return;
        }

        // Save sidebar widgets
        if ($request->has('sidebar_widgets') && is_array($request->input('sidebar_widgets'))) {

            MetaBox::saveMetaBoxData(
                $object,
                'sidebar_widgets',
                json_encode(array_values($request->input('sidebar_widgets')))
            );

        } else {
            MetaBox::deleteMetaBoxData($object, 'sidebar_widgets');
        }

    }, 120, 3);

    function theme_sidebar_widget_types()
    {
        return [
            'text' => __('Text'),
            'html' => __('Custom HTML'),
            'image' => __('Image'),
            'cta' => __('CTA Box'),
        ];
    }


});