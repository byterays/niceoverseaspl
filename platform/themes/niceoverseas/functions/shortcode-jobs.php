<?php

// use Botble\Base\Facades\Html;
// use Botble\BusinessService\Models\Package;

use Botble\Jobs\Models\JobCategory;
use Botble\Jobs\Models\Jobs;
use Botble\Location\Location;
use Botble\Location\Models\Country;
// use Botble\BusinessService\Models\Service;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Theme\Facades\Theme;

app()->booted(function () {
    if (!is_plugin_active('jobs')) {
        return;
    }

    Shortcode::register('jobcategory-scroller', __('Job Categories Scroller'), __('Job Categories Scroller'), function (ShortcodeCompiler $shortcode) {
        // if (! $job_categories = Shortcode::fields()->getIds('ids', $shortcode)) {
        //     return null;
        // }
        $job_categories = JobCategory::query()
            ->wherePublished()
            ->pluck('name', 'id')
            ->all();

        return Theme::partial("shortcodes.jobs.layout.job-categories-scroller", compact('shortcode', 'job_categories'));
    });

    Shortcode::register('jobcategory', __('Job Categories'), __('Job Categories'), function (ShortcodeCompiler $shortcode) {
        $job_categories = JobCategory::query()
            ->wherePublished()
            ->pluck('name', 'id')
            ->all();

        return Theme::partial("shortcodes.jobs.layout.job-by-categories", compact('shortcode', 'job_categories'));
    });

    Shortcode::setAdminConfig('jobcategory', function (array $attributes) {
        return Theme::partial('shortcodes.jobs.admin.job-by-categories-config', compact('attributes'));
    });

    Shortcode::register('jobbycountry', __('Job By Country'), __('Job By Country'), function (ShortcodeCompiler $shortcode) {
        $countries = Country::query()
            ->wherePublished()
            ->get();

        return Theme::partial("shortcodes.jobs.layout.job-by-country", compact('shortcode', 'countries'));
    });

    Shortcode::setAdminConfig('jobbycountry', function (array $attributes) {
        return Theme::partial('shortcodes.jobs.admin.job-by-country-config', compact('attributes'));
    });


    Shortcode::register('job-posts', __('Job Posts'), __('Job Posts'), function (ShortcodeCompiler $shortcode) {
        $jobs = Jobs::with(['country','company', 'category'])
            ->wherePublished()
            ->orderByDesc("id")
            ->get();

        $style = in_array(
            $shortcode->style,
            [
                'style-1',
                'style-2',
            ]
        ) ? $shortcode->style : 'style-1';

        return Theme::partial("shortcodes.jobs.layout.job-posts-$style", compact('shortcode', 'jobs'));
    });

    Shortcode::setAdminConfig('job-posts', function (array $attributes) {
        return Theme::partial('shortcodes.jobs.admin.job-posts-config', compact('attributes'));
    });
});
