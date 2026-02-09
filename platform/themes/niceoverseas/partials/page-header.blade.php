@php
    $title = Theme::get('pageTitle');
    $cover = Theme::get('pageCoverImage');
@endphp

@php
    $words = preg_split('/\s+/', trim($title));
    $totalWords = count($words);
    $half = (int) ceil($totalWords / 2);

    $firstPart = implode(' ', array_slice($words, 0, $half));
    $secondPart = implode(' ', array_slice($words, $half));
@endphp

<div class="page-header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">
                <div class="page-header-box">
                    <h1 class="text-anime-style-2" data-cursor="-opaque"> {{ $firstPart }} @if ($secondPart)
                    <span>{{ $secondPart }}</span> @endif </h1>
                    <nav class="wow fadeInUp">
                        {!! Theme::breadcrumb()->render() !!}
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>