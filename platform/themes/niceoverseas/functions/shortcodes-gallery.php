<?php

use Botble\Gallery\Models\Gallery;
use Botble\Gallery\Models\GalleryMeta;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Theme\Facades\Theme;

app()->booted(function () {
    if (!is_plugin_active('gallery')) {
        return;
    }
    if (is_plugin_active('gallery')) {
        Shortcode::register('gallery-scroller', __('Gallery Scroller'), __('Gallery Scroller'), function (ShortcodeCompiler $shortcode) {


        
            if (!$galleryId = Shortcode::fields()->getIds('gallery_id', $shortcode)) {
                return null;
            }

           
            $gallery = Gallery::query()
                ->whereIn('id', $galleryId)
                ->wherePublished()
                ->first();

               
          
            $style = in_array(
                $shortcode->style,
                [
                    'style-1',
                ]
            ) ? $shortcode->style : 'style-1';
           
            //dd($shortcode, $faq);
            return Theme::partial("shortcodes.gallery-block.styles.$style", compact('shortcode', 'gallery'));
        });

        Shortcode::setAdminConfig('gallery-scroller', function (array $attributes) {
            $galleries = Gallery::query()
                ->wherePublished()
                ->pluck('name', 'id')
                ->all();
            return Theme::partial('shortcodes.gallery-block.admin-config', compact('attributes', 'galleries'));
        });
    }

});
