@php
    Theme::set('pageTitle', $page->name);
    Theme::set('pageDescription', $page->description);
    Theme::set('pageCoverImage', $page->getMetaData('background_breadcrumb', true));
    Theme::set('pageImage', $page->image);
@endphp

{{-- Optional featured image --}}
@if ($page->image)
    <div class="page-single-image mb-4">
        <img
            src="{{ RvMedia::getImageUrl($page->image) }}"
            alt="{{ $page->name }}"
            class="img-fluid"
        >
    </div>
@endif

{{-- Page title --}}
<h1>{{ $page->name }}</h1>

{{-- Page content (same as page.blade.php) --}}
{!! apply_filters(
    PAGE_FILTER_FRONT_PAGE_CONTENT,
    Html::tag(
        'div',
        BaseHelper::clean($page->content),
        ['class' => 'ck-content']
    )->toHtml(),
    $page
) !!}
