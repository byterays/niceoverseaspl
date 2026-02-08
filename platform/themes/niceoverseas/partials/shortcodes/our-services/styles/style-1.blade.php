<div class="our-services">
    <div class="container">

        {{-- SECTION HEADER --}}
        <div class="row section-row align-items-center">
            <div class="col-lg-6">
                <div class="section-title">
                    @if (trim(string: $shortcode->small_title ?? '') != '')
                        <h3 class="wow fadeInUp">{{ $shortcode->small_title }}</h3>
                    @endif

                    @if (trim($shortcode->heading ?? '') != '')
                        <h2 class="text-anime-style-2" data-cursor="-opaque" data-wow-delay="0.2s">
                            {!! $shortcode->heading !!}
                        </h2>
                    @endif
                </div>
            </div>

            <div class="col-lg-6">
                @if (trim($shortcode->button_text ?? '') !='' && trim($shortcode->button_url ?? '') !== '')
                    <div class="section-btn wow fadeInUp" data-wow-delay="0.2s">
                        <a href="{{ $shortcode->button_url }}" class="btn-default">
                            {{ $shortcode->button_text }}
                        </a>
                    </div>
                @endif
            </div>
        </div>

        {{-- SERVICES --}}
        <div class="row service-list">
              

            @foreach ($services as $index => $service)
                @php($service = (object) $service)

                <div class="col-lg-3 col-md-6">
                    <div class="service-item-box wow fadeInUp"
                         data-wow-delay="{{ $index * 0.2 }}s">

                        <div class="service-item {{ $index === 0 ? 'active' : '' }}">
                            @if (trim($service->icon ?? '') !== '')
                                <div class="icon-box">
                                    <img src="{{ RvMedia::getImageUrl($service->icon)}}" alt="">
                                </div>
                            @endif

                            <div class="service-item-content">
                                <h3>
                                    <a href="{{ $service->link ?? '#' }}">
                                        {{ $service->title }}
                                    </a>
                                </h3>

                                @if (trim($service->description ?? '') !== '')
                                    <p>{{ $service->description }}</p>
                                @endif
                            </div>

                            <div class="service-readmore-btn">
                                <a href="{{ $service->link ?? '#' }}" class="readmore-btn">
                                    {{ __('read more') }}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach

            {{-- FOOTER --}}
            @if (trim($shortcode->footer_text ?? '') !== '')
                <div class="col-lg-12">
                    <div class="section-footer-text wow fadeInUp" data-wow-delay="0.8s">
                        <p>
                            <span>{{ $shortcode->footer_highlight }}</span>
                            {{ $shortcode->footer_text }}
                            @if (trim($shortcode->footer_link ?? '') !== '')
                                <a href="{{ $shortcode->footer_link }}">{{ __('Get in touch today!') }}</a>
                            @endif
                        </p>
                    </div>
                </div>
            @endif
        </div>
    </div>
</div>
