<?php

// use Botble\Base\Facades\Html;
// use Botble\BusinessService\Models\Package;

use Botble\Base\Facades\Html;
use Botble\JobBoard\Facades\JobBoardHelper;
use Botble\JobBoard\Models\Category;
use Botble\JobBoard\Models\Job;
use Botble\Location\Models\Country;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Arr;

app()->booted(function () {
    if (!is_plugin_active('job-board')) {
        return;
    }

    Shortcode::register('jobcategory-scroller', __('Job Categories Scroller'), __('Job Categories Scroller'), function (ShortcodeCompiler $shortcode) {
        // if (! $job_categories = Shortcode::fields()->getIds('ids', $shortcode)) {
        //     return null;
        // }
        $job_categories = Category::query()
            ->wherePublished()
            ->withCount(['activeJobs as jobs_count'])
            ->paginate((int)$shortcode->limit_category ?: Arr::first(JobBoardHelper::getPerPageParams()));

        return Theme::partial("shortcodes.jobs.layout.job-categories-scroller", compact('shortcode', 'job_categories'));
    });

    // Shortcode::register('jobcategory', __('Job Categories'), __('Job Categories'), function (ShortcodeCompiler $shortcode) {
    //     // $job_categories = Category::query()
    //     //     ->wherePublished()
    //     //     ->pluck('name', 'id')
    //     //     ->all();

    //     $job_categories = Category::query()
    //         ->wherePublished()
    //         ->withCount(['activeJobs as jobs_count'])
    //         ->paginate((int)$shortcode->limit_category ?: Arr::first(JobBoardHelper::getPerPageParams()));


    //     return Theme::partial("shortcodes.jobs.layout.job-by-categories", compact('shortcode', 'job_categories'));
    // });

    // Shortcode::setAdminConfig('jobcategory', function (array $attributes) {
    //     return Theme::partial('shortcodes.jobs.admin.job-by-categories-config', compact('attributes'));
    // });

    add_shortcode('job-categories', __('Job categories'), __('Job categories'), function (ShortcodeCompiler $shortcode) {
        $job_categories = Category::query()
            ->wherePublished()
            ->withCount(['activeJobs as jobs_count'])
            ->paginate((int)$shortcode->limit_category ?: Arr::first(JobBoardHelper::getPerPageParams()));

        // return Theme::partial('shortcodes.job-categories', compact('shortcode', 'categories'));
        return Theme::partial("shortcodes.jobs.layout.job-by-categories", compact('shortcode', 'job_categories'));
    });

    shortcode()->setAdminConfig('job-categories', function (array $attributes) {
        return Theme::partial('shortcodes.job-categories-admin-config', compact('attributes'));
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

    if (is_plugin_active('location')) {
        add_shortcode(
            'jobs-by-location',
            __('Job by location'),
            __('Job by location'),
            function (Shortcode $shortcode) {
                // $cityIds = array_filter(explode(',', $shortcode->city));
                // $stateIds = array_filter(explode(',', $shortcode->state));
                $countryIds = array_filter(explode(',', $shortcode->country));



                // if (empty($stateIds)) {
                //     return null;
                // }

                // $cities = collect();
                // $states = collect();

                // if (!empty($cityIds)) {
                //     City::resolveRelationUsing('companies', function ($model) {
                //         return $model->hasMany(Company::class, 'city_id');
                //     });

                //     City::resolveRelationUsing('jobs', function ($model) {
                //         return $model->hasMany(Job::class, 'city_id');
                //     });

                //     $cities = City::query()
                //         ->whereIn('id', $cityIds)
                //         ->withCount([
                //             'companies',
                //             'jobs' => function (Builder $query) {
                //                 $query
                //                     ->active()
                //                     ->addApplied()
                //                     ->orderBy('is_featured', 'DESC')
                //                     ->latest();
                //             },
                //         ])
                //         ->with(['country', 'metadata'])
                //         ->take(6)
                //         ->get();
                // }

                // if (!empty($stateIds)) {
                //     State::resolveRelationUsing('companies', function ($model) {
                //         return $model->hasMany(Company::class, 'state_id');
                //     });

                //     State::resolveRelationUsing('jobs', function ($model) {
                //         return $model->hasMany(Job::class, 'state_id');
                //     });

                //     $states = State::query()
                //         ->whereIn('id', $stateIds)
                //         ->withCount([
                //             'companies',
                //             'jobs' => function (Builder $query) {
                //                 $query
                //                     ->active()
                //                     ->addApplied()
                //                     ->orderBy('is_featured', 'DESC')
                //                     ->latest();
                //             },
                //         ])
                //         ->with(['country', 'metadata'])
                //         ->take(6)
                //         ->get();
                // }

                $countries = collect();
                if (!empty($countryIds)) {
                    Country::resolveRelationUsing('companies', function ($model) {
                        return $model->hasMany(Company::class, 'country_id');
                    });

                    Country::resolveRelationUsing('jobs', function ($model) {
                        return $model->hasMany(Job::class, 'country_id');
                    });

                    $countries = Country::query()
                        ->whereIn('id', $countryIds)
                        ->withCount([
                            'companies',
                            'jobs' => function (Builder $query) {
                                $query
                                    ->active()
                                    ->addApplied()
                                    ->orderBy('is_featured', 'DESC')
                                    ->latest();
                            },
                        ])
                        ->with(['country', 'metadata'])
                        ->take(6)
                        ->get();
                }


                // $locations = $cities->merge($states);

                $locations = $countries;

                $title = $shortcode->title;
                $description = $shortcode->description;
                $style = $shortcode->style;

                return Theme::partial(
                    'shortcodes.job-by-location',
                    compact('title', 'description', 'style', 'states', 'locations')
                );
            }
        );

        shortcode()->setAdminConfig('jobs-by-location', function (array $attributes) {
            // $cities = City::query()
            //     ->wherePublished()
            //     ->pluck('name', 'id');

            // $states = State::query()
            //     ->wherePublished()
            //     ->pluck('name', 'id');
            $countries = Country::query()
                ->wherePublished()
                ->pluck('name', "id");

            return Html::script('vendor/core/core/base/libraries/tagify/tagify.js') .
                Html::script('vendor/core/core/base/js/tags.js') .
                Theme::partial(
                    'shortcodes.job-by-location-admin-config',
                    // compact('attributes', 'cities', 'states', 'countries')
                    compact('attributes',  'countries')
                );
        });
    }


    Shortcode::register('job-posts', __('Job Posts'), __('Job Posts'), function (ShortcodeCompiler $shortcode) {
        //$jobs = Job::with(['country', 'company', 'category'])
        $jobs = Job::with(['country', 'company'])
            ->wherePublished()
            ->take(6)
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
