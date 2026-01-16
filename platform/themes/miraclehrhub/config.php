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
            $theme->asset()->usePath()->add('stylesheet', '/assets/vendors/reey-font/stylesheet.css');
            $theme->asset()->usePath()->add('bootstrap', '/assets/vendors/bootstrap/css/bootstrap.min.css');
            $theme->asset()->usePath()->add('bootstrap-select', '/assets/vendors/bootstrap-select/bootstrap-select.min.css');
            $theme->asset()->usePath()->add('animate', '/assets/vendors/animate/animate.min.css');
            $theme->asset()->usePath()->add('fontawesome-all', '/assets/vendors/fontawesome/css/all.min.css');
            $theme->asset()->usePath()->add('jquery-ui', '/assets/vendors/jquery-ui/jquery-ui.css');
            $theme->asset()->usePath()->add('jarallax', '/assets/vendors/jarallax/jarallax.css');
            $theme->asset()->usePath()->add('jquery-magnific-popup', '/assets/vendors/jquery-magnific-popup/jquery.magnific-popup.css');
            $theme->asset()->usePath()->add('nouislider', '/assets/vendors/nouislider/nouislider.min.css');
            $theme->asset()->usePath()->add('nouislider-pips', '/assets/vendors/nouislider/nouislider.pips.css');
            $theme->asset()->usePath()->add('slick', '/assets/vendors/slick/slick.css');
            $theme->asset()->usePath()->add('icon-style', '/assets/vendors/miracle-icons/style.css');
            $theme->asset()->usePath()->add('owl-carousel', '/assets/vendors/owl-carousel/css/owl.carousel.min.css');
            $theme->asset()->usePath()->add('owl-theme-default', '/assets/vendors/owl-carousel/css/owl.theme.default.min.css');        
            $theme->asset()->usePath()->add('style', 'assets/css/style.css');
            $theme->asset()->usePath()->add('job-board', 'assets/css/job-board.css');

            $theme->asset()->container('footer')->usePath()->add('jquery', '/assets/vendors/jquery/jquery-3.7.0.min.js');
            $theme->asset()->container('footer')->usePath()->add('bootstrap-bundle', '/assets/vendors/bootstrap/js/bootstrap.bundle.min.js');
            $theme->asset()->container('footer')->usePath()->add('bootstrap-select', '/assets/vendors/bootstrap-select/bootstrap-select.min.js');
            $theme->asset()->container('footer')->usePath()->add('jarallax', '/assets/vendors/jarallax/jarallax.min.js');
            $theme->asset()->container('footer')->usePath()->add('jquery-ui', '/assets/vendors/jquery-ui/jquery-ui.js');
            $theme->asset()->container('footer')->usePath()->add('jquery-ajaxchimp', '/assets/vendors/jquery-ajaxchimp/jquery.ajaxchimp.min.js');
            $theme->asset()->container('footer')->usePath()->add('jquery-appear', '/assets/vendors/jquery-appear/jquery.appear.min.js');
            $theme->asset()->container('footer')->usePath()->add('jquery-circle-progress', '/assets/vendors/jquery-circle-progress/jquery.circle-progress.min.js');
            $theme->asset()->container('footer')->usePath()->add('jquery-magnigic-popup', '/assets/vendors/jquery-magnific-popup/jquery.magnific-popup.min.js');
            $theme->asset()->container('footer')->usePath()->add('jquery-validate', '/assets/vendors/jquery-validate/jquery.validate.min.js');
            //$theme->asset()->container('footer')->usePath()->add('nouislider', '/assets/vendors/nouislider/nouislider.min.js');
            $theme->asset()->container('footer')->usePath()->add('slick', '/assets/vendors/slick/slick.min.js');
            $theme->asset()->container('footer')->usePath()->add('wnumb', '/assets/vendors/wnumb/wNumb.min.js');
            $theme->asset()->container('footer')->usePath()->add('owl-carousel', '/assets/vendors/owl-carousel/js/owl.carousel.min.js');
            $theme->asset()->container('footer')->usePath()->add('wow', '/assets/vendors/wow/wow.js');
            $theme->asset()->container('footer')->usePath()->add('imagesloaded', '/assets/vendors/imagesloaded/imagesloaded.min.js');
            $theme->asset()->container('footer')->usePath()->add('isotope', '/assets/vendors/isotope/isotope.js');
            $theme->asset()->container('footer')->usePath()->add('countdown', '/assets/vendors/countdown/countdown.min.js');
            $theme->asset()->container('footer')->usePath()->add('jquery-circletype', '/assets/vendors/jquery-circleType/jquery.circleType.js');
            $theme->asset()->container('footer')->usePath()->add('jquery-lettering', '/assets/vendors/jquery-lettering/jquery.lettering.min.js');
            $theme->asset()->container('footer')->usePath()->add('miracle', '/assets/js/miracle.js');
            

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
