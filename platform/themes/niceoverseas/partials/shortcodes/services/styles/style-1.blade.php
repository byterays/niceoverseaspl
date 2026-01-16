@if ($services->isNotEmpty())
<section class="service-two" style="background-image: url( '{{RvMedia::getImageUrl($shortcode->background_image)}}' );">
    <div class="container">
        <div class="sec-title text-center">
            @if ($title = $shortcode->title)
            <h6 class="sec-title__tagline">{!! BaseHelper::clean($title) !!}</h6><!-- /.sec-title__tagline -->
            @endif
            @if ($subtitle = $shortcode->subtitle)
            <h3 class="sec-title__title">{!! BaseHelper::clean($subtitle) !!}</h3><!-- /.sec-title__title -->
            @endif
        </div><!-- /.sec-title -->
        <div class="row gutter-y-30">
        @foreach($services as $service)
            <div class="col-md-6 col-lg-3">
                <div class="service-two-card" data-wow-duration="1500ms" data-wow-delay="0ms">
                    <div class="service-two-card__image">
                        <img src="{{ RvMedia::getImageUrl($service->image) }}" alt="HR Consulting">
                    </div><!-- /.service-two-card__image -->
                    <div class="service-two-card__content">
                        <div class="service-two-card__icon">
                            <i class="icon-consulting"></i>
                        </div><!-- /.service-two-card__icon -->
                        @if ($title = $service->name)
                        <h3 class="service-two-card__title">
                            <a href="{{ $service->url }}">{!! BaseHelper::clean($title) !!}</a>
                        </h3><!-- /.service-two-card__title -->
                        @endif
                        @if ($description = $service->description)
                        <p class="service-two-card__text">{!! BaseHelper::clean($description) !!}</p>
                        @endif
                        <!-- /.service-two-card__text -->
                    </div><!-- /.service-two-card__content -->
                    <a href="{{ $service->url }}" class="service-two-card__link">
                        Read More
                        <i class="icon-right-arrow"></i>
                    </a><!-- /.service-card__link -->
                </div><!-- /.service-two-card -->
            </div><!-- /.col-md-6 col-lg-3 -->
            @endforeach
        </div><!-- /.row -->
    </div><!-- /.container -->
</section><!-- /.service-two -->
@endif
