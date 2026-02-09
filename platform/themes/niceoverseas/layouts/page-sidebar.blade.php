{!! Theme::partial('header') !!}

{!! Theme::partial('page-header') !!}

@php
    $page = Theme::get('page');

    $widgets = $page ? json_decode($page->getMetaData('sidebar_widgets', true) ?: '[]', true) : [];
@endphp

<div class="page-single">
    <div class="container">
        <div class="row">

            @if (!empty($widgets))
                <div class="col-lg-4">
                    <div class="page-single-sidebar">
                        @foreach ($widgets as $widget)
                            @include(Theme::getThemeNamespace() . '::partials.sidebar-widgets.' . $widget['type'], ['widget' => $widget])
                        @endforeach
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="single-content">
                        {!! Theme::content() !!}
                    </div>
                </div>
            @else
                <div class="col-lg-12">
                    <div class="single-content">
                        {!! Theme::content() !!}
                    </div>
                </div>
            @endif

        </div>
    </div>
</div>

{!! Theme::partial('footer') !!}