@php
    $items = [];
    $listItems = [];

    foreach ($shortcode->toArray() as $key => $value) {

        if (str_starts_with($key, 'item_title_')) {
            $index = str_replace('item_title_', '', $key);

            $items[$index]['title'] = $value;
            $items[$index]['icon'] =
                $shortcode->{'item_icon' . $index} ?? '';
            $items[$index]['description'] =
                $shortcode->{'item_description_' . $index} ?? '';
        }

        if (str_starts_with($key, 'list_item_')) {
            $listItems[] = $value;
        }
    }

    ksort($items);

    $smallTitle  = $shortcode->small_title ?? '';
    $mainTitle   = $shortcode->main_title ?? '';
    $description = $shortcode->description ?? '';
    $image       = $shortcode->image ?? null;
    $videoUrl    = $shortcode->video_url ?? '';

@endphp

<div class="why-choose-us">
    <div class="container">
        <div class="row align-items-center">

            <div class="col-lg-6">
                <div class="why-choose-content">
                    <div class="section-title">

                        @if($smallTitle)
                            <h3 class="wow fadeInUp">{{ $smallTitle }}</h3>
                        @endif

                        @if($mainTitle)
                            <h2 class="text-anime-style-2"
                                data-cursor="-opaque"
                                data-wow-delay="0.2s">
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

                    @if(!empty($listItems))
                        <div class="why-choose-list wow fadeInUp"
                             data-wow-delay="0.4s">
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
                <div class="why-choose-image">
                    @if($image)
                        <figure class="image-anime reveal">
                            <img src="{{ RvMedia::getImageUrl($image) }}" alt="">
                        </figure>
                    @endif

                    @if($videoUrl)
                        <div class="video-play-button">
                            <a href="{{ $videoUrl }}"
                               class="popup-video"
                               data-cursor-text="Play">
                                <i class="fa-solid fa-play"></i>
                            </a>
                        </div>
                    @endif
                </div>
            </div>

            <div class="col-lg-12">
                <div class="why-choose-item-list">
                    @foreach($items as $index => $item)
                       
                        <div class="why-choose-item wow fadeInUp"
                             data-wow-delay="{{ $index * 0.2 }}s">

                            @if(!empty($item['icon']))
                                <div class="icon-box">
                                    <img src="{{ RvMedia::getImageUrl($item['icon']) }}"
                                         alt="{{ $item['title'] }}">
                                </div>
                            @endif

                            <div class="why-choose-item-content">
                                <h3>{{ $item['title'] }}</h3>
                                <p>{{ $item['description'] }}</p>
                            </div>

                        </div>
                    @endforeach
                </div>
            </div>

        </div>
    </div>
</div>
