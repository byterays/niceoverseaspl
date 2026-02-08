@php
    // Tabs data prepared in Shortcode::register(...)
    $slides = $tabs ?? [];
@endphp

@if(count($slides))
<div class="hero hero-bg-image hero-slider-layout dark-section">
    <div class="swiper">
        <div class="swiper-wrapper">

            @foreach($slides as $slide)
                @php
                    $smallHeading = trim($slide['small_heading'] ?? '');
                    $mainHeading  = trim($slide['main_heading'] ?? '');
                    $featuresRaw  = $slide['features'] ?? '';
                    $buttonLabel  = trim($slide['button_label'] ?? '');
                    $buttonLink   = trim($slide['button_link'] ?? '');
                    $slideImage   = $slide['slide_image'] ?? '';

                    $features = array_filter(
                        array_map(
                            'trim',
                            preg_split('/\r\n|\r|\n/', $featuresRaw)
                        )
                    );
                @endphp

                <!-- Hero Slide Start -->
                <div class="swiper-slide">
                    <div class="hero-slide">

                        <!-- Slider Image Start -->
                        @if($slideImage)
                            <div class="hero-slider-image">
                                <img src="{{ RvMedia::getImageUrl($slideImage) }}" alt="">
                            </div>
                        @endif
                        <!-- Slider Image End -->

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

                                            @if($mainHeading !== '')
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
                                        @if($buttonLabel !== '')
                                            <div class="hero-btn wow fadeInUp" data-wow-delay="0.4s">
                                                <a href="{{ url($buttonLink ?: '#') }}"
                                                   class="btn-default btn-highlighted">
                                                    {{ $buttonLabel }}
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
                </div>
                <!-- Hero Slide End -->

            @endforeach

        </div>

        <!-- Slider Pagination -->
        <div class="hero-pagination"></div>
    </div>
</div>
@endif
