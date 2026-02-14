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
        'home' => "Home page",
        'default' => 'Default',
        'page-sidebar' => 'Page with Service Sidebar',
    ]);

    register_sidebar([
        'id' => 'primary_sidebar',
        'name' => 'Primary Sidebar',
        'description' => 'Global sidebar displayed on all pages',
    ]);

});