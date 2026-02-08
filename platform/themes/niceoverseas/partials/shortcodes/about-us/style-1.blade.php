
<div class="about-us">
    <div class="container">
        <div class="row align-items-center">

            {{-- LEFT: IMAGES --}}
            <div class="col-lg-6">
                <div class="about-us-images">
                    <div class="about-image-box-1">
                        @if (trim($shortcode->circle_image) != '')
                            <div class="successful-circle-img">
                                <img src="{{ RvMedia::getImageUrl($shortcode->circle_image) }}" alt="">
                            </div>
                        @endif

                        @if ( trim($shortcode->image_1) !== '')
                            <div class="about-image">
                                <figure class="image-anime reveal">
                                    <img src="{{ RvMedia::getImageUrl($shortcode->image_1) }}" alt="">
                                </figure>
                            </div>
                        @endif
                    </div>

                    @if (trim($shortcode->image_2) !== '')
                        <div class="about-image-box-2">
                            <div class="about-image">
                                <figure class="image-anime reveal">
                                    <img src="{{ RvMedia::getImageUrl($shortcode->image_2) }}" alt="">
                                </figure>
                            </div>
                        </div>
                    @endif

                    @if ( trim($shortcode->image_3) !== '')
                        <div class="about-image-box-3">
                            <div class="about-image">
                                <figure class="image-anime">
                                    <img src="{{ RvMedia::getImageUrl($shortcode->image_3)}}" alt="">
                                </figure>
                            </div>

                            @if (trim((string) $shortcode->experience) !== '')
                                <div class="years-experience-box">
                                    <h2>
                                        <span class="counter">{{ $shortcode->experience }}</span>
                                    </h2>
                                    <p>{{ __('Years of Experience') }}</p>
                                </div>
                            @endif
                        </div>
                    @endif
                </div>
            </div>

            {{-- RIGHT: CONTENT --}}
            <div class="col-lg-6">
                <div class="about-us-content">

                    {{-- Section Title --}}
                    <div class="section-title">
                        @if (trim($shortcode->title) !== '')
                            <h3 class="wow fadeInUp">{{ $shortcode->title }}</h3>
                        @endif

                        @if (trim($shortcode->heading) !== '')
                            <h2 class="text-anime-style-2" data-cursor="-opaque">
                                {!! $shortcode->heading !!}
                            </h2>
                        @endif

                        @if (trim($shortcode->description) !== '')
                            <p class="wow fadeInUp" data-wow-delay="0.2s">
                                {{ $shortcode->description }}
                            </p>
                        @endif
                    </div>

                    {{-- FEATURES (max 6, filtered already) --}}
                    @if (is_array($tabs) && count($tabs) > 0)
                        <div class="about-body-list">
                            @foreach ($tabs as $index => $item)
                                @php($item = (object) $item)

                                <div class="about-body-item wow fadeInUp"
                                     data-wow-delay="{{ 0.4 + ($index * 0.2) }}s">

                                    @if (isset($item->icon) && trim($item->icon) !== '')
                                        <div class="icon-box">
                                            <img src="{{ RvMedia::getImageUrl($item->icon) }}" alt="">
                                        </div>
                                    @endif

                                    <div class="about-body-item-content">
                                        @if (isset($item->title) && trim($item->title) !== '')
                                            <h3>{{ $item->title }}</h3>
                                        @endif

                                        @if (isset($item->description) && trim($item->description) !== '')
                                            <p>{{ $item->description }}</p>
                                        @endif
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @endif

                    {{-- BUTTON --}}
                    @if (
                        trim($shortcode->button_text) !== '' && trim($shortcode->button_url) !== ''
                    )
                        <div class="about-btn wow fadeInUp" data-wow-delay="0.8s">
                            <a href="{{ $shortcode->button_url }}" class="btn-default">
                                {{ $shortcode->button_text }}
                            </a>
                        </div>
                    @endif

                </div>
            </div>
        </div>
    </div>
</div>
