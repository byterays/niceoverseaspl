@php
     $features = array_filter(array_map('trim', explode("\n", string: $shortcode->features ?? '')));
@endphp

<div class="hero hero-bg-image dark-section parallaxie"
 @if(trim($shortcode->background_image) != "")
         style="background-image: url('{{ RvMedia::getImageUrl($shortcode->background_image) }}')"
     @endif
>
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">

                <!-- Hero Content Start -->
                <div class="hero-content">

                    <!-- Section Title Start -->
                    <div class="section-title">
                        @if(trim($shortcode->small_heading) != "")
                            <h3 class="wow fadeInUp">
                                {{ $shortcode->small_heading }}
                            </h3>
                        @endif

                        @if(trim($shortcode->main_heading) != "")
                            <h1 class="text-anime-style-2" data-cursor="-opaque">
                               {!!  $shortcode->main_heading  !!}
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

                     @if(trim($shortcode->button_label) != "")
                        <div class="hero-btn wow fadeInUp" data-wow-delay="0.4s">
                            <a href="{{ url($shortcode->button_link ?: '#') }}"
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
