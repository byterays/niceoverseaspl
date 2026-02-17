@php
    $image = RvMedia::getImageUrl($shortcode->image);
    $icon1 = RvMedia::getImageUrl($shortcode->icon1);
    $icon2 = RvMedia::getImageUrl($shortcode->icon2);
    $circleImage = RvMedia::getImageUrl($shortcode->circle_image);
@endphp

<div class="what-we-do dark-section">
    <div class="container-fluid">
        <div class="row no-gutters">

            <div class="col-lg-6">
                <div class="what-we-do-image">
                    <figure class="image-anime">
                        <img src="{{ $image }}" alt="">
                    </figure>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="what-we-do-content">

                    <div class="section-title">
                        <h3 class="wow fadeInUp">
                            {{ $shortcode->small_title }}
                        </h3>

                        <h2 class="text-anime-style-2" data-cursor="-opaque">
                            {!! $shortcode->main_title !!}
                        </h2>

                        <p class="wow fadeInUp" data-wow-delay="0.2s">
                            {{ $shortcode->description }}
                        </p>
                    </div>

                    <div class="what-do-body-list wow fadeInUp" data-wow-delay="0.4s">

                        <div class="what-do-body-item">
                            <div class="icon-box">
                                <img src="{{ $icon1 }}" alt="">
                            </div>
                            <div class="what-do-body-content">
                                <h3>{{ $shortcode->feature_title1 }}</h3>
                            </div>
                        </div>

                        <div class="what-do-body-item">
                            <div class="icon-box">
                                <img src="{{ $icon2 }}" alt="">
                            </div>
                            <div class="what-do-body-content">
                                <h3>{{ $shortcode->feature_title2 }}</h3>
                            </div>
                        </div>

                    </div>

                    <div class="what-we-do-footer">

                        <div class="what-we-do-list wow fadeInUp" data-wow-delay="0.6s">
                            <ul>
                                <li>{{ $shortcode->list_item1 }}</li>
                                <li>{{ $shortcode->list_item2 }}</li>
                                <li>{{ $shortcode->list_item3 }}</li>
                            </ul>
                        </div>

                        <div class="what-we-do-circle">
                            <a href="{{ $shortcode->contact_url }}">
                                <img src="{{ $circleImage }}" alt="">
                            </a>
                        </div>

                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
