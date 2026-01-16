<?php

use Botble\Base\Facades\AdminHelper;
use Botble\BusinessService\Http\Controllers\PackageController;
use Botble\BusinessService\Http\Controllers\PublicController;
use Botble\BusinessService\Http\Controllers\ServiceCategoryController;
use Botble\BusinessService\Http\Controllers\ServiceController;
use Botble\BusinessService\Http\Controllers\ServiceIndustryController;
use Botble\BusinessService\Models\Package;
use Botble\BusinessService\Models\Service;
use Botble\BusinessService\Models\ServiceIndustry;
use Botble\Slug\Facades\SlugHelper;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::middleware('auth')->prefix('business-services')->name('business-services.')->group(function () {
        
        Route::group(['prefix' => 'service-categories', 'as' => 'service-categories.'], function () {
            Route::resource('', ServiceCategoryController::class)
                ->parameters(['' => 'service_category']);
        });


        Route::group(['prefix' => 'services', 'as' => 'services.'], function () {
            Route::resource('', ServiceController::class)
                ->parameters(['' => 'service']);
        });

        Route::group(['prefix' => 'service-industries', 'as' => 'service-industries.'], function () {
            Route::resource('', ServiceIndustryController::class)
                ->parameters(['' => 'service-industry']);
        });

        Route::group(['prefix' => 'packages', 'as' => 'packages.'], function () {
            Route::resource('', PackageController::class)
                ->parameters(['' => 'package']);
        });
    });
});

Theme::registerRoutes(function () {
    Route::get(
        sprintf('%s/{slug}', SlugHelper::getPrefix(Service::class, 'services')),
        [PublicController::class, 'service']
    )
        ->name('public.service');


    Route::get(
        sprintf('%s/{slug}', SlugHelper::getPrefix(ServiceIndustry::class, 'service-industries')),
        [PublicController::class, 'service-industry']
    )
        ->name('public.service-industry');


    Route::get(
        sprintf('%s/{slug}', SlugHelper::getPrefix(Package::class, 'packages')),
        [PublicController::class, 'package']
    )
        ->name('public.package');
});
