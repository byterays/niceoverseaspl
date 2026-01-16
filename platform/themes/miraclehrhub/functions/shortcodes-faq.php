<?php

use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Faq\Models\Faq;
use Botble\Faq\Models\FaqCategory;
use Botble\Theme\Facades\Theme;

app()->booted(function () {
    if (!is_plugin_active('faq')) {
        return;
    }
    if (is_plugin_active('faq')) {
        Shortcode::register('faq', __('Faq'), __('Faq'), function (ShortcodeCompiler $shortcode) {


          
            if (!$categoryIds = Shortcode::fields()->getIds('category_ids', $shortcode)) {
                return null;
            }

           
            $faqs = Faq::query()
                ->whereIn('category_id', $categoryIds)
                ->wherePublished()
                ->get();

            $style = in_array(
                $shortcode->style,
                [
                    'style-1',
                ]
            ) ? $shortcode->style : 'style-1';
           
            //dd($shortcode, $faq);
            return Theme::partial("shortcodes.faq.styles.$style", compact('shortcode', 'faqs'));
        });

        Shortcode::setAdminConfig('faq', function (array $attributes) {
            $categories = FaqCategory::query()
                ->wherePublished()
                ->pluck('name', 'id')
                ->all();
            return Theme::partial('shortcodes.faq.admin-config', compact('attributes', 'categories'));
        });
    }

});
