<section class="feature-one">
    <div class="container">
        <div class="row gutter-y-30">
            @foreach($tabs as $tab)

            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="100ms">
                <div class="feature-one__item text-center">
                    <div class="feature-one__item__img">
                        <img src="{{ RvMedia::getImageUrl($tab['image']) }}" alt="{!!BaseHelper::clean($tab['title']) !!}">
                    </div>
                    <div class="feature-one__item__content">
                        <div class="feature-one__item__ball"></div>
                        <div class="feature-one__item__icon"><span class="{!!BaseHelper::clean($tab['icon']) !!}"></span></div>
                        <h3 class="feature-one__item__title">{!!BaseHelper::clean($tab['title']) !!}</h3>
                        @if ($tab['description'])
                        <p class="feature-two__item__text">{!!BaseHelper::clean($tab['description']) !!}</p>
                        @endif
                        @if ($tab['link_url'])
                        <a href="{{ $tab['link_url'] }}" class="hiredots-btn"><span>{{ $tab['link_text'] }}</span></a>
                        @endif
                    </div>
                </div><!-- feature-item -->
            </div>
            
            @endforeach
        </div>
    </div>
</section>