@php
    $smallTitle   = $shortcode->small_title ?? '';
    $mainTitle    = $shortcode->main_title ?? '';
    $description  = $shortcode->description ?? '';
    $image        = $shortcode->image ?? null;
    $circleImage  = $shortcode->circle_image ?? null;
    $contactUrl   = $shortcode->contact_url ?? '#';

    $featureTitles = (array) ($shortcode->feature_title ?? []);
    $featureIcons  = (array) ($shortcode->feature_icon ?? []);
    $listItems     = (array) ($shortcode->list_item ?? []);
@endphp

<div class="what-we-do dark-section">
    <div class="container-fluid">
        <div class="row no-gutters">

            {{-- LEFT IMAGE --}}
            <div class="col-lg-6">
                <div class="what-we-do-image">
                    <figure class="image-anime">
                        @if ($image)
                            <img src="{{ RvMedia::getImageUrl($image) }}" alt="{{ $smallTitle }}">
                        @endif
                    </figure>
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
                            <h2 class="text-anime-style-2" data-cursor="-opaque">
                                {!! BaseHelper::clean($mainTitle) !!}
                            </h2>
                        @endif

                        @if ($description)
                            <p class="wow fadeInUp" data-wow-delay="0.2s">
                                {{ $description }}
                            </p>
                        @endif
                    </div>

                    {{-- FEATURES --}}
                    @if (!empty($featureTitles))
                        <div class="what-do-body-list wow fadeInUp" data-wow-delay="0.4s">
                            @foreach ($featureTitles as $index => $title)
                                <div class="what-do-body-item">
                                    @if (!empty($featureIcons[$index]))
                                        <div class="icon-box">
                                            <img src="{{ RvMedia::getImageUrl($featureIcons[$index]) }}"
                                                 alt="{{ $title }}">
                                        </div>
                                    @endif

                                    <div class="what-do-body-content">
                                        <h3>{{ $title }}</h3>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @endif

                    {{-- FOOTER --}}
                    <div class="what-we-do-footer">

                        {{-- LIST ITEMS --}}
                        @if (!empty($listItems))
                            <div class="what-we-do-list wow fadeInUp" data-wow-delay="0.6s">
                                <ul>
                                    @foreach ($listItems as $item)
                                        <li>{{ $item }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        {{-- CIRCLE IMAGE --}}
                        @if ($circleImage)
                            <div class="what-we-do-circle">
                                <a href="{{ $contactUrl }}">
                                    <img src="{{ RvMedia::getImageUrl($circleImage) }}" alt="Contact">
                                </a>
                            </div>
                        @endif

                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
