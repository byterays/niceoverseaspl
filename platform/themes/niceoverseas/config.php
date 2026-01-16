<?php

use Botble\Theme\Theme;

return [

    /*
    |--------------------------------------------------------------------------
    | Inherit from another theme
    |--------------------------------------------------------------------------
    */

    'inherit' => null, //default

    /*
    |--------------------------------------------------------------------------
    | Listener from events
    |--------------------------------------------------------------------------
    |
    | You can hook a theme when event fired on activities
    | this is cool feature to set up a title, meta, default styles and scripts.
    |
    | [Notice] these events can be overridden by package config.
    |
    */

    'events' => [

        // Before event inherit from package config and the theme that call before,
        // you can use this event to set meta, breadcrumb template or anything
        // you want inheriting.
        'before' => function ($theme): void {
            // You can remove this line anytime.
        },

        // Listen on event before render a theme,
        // this event should call to assign some assets,
        // breadcrumb template.
        'beforeRenderTheme' => function (Theme $theme): void {
            // Partial composer.
            // $theme->partialComposer('header', function($view) {
            //     $view->with('auth', \Auth::user());
            // });
        
            // You may use this event to set up your assets.
        
            $theme->asset()->usePath()->add('bootstrap', '/css/bootstrap.min.css');
            $theme->asset()->usePath()->add('slicknav', '/css/slicknav.min.css');
            $theme->asset()->usePath()->add('swiper', '/css/swiper-bundle.min.css');
            $theme->asset()->usePath()->add('all-icons', '/css/all.min.css');
            $theme->asset()->usePath()->add('animate', '/css/animate.css');
            $theme->asset()->usePath()->add('magnific-popup', '/css/magnific-popup.css');
            $theme->asset()->usePath()->add('mouse-cursor', '/css/mousecursor.css');
            $theme->asset()->usePath()->add('style', '/css/custom.css');

            $theme->asset()->container('footer')->usePath()->add('jquery', '/js/jquery-3.7.1.min.js');
            $theme->asset()->container('footer')->usePath()->add('bootstrap', '/js/bootstrap.min.js');
            $theme->asset()->container('footer')->usePath()->add('validator', '/js/validator.min.js');
            $theme->asset()->container('footer')->usePath()->add('slicknav', '/js/jquery.slicknav.js');
            $theme->asset()->container('footer')->usePath()->add('swiper', '/js/swiper-bundle.min.js');
            $theme->asset()->container('footer')->usePath()->add('waypoints', '/js/jquery.waypoints.min.js');
            $theme->asset()->container('footer')->usePath()->add('counterup', '/js/jquery.counterup.min.js');
            $theme->asset()->container('footer')->usePath()->add('magnific-popup', '/js/jquery.magnific-popup.min.js');
            $theme->asset()->container('footer')->usePath()->add('smooth-scroll', '/js/SmoothScroll.js');
            $theme->asset()->container('footer')->usePath()->add('parallaxie', '/js/parallaxie.js');
            $theme->asset()->container('footer')->usePath()->add('gsap', '/js/gsap.min.js');
            $theme->asset()->container('footer')->usePath()->add('magiccursor', '/js/magiccursor.js');
            $theme->asset()->container('footer')->usePath()->add('SplitText', '/js/SplitText.js');
            $theme->asset()->container('footer')->usePath()->add('ScrollTrigger', '/js/ScrollTrigger.min.js');
            $theme->asset()->container('footer')->usePath()->add('YTPlayer', '/js/jquery.mb.YTPlayer.min.js');
            $theme->asset()->container('footer')->usePath()->add('wow', '/js/wow.min.js');
            $theme->asset()->container('footer')->usePath()->add('function', '/js/function.js');

            if (function_exists('shortcode')) {
                $theme->composer(['page', 'post'], function (\Botble\Shortcode\View\View $view) {
                    $view->withShortcodes();
                });
            }
        },

        // Listen on event before render a layout,
        // this should call to assign style, script for a layout.
        'beforeRenderLayout' => [
            'default' => function ($theme): void {
                // $theme->asset()->usePath()->add('ipad', 'css/layouts/ipad.css');
            },
        ],
    ],
];
