<section class="about-three">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="about-three__image wow fadeInLeft" data-wow-delay="300ms">
                    <img src="{{ RvMedia::getImageUrl($shortcode->display_image) }}">
                </div><!-- /.about-three__image -->
            </div><!-- /.col-lg-6 -->
            <div class="col-lg-6 wow fadeInRight" data-wow-delay="300ms">
                <div class="about-three__content">
                    <div class="sec-title text-left">

                        <h6 class="sec-title__tagline">{!!BaseHelper::clean($shortcode->title) !!}</h6><!-- /.sec-title__tagline -->

                        <h3 class="sec-title__title">{!!BaseHelper::clean($shortcode->subtitle) !!}</h3><!-- /.sec-title__title -->
                    </div><!-- /.sec-title -->
                    <p class="about-three__content__text">
                        {!!BaseHelper::clean($shortcode->description) !!}
                    </p>

                    <ul class="about-three__list">
                        <li><span class="fa fa-check-circle"></span>Empowering Talent, Driving Business Success</li>
                        <li><span class="fa fa-check-circle"></span>Strategic HR Solutions for Global Excellence</li>
                        <li><span class="fa fa-check-circle"></span>Connecting Talent to Opportunity, Building Stronger Organizations</li>
                    </ul>
                    
                    <div class="row">
                        <div class="col-md-7">
                            <a class="about-three__call" href="tel: {!!BaseHelper::clean($shortcode->cta_phone) !!}">
                                <span class="about-three__call__icon"><i class="icon-calling"></i></span>
                                <span class="about-three__call__text">{!!BaseHelper::clean($shortcode->cta_text) !!}</span>
                                <span class="about-three__call__number">{!!BaseHelper::clean($shortcode->cta_phone) !!}</span>
                            </a>
                            <a href="{!!BaseHelper::clean($shortcode->cta_link_url) !!}" class="hiredots-btn hiredots-btn--base"><span>{!!BaseHelper::clean($shortcode->cta_link_text) !!}</span></a>
                        </div>
                        <div class="col-md-5">
                            <div class="about-three__info-box">
                                <div class="about-three__info-box__icon"><span class="icon-cooperation"></span></div>
                                <h3 class="about-three__info-box__title">Trusted by Clients</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->

    </div><!-- /.container -->
</section><!-- /.about-three -->