<?php

use Botble\Blog\Models\Category;

use Botble\JobBoard\Facades\JobBoardHelper;
use Botble\JobBoard\Models\Job;
use Botble\JobBoard\Repositories\Interfaces\JobInterface;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Supports\ThemeSupport;

use Botble\Location\Facades\Location;
use Botble\SeoHelper\Facades\SeoHelper;

use Botble\JobBoard\Models\Company;
use Botble\Base\Facades\Assets;
use Botble\Base\Facades\Html;
use Botble\Blog\Repositories\Interfaces\PostInterface;

use Botble\JobBoard\Enums\AccountTypeEnum;

use Botble\JobBoard\Models\Account;

use Botble\JobBoard\Models\Package;
use Botble\JobBoard\Repositories\Interfaces\CategoryInterface;
use Botble\Location\Models\City;
use Botble\Location\Models\State;
use Botble\Team\Models\Team;
use Botble\Testimonial\Models\Testimonial;
use Illuminate\Contracts\Database\Query\Builder;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Arr;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    // custom shortcodes

    //hero banner
    Shortcode::register('hero-banner', __('Hero banner'), __('Hero banner'), function (ShortcodeCompiler $shortcode) {
        $tabs = Shortcode::fields()->getTabsData(['main_heading', 'small_heading', 'features', 'button_label', 'button_link', 'slide_image'], $shortcode);
        $style = in_array(
            $shortcode->style,
            [
                'style-1',
                'style-2',
                'style-3',
                'style-4'
            ]
        ) ? $shortcode->style : 'style-1';

        return Theme::partial("shortcodes.hero-banner.styles.$style", compact('shortcode', 'tabs'));
    });
    Shortcode::setAdminConfig('hero-banner', function (array $attributes) {
        return Theme::partial('shortcodes.hero-banner.admin-config', compact('attributes'));
    });


    //about us
    Shortcode::register(
        'about-us',
        __('About Us'),
        __('About section with images and features'),
        function (ShortcodeCompiler $shortcode) {

            // IMPORTANT: tell Botble the tab name is "features"
            $tabs = Shortcode::fields()->getTabsData(
                ['icon', 'title', 'description'],
                $shortcode,
                'features'
            );

            // Filter empty rows (recommended)
            $tabs = array_values(array_filter($tabs, function ($item) {
                return
                    (isset($item['icon']) && trim($item['icon']) !== '') ||
                    (isset($item['title']) && trim($item['title']) !== '') ||
                    (isset($item['description']) && trim($item['description']) !== '');
            }));

            return Theme::partial(
                'shortcodes.about-us.style-1',
                compact('shortcode', 'tabs')
            );
        }
    );

    Shortcode::setAdminConfig('about-us', function (array $attributes) {
        return Theme::partial('shortcodes.about-us.admin-config', compact('attributes'));
    });


    //our services

    Shortcode::register(
        'our-services',
        __('Our Services'),
        __('Services grid with icons and links'),
        function (ShortcodeCompiler $shortcode) {

            $services = Shortcode::fields()->getTabsData(['icon', 'title', 'description', 'link'], $shortcode, 'services');

            // Remove empty rows
            $services = array_values(array_filter($services, function ($item) {
                return trim($item['title'] ?? '') !== '';
            }));

            return Theme::partial('shortcodes.our-services.styles.style-1', compact('shortcode', 'services'));
        }
    );

    Shortcode::setAdminConfig('our-services', function (array $attributes) {
        return Theme::partial('shortcodes.our-services.admin-config', compact('attributes'));
    });



    // what we do
    Shortcode::register(
        'what-we-do',
        __('What We Do Section'),  // This is the name
        __('What We Do section with image, features and list'),  // This is the description
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.what-we-do.what-we-do', compact('shortcode'));
        }
    );

    Shortcode::setAdminConfig('what-we-do', function ($attributes) {

        return Theme::partial(
            'shortcodes.what-we-do.admin-config',
            compact('attributes')
        );
    });



    //why choose us
    Shortcode::register(
        'why-choose-us',
        __('Why Choose Us Section'),
        __('Why Choose Us section with image, video and items'),
        function ($shortcode) {
            return Theme::partial('shortcodes.why-choose-us.why-choose-us', compact('shortcode'));
        }
    );

    Shortcode::setAdminConfig('why-choose-us', function ($attributes) {
        return Theme::partial(
            'shortcodes.why-choose-us.admin-config',
            compact('attributes')
        );
    });


    //out benefits
    Shortcode::register(
        'our-benefits',
        __('Our Benefits Section'),
        __('Our Benefits section with content, list and images'),
        function ($shortcode) {
            return Theme::partial('shortcodes.our-benefits.our-benefits', compact('shortcode'));
        }
    );

    Shortcode::setAdminConfig('our-benefits', function ($attributes) {
        return Theme::partial(
            'shortcodes.our-benefits.admin-config',
            compact('attributes')
        );
    });




    ////////////////////////////////////////////////////////

    //intro block

    Shortcode::register('intro-block', __('Intro Block'), __('Intro Block'), function (ShortcodeCompiler $shortcode) {
        $tabs = Shortcode::fields()->getTabsData(['icon', 'title', 'description', 'image', 'link_url', 'link_text'], $shortcode);
        $style = in_array(
            $shortcode->style,
            [
                'style-1',
                'style-2',
            ]
        ) ? $shortcode->style : 'style-1';
        $icons = in_array(
            $shortcode->icons,
            [
                'icon-solution',
                'icon-mission',
                'icon-creative-idea'
            ]
        ) ? $shortcode->icons : 'icon-solution';

        return Theme::partial("shortcodes.intro-block.front-end.$style", compact('shortcode', 'tabs'));
    });

    Shortcode::setAdminConfig('intro-block', function (array $attributes) {
        return Theme::partial('shortcodes.intro-block.admin-config', compact('attributes'));
    });


    add_shortcode('gallery', __('Gallery'), __('Gallery'), function (Shortcode $shortcode) {
        return Theme::partial('shortcodes.gallery', compact('shortcode'));
    });

    shortcode()->setAdminConfig('gallery', function (array $attributes) {
        return Theme::partial('shortcodes.gallery-admin-config', compact('attributes'));
    });

    add_shortcode('how-it-works', __('How It Works'), __('How It Works'), function (Shortcode $shortcode) {
        return Theme::partial('shortcodes.how-it-works', compact('shortcode'));
    });

    shortcode()->setAdminConfig('how-it-works', function (array $attributes) {
        return Theme::partial('shortcodes.how-it-works-admin-config', compact('attributes'));
    });

    if (is_plugin_active('testimonial')) {
        add_shortcode('testimonials', __('Testimonials'), __('Testimonials'), function (Shortcode $shortcode) {
            $testimonials = Testimonial::query()
                ->wherePublished()
                ->get();

            return Theme::partial('shortcodes.testimonials', compact('shortcode', 'testimonials'));
        });

        shortcode()->setAdminConfig('testimonials', function (array $attributes) {
            return Theme::partial('shortcodes.testimonials-admin-config', compact('attributes'));
        });
    }

    Shortcode::register('profile-showcase', __('Profile Showcase'), __('Profile Showcase'), function (ShortcodeCompiler $shortcode) {
        $tabs = Shortcode::fields()->getTabsData(['company_logo', 'profile_thumb', 'website_text', 'website_link', 'profile_text', 'profile_link'], $shortcode);
        $style = in_array(
            $shortcode->style,
            [
                'style-1',
            ]
        ) ? $shortcode->style : 'style-1';

        return Theme::partial("shortcodes.profile-showcase.styles.$style", compact('shortcode', 'tabs'));
    });
    Shortcode::setAdminConfig('profile-showcase', function (array $attributes) {
        return Theme::partial('shortcodes.profile-showcase.admin-config', compact('attributes'));
    });

    Shortcode::register('footer-map', __('Footer Map'), __('Footer Map'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial("shortcodes.footer-map.layout", compact('shortcode'));
    });
    Shortcode::setAdminConfig('footer-map', function (array $attributes) {
        return Theme::partial('shortcodes.footer-map.admin-config', compact('attributes'));
    });


    Shortcode::register('clients-carousel', __('Clients Carousel'), __('Clients Carousel'), function (ShortcodeCompiler $shortcode) {
        $clients = Company::query()
            ->wherePublished()
            ->get();
        return Theme::partial("shortcodes.clients.style-1", compact('shortcode', 'clients'));
    });

});
