<section class="team-one team-one--home pb-0 mb-4">
    <div class="container">
        <div class="sec-title text-center">

            <h6 class="sec-title__tagline">{{$shortcode->title}}</h6><!-- /.sec-title__tagline -->

            <h3 class="sec-title__title">{!!$shortcode->subtitle!!}</h3><!-- /.sec-title__title -->
        </div><!-- /.sec-title -->
        <div class="row">

            @foreach($team as $member)
            <div class="col-md-6 col-lg-4 mt-50">
                <div class="team-card wow fadeInUp" data-wow-duration='1500ms' data-wow-delay='000ms'>
                    <div class="team-card__image">
                        <div class="team-card__image__bg"></div><!-- /.team-card__image__bg -->
                        <img src="{{RvMedia::getImageUrl($member->photo)}}" alt="{{$member->name}}">
                        <div class="team-card__hover">
                            <div class="team-card__social">
                                <i class="fa fa-share-alt"></i>
                                <div class="team-card__social__list">
                                    @foreach($member->socials as $key=>$social_media)
                                        @if($social_media)
                                        <a href="{{$social_media}}">
                                            <i class="fab fa-{{$key}}" aria-hidden="true"></i>
                                            <span class="sr-only">{{$key}}</span>
                                        </a>
                                        @endif
                                    @endforeach                                    
                                </div><!-- /.team-card__social__list -->
                            </div><!-- /.team-card__social -->
                        </div><!-- /.team-card__hover -->
                    </div><!-- /.team-card__image -->
                    <div class="team-card__content">
                        <h3 class="team-card__title">
                            <a href="#">{{$member->name}}</a>
                        </h3><!-- /.team-card__title -->

                        <p class="team-card__designation">{{$member->title}}</p><!-- /.team-card__designation -->
                    </div><!-- /.team-card__content -->
                </div><!-- /.team-card -->
            </div><!-- /.item -->
            @endforeach


        </div><!-- /.row -->
    </div><!-- /.container -->
</section><!-- /.team-one -->