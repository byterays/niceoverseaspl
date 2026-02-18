@php
    $bodyItems = [];
    $listItems = [];

    foreach ($shortcode->toArray() as $key => $value) {

        if (str_starts_with($key, 'body_title_')) {
            $index = str_replace('body_title_', '', $key);

            $bodyItems[$index]['title'] = $value;
            $bodyItems[$index]['description'] =
                $shortcode->{'body_description_' . $index} ?? '';
        }

        if (str_starts_with($key, 'list_item_')) {
            $listItems[] = $value;
        }
    }

    ksort($bodyItems);

    $smallTitle = $shortcode->small_title ?? '';
    $mainTitle  = $shortcode->main_title ?? '';
    $description = $shortcode->description ?? '';

    $image1 = $shortcode->image_1 ?? null;
    $circleImage = $shortcode->circle_image ?? null;
    $circleUrl = $shortcode->circle_url ?? '#';
    $image2 = $shortcode->image_2 ?? null;

    $counterIcon = $shortcode->counter_icon ?? null;
    $counterNumber = $shortcode->counter_number ?? '';
    $counterText = $shortcode->counter_text ?? '';
@endphp

<div class="our-benefits">
    <div class="container">
        <div class="row align-items-center">

            <div class="col-lg-6">
                <div class="benefits-content">

                    <div class="section-title">
                        @if($smallTitle)
                            <h3 class="wow fadeInUp">{{ $smallTitle }}</h3>
                        @endif

                        @if($mainTitle)
                            <h2 class="text-anime-style-2"
                                data-cursor="-opaque">
                                {!! BaseHelper::clean($mainTitle) !!}
                            </h2>
                        @endif

                        @if($description)
                            <p class="wow fadeInUp"
                               data-wow-delay="0.2s">
                                {{ $description }}
                            </p>
                        @endif
                    </div>

                    @if(!empty($bodyItems))
                        <div class="benefits-body wow fadeInUp"
                             data-wow-delay="0.4s">

                            @foreach($bodyItems as $item)
                                <div class="benefits-body-item">
                                    <h3>{{ $item['title'] }}</h3>
                                    <p>{{ $item['description'] }}</p>
                                </div>
                            @endforeach

                        </div>
                    @endif

                    @if(!empty($listItems))
                        <div class="benefits-body-item benefits-body-list wow fadeInUp"
                             data-wow-delay="0.6s">
                            <ul>
                                @foreach($listItems as $item)
                                    <li>{{ $item }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                </div>
            </div>

            <div class="col-lg-6">
                <div class="benefits-images">

                    <div class="benefit-image-1">
                        <div class="benefit-image">
                            @if($image1)
                                <figure class="image-anime reveal">
                                    <img src="{{ RvMedia::getImageUrl($image1) }}" alt="">
                                </figure>
                            @endif
                        </div>

                        @if($circleImage)
                            <div class="benefit-image-circle">
                                <a href="{{ $circleUrl }}">
                                    <img src="{{ RvMedia::getImageUrl($circleImage) }}" alt="">
                                </a>
                            </div>
                        @endif
                    </div>

                    <div class="benefit-image-2">
                        <div class="benefit-image">
                            @if($image2)
                                <figure class="image-anime">
                                    <img src="{{ RvMedia::getImageUrl($image2) }}" alt="">
                                </figure>
                            @endif
                        </div>

                        @if($counterNumber)
                            <div class="benefit-project-info">
                                @if($counterIcon)
                                    <div class="icon-box">
                                        <img src="{{ RvMedia::getImageUrl($counterIcon) }}" alt="">
                                    </div>
                                @endif
                                <div class="benefit-project-content">
                                    <h3><span class="counter">{{ $counterNumber }}</span>+</h3>
                                    <p>{{ $counterText }}</p>
                                </div>
                            </div>
                        @endif

                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
