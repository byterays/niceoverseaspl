<?php

// use Botble\Base\Facades\Html;
// use Botble\BusinessService\Models\Package;

use Botble\BusinessService\Models\ServiceIndustry;
use Botble\BusinessService\Models\Service;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Theme\Facades\Theme;

app()->booted(function () {
    if (! is_plugin_active('business-services')) {
        return;
    }

    Shortcode::register('services', __('Services'), __('Services'), function (ShortcodeCompiler $shortcode) {
        if (! $serviceIds = Shortcode::fields()->getIds('service_ids', $shortcode)) {
            return null;
        }

        $services = Service::query()
            ->whereIn('id', $serviceIds)
            ->wherePublished()
            ->get();

        $style = in_array(
            $shortcode->style,
            ['style-1', 'style-2', 'style-3', 'style-4']
        ) ? $shortcode->style : 'style-1';

        return Theme::partial(
            "shortcodes.services.styles.$style",
            compact('shortcode', 'services')
        );
    });

    Shortcode::setAdminConfig('services', function (array $attributes) {
        $services = Service::query()
            ->wherePublished()
            ->pluck('name', 'id')
            ->all();

        return Theme::partial('shortcodes.services.admin-config', compact('attributes', 'services'));
    });

    Shortcode::register('industries-block', __('Industries Block'), __('Industries Block'), function (ShortcodeCompiler $shortcode) {
        if (! $industries = Shortcode::fields()->getIds('industry_ids', $shortcode)) {
            return null;
        }
        $industries = ServiceIndustry::query()
        ->whereIn('id', $industries)
        ->wherePublished()
        ->get();
       
        return Theme::partial("shortcodes.industries-block.layout", compact('shortcode','industries'));
    });
    Shortcode::setAdminConfig('industries-block', function (array $attributes) {     
        $industries = ServiceIndustry::query()
        ->wherePublished()
        ->pluck('name', 'id')
        ->all();  
        return Theme::partial('shortcodes.industries-block.admin-config', compact('attributes','industries'));
    });

});
