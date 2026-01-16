<section class="faq-one">
    <div class="container">
        <div class="row">
            <div class="col-xl-6">
                <div class="faq-one__content">
                    <div class="sec-title text-left">

                        <h6 class="sec-title__tagline">{{$shortcode->title}}</h6><!-- /.sec-title__tagline -->

                        <h3 class="sec-title__title">{{$shortcode->subtitle}}</h3><!-- /.sec-title__title -->
                    </div><!-- /.sec-title -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="faq-one__experiance">
                                <img src="assets/images/resources/faq-2-img.jpg" alt="faq">
                                <div class="faq-one__experiance__content">
                                    <div class="faq-one__experiance__icon"><span class="icon-quality"></span></div><!-- /.funfact-one__icon -->
                                    <div class="faq-one__experiance__count count-box"><span class="count-text" data-stop="{{$shortcode->years}}" data-speed="1500"></span>+</div><!-- /.funfact-one__count -->
                                    <p class="faq-one__experiance__text">{!!$shortcode->tag_line!!}</p><!-- /.funfact-one__text -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h4 class="faq-one__content__title">{{$shortcode->hero_title}}</h4>
                            <p class="faq-one__content__text">{!!$shortcode->hero_content!!}</p>
                        </div>
                    </div>
                </div>
            </div><!-- /.col-lg-4 col-xl-3 -->
            <div class="col-xl-6">
                <div class="faq-page__accordion hiredots-accrodion" data-grp-name="hiredots-accrodion">

                    @foreach($faqs as  $faq)
                    <div class="accrodion">
                        <div class="accrodion-title">
                            <h4>
                           {{$faq->question}}
                                <span class="accrodion-title__icon"></span><!-- /.accrodion-title__icon -->
                            </h4>
                        </div><!-- /.accordian-title -->
                        <div class="accrodion-content">
                            <div class="inner">
                                <p>
                                    {!! $faq->answer !!}                                
                                </p>
                            </div><!-- /.accordian-content -->
                        </div>
                    </div><!-- /.accordian-item -->
                    @endforeach
                  
                </div>
            </div><!-- /.col-lg-6 col-xl-6 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</section><!-- /.faq-page-accordion -->