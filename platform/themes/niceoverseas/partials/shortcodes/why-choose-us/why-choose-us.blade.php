<div class="why-choose-us">
    <div class="container">
        <div class="row align-items-center">

            <div class="col-lg-6">
                <div class="why-choose-content">
                    <div class="section-title">
                        <h3 class="wow fadeInUp">{{ $shortcode->subtitle }}</h3>
                        <h2 class="text-anime-style-2">
                            {!! $shortcode->title !!}
                            <span>{{ $shortcode->highlight_text }}</span>
                        </h2>
                        <p>{!! $shortcode->description !!}</p>
                    </div>

                    @if(!empty($features))
                        <div class="why-choose-list wow fadeInUp">
                            <ul>
                                @foreach($features as $feature)
                                    <li>{{ $feature['text'] }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                </div>
            </div>

            <div class="col-lg-6">
                <div class="why-choose-image">
                    <figure class="image-anime reveal">
                        <img src="{{ RvMedia::getImageUrl($shortcode->image) }}" alt="">
                    </figure>

                    @if($shortcode->video_url)
                        <div class="video-play-button">
                            <a href="{{ $shortcode->video_url }}" class="popup-video">
                                <i class="fa-solid fa-play"></i>
                            </a>
                        </div>
                    @endif
                </div>
            </div>

            @if(!empty($items))
                <div class="col-lg-12">
                    <div class="why-choose-item-list">
                        @foreach($items as $index => $item)
                            <div class="why-choose-item wow fadeInUp" data-wow-delay="{{ $index * 0.2 }}s">
                                <div class="icon-box">
                                    <img src="{{ RvMedia::getImageUrl($item['icon']) }}" alt="">
                                </div>
                                <div class="why-choose-item-content">
                                    <h3>{{ $item['title'] }}</h3>
                                    <p>{{ $item['description'] }}</p>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endif

        </div>
    </div>
</div>
