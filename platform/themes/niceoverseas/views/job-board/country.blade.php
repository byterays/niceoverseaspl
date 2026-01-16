@php

$jobs = $data["jobs"];



// Theme::asset()->container('footer')->usePath()->add('no-ui-slider', 'js/noUISlider.js');

// if (theme_option('show_map_on_jobs_page', 'yes') === 'yes') {
// Theme::asset()->usePath()->add('leaflet-css', 'plugins/leaflet/leaflet.css');
// Theme::asset()->container('footer')->usePath()->add('leaflet-js', 'plugins/leaflet/leaflet.js');
// Theme::asset()->container('footer')->usePath()->add('leaflet-markercluster-js', 'plugins/leaflet/leaflet.markercluster-src.js');
// }
@endphp

<section class="section-box mt-30">
    <div class="container">
        <div class="row flex-row-reverse justify-content-center row-filter">
            <div class="col-lg-9 col-md-12 col-sm-12 row col-12 float-right jobs-listing">

                <div class="ck-content">
                    {!! BaseHelper::clean($country->content) !!}

                    <h4 class="jobs-by-country-title" style="margin:10px 0; padding:10px; background:#F7941D; color:#fff; font-weight:bold;"><img style="height:50px" src="{{ RvMedia::getImageUrl($country->image) }}" class="img-fluid" alt="{{ $country->name }}"> {{ __('Jobs in :country', ['country' => $country->name]) }} </h4>
                
                </div>
                @include(Theme::getThemeNamespace('views.job-board.partials.job-items'), ['jobs' => $jobs, 'perPages' => $perPages ?? JobBoardHelper::getPerPageParams()])
            </div>

            @include(Theme::getThemeNamespace('views.job-board.partials.filters'))
        </div>
    </div>
</section>