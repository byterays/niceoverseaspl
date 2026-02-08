@php
    $smallHeading = trim($shortcode->small_heading ?? '');
    $mainHeading  = $shortcode->main_heading ?? '';
    $featuresRaw  = $shortcode->features ?? '';
    $videoUrl     = $shortcode->video_url ?? '';
       
    $features = array_filter(
        array_map('trim', preg_split('/\r\n|\r|\n/', $featuresRaw))
    );
@endphp

<div class="hero hero-bg-image hero-video dark-section">

    <!-- Video Start -->
    @if(trim($videoUrl) !== '')
        <div class="hero-bg-video">
             {!! $videoUrl !!}
            <video autoplay muted loop playsinline id="myvideo">
                <source src="{{ $videoUrl }}" type="video/mp4">
            </video>
        </div>
    @endif
    <!-- Video End -->

    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">

                <!-- Hero Content Start -->
                <div class="hero-content">

                    <!-- Section Title Start -->
                    <div class="section-title">
                        @if($smallHeading !== '')
                            <h3 class="wow fadeInUp">
                                {{ $smallHeading }}
                            </h3>
                        @endif

                        @if(trim($mainHeading) !== '')
                            <h1 class="text-anime-style-2" data-cursor="-opaque">
                                {!! $mainHeading !!}
                            </h1>
                        @endif
                    </div>
                    <!-- Section Title End -->

                    <!-- Hero Body Start -->
                    @if(count($features))
                        <div class="hero-body wow fadeInUp" data-wow-delay="0.2s">
                            <ul>
                                @foreach($features as $item)
                                    <li>{{ $item }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    <!-- Hero Body End -->

                    <!-- Hero Button Start -->
                    @if(trim($shortcode->button_label ?? '') !== '')
                        <div class="hero-btn wow fadeInUp" data-wow-delay="0.4s">
                            <a href="{{ url($shortcode->button_link ?? '#') }}"
                               class="btn-default btn-highlighted">
                                {{ $shortcode->button_label }}
                            </a>
                        </div>
                    @endif
                    <!-- Hero Button End -->

                </div>
                <!-- Hero Content End -->

            </div>
        </div>
    </div>
</div>
