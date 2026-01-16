@php
$title = preg_replace('/\{\{(.*)\}\}/', '<span class="line-under"><span>${1}</span></span>', $shortcode->title ?: '');
@endphp


<section class="main-slider-three">
    <div class="main-slider-three__carousel hiredots-owl__carousel owl-carousel" data-owl-options='{
		"loop": true,
		"animateOut": "slideOutDown",
		"animateIn": "fadeIn",
		"items": 1,
		"autoplay": true,
		"autoplayTimeout": 6000,
		"smartSpeed": 1000,
		"nav": true,
        "navText": ["<span class=\"icon-left-arrow\"></span>","<span class=\"icon-right-arrow\"></span>"],
		"dots": false,
		"margin": 0
	    }'>

        @foreach($tabs as $tab)
            <div class="item">
                <div class="main-slider-three__item">
                    <div class="main-slider-three__bg" style="background-image: url({{ RvMedia::getImageUrl($tab['image']) }})"></div>                   
                    <div class="main-slider-three__shape"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="main-slider-three__content">
                                    @if ($tab['title'])
                                    <h2 class="main-slider-three__title">{!!BaseHelper::clean($tab['title']) !!}</h2><!-- slider-title -->
                                    @endif
                                    @if ($tab['subtitle'])
                                    <p class="main-slider-three__text">{!!BaseHelper::clean($tab['subtitle']) !!}</p><!-- slider-text -->
                                    @endif
                                    @if ($tab['button_label'] && $tab['button_link'])
                                    <div class="main-slider-three__btn">
                                        <a href="{{ $tab['button_link'] }}" class="hiredots-btn"><span>{!! BaseHelper::clean($tab['button_label']) !!}</span></a><!-- slider-btn -->
                                    </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</section>