<?php

use Botble\Base\Http\Middleware\RequiresJsonRequestMiddleware;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;
use Theme\Miraclehrhub\Http\Controllers\MiraclehrhubController;

// Custom routes
// You can delete this route group if you don't need to add your custom routes.
Route::group(['controller' => MiraclehrhubController::class, 'middleware' => ['web', 'core']], function () {
    // Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {

    //     // Add your custom route here
    //     // Ex: Route::get('hello', 'getHello');

    // });

    Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
        Route::group(['as' => 'public.'], function () {
            Route::group(['prefix' => 'ajax', 'as' => 'ajax.'], function () {
                Route::controller('JobboxController')
                    ->middleware(RequiresJsonRequestMiddleware::class)
                    ->group(function () {
                        Route::get('categories', [
                            'as' => 'categories',
                            'uses' => 'ajaxGetJobCategories',
                        ]);

                        Route::get('jobs-by-category/{category_id}', [
                            'as' => 'jobs-by-category',
                            'uses' => 'ajaxGetJobByCategories',
                        ]);

                        Route::get('locations', [
                            'as' => 'locations',
                            'uses' => 'ajaxGetLocation',
                        ]);

                        Route::get('quick-search-jobs', [
                            'as' => 'quick-search-jobs',
                            'uses' => 'ajaxQuickSearchJobs',
                        ]);
                    });
            });
        });
    });

});

Theme::routes();
