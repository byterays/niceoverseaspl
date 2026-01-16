<section class="contact-one pt-50 pb-50">
    <div class="container">
        <div class="contact-one__inner">
            <div class="row">
                <div class="col-lg-6">
                    <div class="contact-one__content">
                        <div class="sec-title text-@@textAlign">

                            <h6 class="sec-title__tagline">{!! BaseHelper::clean($shortcode->title) !!}</h6><!-- /.sec-title__tagline -->

                            <h3 class="sec-title__title">{!! BaseHelper::clean($shortcode->subtitle) !!}</h3><!-- /.sec-title__title -->
                        </div><!-- /.sec-title -->
                        <p class="contact-one__text">{!! BaseHelper::clean($shortcode->description) !!}</p><!-- /.contact-one__text -->
                        <ul class="list-unstyled contact-one__info">
                            <li class="contact-one__info__item">
                                <div class="contact-one__info__icon">
                                    <i class="icon-phone-call-1"></i>
                                </div><!-- /.contact-one__info__icon -->
                                <div class="contact-one__info__content">
                                    <p class="contact-one__info__text">Have Question?</p>
                                    <!-- /.contact-one__info__text -->
                                    <h4 class="contact-one__info__title">Free <a href="tel:+92(8800)-8960">{{setting('contact_phone')}}</a></h4><!-- /.contact-one__info__title -->
                                </div><!-- /.contact-one__info__content -->
                            </li>
                            <li class="contact-one__info__item">
                                <div class="contact-one__info__icon">
                                    <i class="icon-message"></i>
                                </div><!-- /.contact-one__info__icon -->
                                <div class="contact-one__info__content">
                                    <p class="contact-one__info__text">Write Email </p>
                                    <!-- /.contact-one__info__text -->
                                    <h4 class="contact-one__info__title"><a href="mailto:needhelp@company.com">{{setting('email_address')}}</a></h4>
                                    <!-- /.contact-one__info__title -->
                                </div><!-- /.contact-one__info__content -->
                            </li>
                            <li class="contact-one__info__item">
                                <div class="contact-one__info__icon">
                                    <i class="icon-placeholder"></i>
                                </div><!-- /.contact-one__info__icon -->
                                <div class="contact-one__info__content">
                                    <p class="contact-one__info__text">Visit Anytime</p> <!-- /.contact-one__info__text -->
                                    <h4 class="contact-one__info__title">{!!setting('office_address')!!}</h4><!-- /.contact-one__info__title -->
                                </div><!-- /.contact-one__info__content -->
                            </li>
                        </ul><!-- /.list-unstyled -->
                    </div><!-- /.contact-one__content -->
                </div><!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="contact-one__left">

                        @if(session('success_msg'))
                        <div class="alert alert-success mt-3">
                            {{ session('success_msg') }}
                        </div>
                        @endif
                        <form class="contact-one__form contact-form-validated form-one background-base wow fadeInUp" data-wow-duration="1500ms" action="{{ route('public.send.contact') }}" method="post">
                            @csrf
                            <div class="form-one__group">
                                <div class="form-one__control form-one__control--full">
                                    <input @class(['is-invalid'=> $errors->has('name')]) name="name" placeholder="{{ __('Enter your name') }}" type="text" value="{{ old('name') }}">
                                    @error('name')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div><!-- /.form-one__control form-one__control--full -->
                                <div class="form-one__control form-one__control--full">

                                    <input @class(['is-invalid'=> $errors->has('email')]) name="email" placeholder="{{ __('Your email') }}" type="email" value="{{ old('email') }}">
                                    @error('email')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div><!-- /.form-one__control form-one__control--full -->

                                <div class="form-one__control form-one__control--full">

                                    <input type="text" @class([ 'is-invalid'=> $errors->has('phone')]) name="phone" placeholder="{{ __('Phone Number') }}" value="{{ old('phone') }}">
                                    @error('phone')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div><!-- /.form-one__control form-one__control--full -->

                                <div class="form-one__control form-one__control--full">

                                    <textarea @class(['font-sm color-text-paragraph-2', 'is-invalid'=> $errors->has('phone')]) name="content" placeholder="{{ __('Write your message here') }}">{{ old('content') }}</textarea>
                                    @error('content')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                    @enderror
                                </div><!-- /.form-one__control form-one__control--full -->

                                @if (is_plugin_active('captcha'))
                                @if (setting('enable_captcha'))
                                {!! Captcha::display() !!}
                                @endif

                                @if (setting('enable_math_captcha_for_contact_form', 0))
                                <div class="input-style mb-20">
                                    {!! app('math-captcha')->input(['class' => 'font-sm color-text-paragraph-2', 'id' => 'math-group', 'placeholder' => app('math-captcha')->label()]) !!}
                                </div>
                                @endif
                                @endif

                                <div class="form-one__control form-one__control--full">
                                    <button type="submit" class="hiredots-btn hiredots-btn--white"><span>send a message</span></button>
                                </div><!-- /.form-one__control -->
                            </div><!-- /.form-one__group -->

                            <div class="col-12">
                                <div class="contact-mb-3 mt-4">
                                    <div class="contact-message contact-success-message" style="display: none"></div>
                                    <div class="contact-message contact-error-message" style="display: none"></div>
                                </div>
                            </div>
                        </form>
                    </div>

                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->
        </div><!-- /.contact-one__inner -->
    </div><!-- /.container -->
</section><!-- /.contact-one -->

<section class="contact-map">
    <div class="container">
        <div class="google-map google-map__contact">
            <iframe title="template google map" src="{{setting('google_map_location')}}" class="map__contact" allowfullscreen></iframe>
        </div>
        <!-- /.google-map -->
    </div><!-- /.container-fluid -->
</section><!-- /.contact-map -->