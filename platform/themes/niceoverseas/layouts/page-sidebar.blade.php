{!! Theme::partial('header') !!}

@php
    $page = Theme::get('page');

    $enableSidebar = $page
        ? $page->getMetaData('enable_sidebar', true) !== 'no'
        : false;

    $sidebarId = $page
        ? ($page->getMetaData('sidebar_id', true) ?: 'page_sidebar')
        : 'page_sidebar';

    $sidebarContent = $enableSidebar ? dynamic_sidebar($sidebarId) : null;
@endphp

<div class="page-single">
    <div class="container">
        <div class="row">

            @if ($enableSidebar && !empty(trim($sidebarContent)))
                <div class="col-lg-4">
                    <div class="page-single-sidebar">
                        {!! $sidebarContent !!}
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
