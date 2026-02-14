@php
    $page = Theme::get('page');
@endphp

@if ($apply_to == 'all')
    <div class="global-widget">
        {!! $content !!}
    </div>
@elseif ($apply_to == 'specific' && $page && in_array($page->id, $pages ?? []))
    <div class="global-widget">
        {!! $content !!}
    </div>
@endif
