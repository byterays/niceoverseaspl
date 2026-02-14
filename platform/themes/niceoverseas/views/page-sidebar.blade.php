@extends(Theme::getLayout('sidebar-layout'))

@php
    Theme::set('pageTitle', $page->name);
    Theme::set('pageDescription', $page->description);
    Theme::set('pageCoverImage', $page->getMetaData('background_breadcrumb', true));
    Theme::set('pageImage', $page->image);
@endphp

@php

echo "reched here";
exit;
@endphp
{{-- Optional featured image --}}
@if ($page->image)
    <div class="page-single-image mb-4">
        <img src="{{ RvMedia::getImageUrl($page->image) }}" alt="{{ $page->name }}" class="img-fluid">
    </div>
@endif

