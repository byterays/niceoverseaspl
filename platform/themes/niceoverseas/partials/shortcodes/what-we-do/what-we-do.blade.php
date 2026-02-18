@php
    $features = [];
    $listItems = [];

    foreach ($shortcode->toArray() as $key => $value) {

        if (str_starts_with($key, 'feature_title_')) {
            $index = str_replace('feature_title_', '', $key);

            $features[$index]['title'] = $value;
            $features[$index]['icon'] =
                $shortcode->{'feature_icon_' . $index} ?? '';
        }

        if (str_starts_with($key, 'list_item_')) {
            $listItems[] = $value;
        }
    }

    ksort($features);

    $smallTitle  = $shortcode->small_title ?? '';
    $mainTitle   = $shortcode->main_title ?? '';
    $description = $shortcode->description ?? '';
    $image       = $shortcode->image ?? null;
    $circleImage = $shortcode->circle_image ?? null;
    $contactUrl  = $shortcode->contact_url ?? '#';
@endphp

<div class="what-we-do dark-section">
    <div class="container-fluid">
        <div class="row no-gutters">

            {{-- LEFT IMAGE --}}
            <div class="col-lg-6">
                <div class="what-we-do-image">
                    @if ($image)
                        <figure class="image-anime">
                            <img src="{{ RvMedia::getImageUrl($image) }}"
                                 alt="{{ $smallTitle }}">
                        </figure>
                    @endif
                </div>
            </div>

            {{-- RIGHT CONTENT --}}
            <div class="col-lg-6">
                <div class="what-we-do-content">

                    {{-- SECTION TITLE --}}
                    <div class="section-title">
                        @if ($smallTitle)
                            <h3 class="wow fadeInUp">
                                {{ $smallTitle }}
                            </h3>
                        @endif

                        @if ($mainTitle)
                            <h2 class="text-anime-style-2"
                                data-cursor="-opaque">
                                {!! BaseHelper::clean($mainTitle) !!}
                            </h2>
                        @endif

                        @if ($description)
                            <p class="wow fadeInUp"
                               data-wow-delay="0.2s">
                                {{ $description }}
                            </p>
                        @endif
                    </div>

                    {{-- FEATURES --}}
                    @if (!empty($features))
                        <div class="what-do-body-list wow fadeInUp"
                             data-wow-delay="0.4s">

                            @foreach ($features as $feature)
                                <div class="what-do-body-item">

                                    @if (!empty($feature['icon']))
                                        <div class="icon-box">
                                            <img src="{{ RvMedia::getImageUrl($feature['icon']) }}"
                                                 alt="{{ $feature['title'] }}">
                                        </div>
                                    @endif

                                    <div class="what-do-body-content">
                                        <h3>{{ $feature['title'] }}</h3>
                                    </div>

                                </div>
                            @endforeach

                        </div>
                    @endif

                    {{-- FOOTER --}}
                    <div class="what-we-do-footer">

                        @if (!empty($listItems))
                            <div class="what-we-do-list wow fadeInUp"
                                 data-wow-delay="0.6s">
                                <ul>
                                    @foreach ($listItems as $item)
                                        <li>{{ $item }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        @if ($circleImage)
                            <div class="what-we-do-circle">
                                <a href="{{ $contactUrl }}">
                                    <img src="{{ RvMedia::getImageUrl($circleImage) }}"
                                         alt="Contact">
                                </a>
                            </div>
                        @endif

                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
