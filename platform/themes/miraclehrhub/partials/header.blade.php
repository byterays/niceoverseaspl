<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    {!! Theme::partial('theme-meta') !!}
    <!-- favicons Icons -->
    <link rel="apple-touch-icon" sizes="180x180" href="/images/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/images/favicons/favicon-16x16.png">
    
    <meta name="description" content="Nice Overseas: Your Premier Partner for Global Recruitment Solutions">

    <!-- fonts -->
    <link rel="preconnect" href="//fonts.googleapis.com/">
    <link rel="preconnect" href="//fonts.gstatic.com/" crossorigin>
    <link href="//fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet">
    
    {!! Theme::header() !!}

</head>

<body class="custom-cursor">

    <div class="custom-cursor__cursor"></div>
    <div class="custom-cursor__cursor-two"></div>

    <div class="preloader">
        <div class="preloader__image" style="background-image: url(assets/images/loader.png);"></div>
    </div>
    <!-- /.preloader -->
    <div class="page-wrapper">
    
        {!! apply_filters(THEME_FRONT_BODY, null) !!}
        <header class="main-header main-header--three sticky-header sticky-header--normal">
            <div class="main-header__inner">
                <div class="main-header__logo">
                    <a href="/">
                        <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}" width="250">
                    </a>
                </div><!-- /.main-header__logo -->
                <div class="main-header__menu">
                    <nav class="main-header__nav main-menu">
                        {!!
                            Menu::renderMenuLocation('main-menu', [
                            'options' => ['class' => 'main-menu__list'],
                            'view' => 'main-menu',
                            ])
                        !!}                        
                    </nav><!-- /.main-header__nav -->
                </div>
                <div class="main-header__link">
                    <div class="main-header__call">
                        <i class="icon-telephone"></i>
                        <a href="tel:{{setting('contact_phone')}}">{{setting('contact_phone')}}</a>
                    </div>
                    <a class="main-header__btn" href="contact">Book Appointment</a>
                </div>
                <div class="mobile-nav__btn mobile-nav__toggler">
                    <span></span>
                    <span></span>
                    <span></span>
                </div><!-- /.mobile-nav__toggler -->
            </div>
        </header>