
<footer class="main-footer background-black">
    <div class="main-footer__bg" style="background-image: url(assets/images/backgrounds/footer-bg.jpg);"></div>
    <!-- /.main-footer__bg -->
    <?php //include "template/widgets/footer-subscribe.php"; ?>
    <div class="main-footer__top">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-xl-5">
                    <div class="footer-widget footer-widget--about">
                        <a href="/" class="footer-widget__logo">
                            <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}" width="250">
                        </a>
                        <p class="footer-widget__text">
                            HR consultancy, recruiting and placement .<br />
                            Your partner for overseas recruitment.<br />
                            Bridging talent to opportunity: Empowering your workforce journey.
                        </p>
                        <div class="footer-widget__author">
                            <div class="footer-widget__author__img">
                                <img src="themes/miraclehrhub/assets/images/resources/footer-about-avata.png" alt="">
                            </div>
                            <div>
                                <div class="footer-widget__author__info">
                                    <span class="footer-widget__author__tagline">Need Help?</span>
                                    <h3 class="footer-widget__author__title"><a href="contact">Book Appointment </a></h3>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.footer-widget -->
                </div><!-- /.col-md-6 -->
                <div class="col-md-6 col-xl-2">
                    <div class="footer-widget footer-widget--links">
                        <h2 class="footer-widget__title">Explore</h2><!-- /.footer-widget__title -->
                        <ul class="list-unstyled footer-widget__links">
                            <li><a href="#">About Company</a></li>
                            <li><a href="#">Services</a></li>
                            <li><a href="#">Meet the Team</a></li>
                            <li><a href="#">News & Media</a></li>
                            <li><a href="#">Our Sectors</a></li>
                            <li><a href="contact">Contact</a></li>
                        </ul><!-- /.list-unstyled footer-widget__links -->
                    </div><!-- /.footer-widget -->
                </div><!-- /.col-md-6 -->
                <div class="col-md-6 col-xl-2">
                    <div class="footer-widget footer-widget--contact">
                        <h2 class="footer-widget__title">Links</h2><!-- /.footer-widget__title -->
                        <ul class="list-unstyled footer-widget__links">
                            <li><a href="#">Apply Now</a></li>
                            <li><a href="#">Contract to Hire</a></li>
                            <li><a href="#">Our Solutions</a></li>
                        </ul><!-- /.list-unstyled footer-widget__links -->
                    </div><!-- /.footer-widget -->
                </div><!-- /.col-md-6 -->
                <div class="col-md-6 col-xl-3">
                    <div class="footer-widget footer-widget--time">
                        <h2 class="footer-widget__title">Contact</h2><!-- /.footer-widget__title -->
                        <p class="footer-widget__text">{!!setting('office_address')!!}</p>
                        <!-- /.footer-widget__text -->
                        <ul class="list-unstyled footer-widget__info">
                            <li><i class="fas fa-envelope"></i> <a href="mailto:{{setting('email_address')}}">{{setting('email_address')}}</a></li>
                            <li><i class="fas fa-phone-square"></i> <a href="tel:{{setting('contact_phone')}}">{{setting('contact_phone')}}</a></li>
                        </ul><!-- /.list-unstyled -->
                    </div><!-- /.footer-widget -->
                </div><!-- /.col-md-6 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </div><!-- /.main-footer__top -->
    <div class="main-footer__bottom">
        <div class="container">
            <div class="main-footer__bottom__inner">
                <div class="footer-widget__social">
                    <a href="//twitter.com/">
                        <i class="fab fa-twitter" aria-hidden="true"></i>
                        <span class="sr-only">Twitter</span>
                    </a>
                    <a href="//facebook.com/">
                        <i class="fab fa-facebook" aria-hidden="true"></i>
                        <span class="sr-only">Facebook</span>
                    </a>
                    <a href="//pinterest.com/">
                        <i class="fab fa-pinterest-p" aria-hidden="true"></i>
                        <span class="sr-only">Pinterest</span>
                    </a>
                    <a href="//instagram.com/">
                        <i class="fab fa-instagram" aria-hidden="true"></i>
                        <span class="sr-only">Instagram</span>
                    </a>
                </div><!-- /.footer-widget__social -->
                <p class="main-footer__copyright">
                    &copy; Copyright <span class="dynamic-year"></span> Nice Overseas Pvt. Ltd.
                </p>
            </div><!-- /.main-footer__inner -->
        </div><!-- /.container -->
    </div><!-- /.main-footer__bottom -->
</footer><!-- /.main-footer -->

</div><!-- /.page-wrapper -->



<div class="mobile-nav__wrapper">
    <div class="mobile-nav__overlay mobile-nav__toggler"></div>
    <!-- /.mobile-nav__overlay -->
    <div class="mobile-nav__content">
        <span class="mobile-nav__close mobile-nav__toggler"><i class="fa fa-times"></i></span>
        <div class="logo-box">
            <a href="/" aria-label="logo image"><img src="assets/images/logo-light.png" width="155" alt=""></a>
        </div>
        <!-- /.logo-box -->
        <div class="mobile-nav__container"></div>
        <!-- /.mobile-nav__container -->
        <ul class="mobile-nav__contact list-unstyled">
            <li>
                <i class="fa fa-envelope"></i>
                <a href="mailto:info@niceoverseaspl.com">info@niceoverseaspl.com</a>
            </li>
            <li>
                <i class="fa fa-phone-alt"></i>
                <a href="tel:(+977)15435529">+(977) 1543-5529                </a>
            </li>
        </ul><!-- /.mobile-nav__contact -->
        <div class="mobile-nav__social">
            <a href="//twitter.com/">
                <i class="fab fa-twitter" aria-hidden="true"></i>
                <span class="sr-only">Twitter</span>
            </a>
            <a href="//facebook.com/">
                <i class="fab fa-facebook" aria-hidden="true"></i>
                <span class="sr-only">Facebook</span>
            </a>
            <a href="//pinterest.com/">
                <i class="fab fa-pinterest-p" aria-hidden="true"></i>
                <span class="sr-only">Pinterest</span>
            </a>
            <a href="//instagram.com/">
                <i class="fab fa-instagram" aria-hidden="true"></i>
                <span class="sr-only">Instagram</span>
            </a>
        </div><!-- /.mobile-nav__social -->
    </div>
    <!-- /.mobile-nav__content -->
</div>
<!-- /.mobile-nav__wrapper -->
<div class="search-popup">
    <div class="search-popup__overlay search-toggler"></div>
    <!-- /.search-popup__overlay -->
    <div class="search-popup__content">
        <form role="search" method="get" class="search-popup__form" action="#">
            <input type="text" id="search" placeholder="Search Here...">
            <button type="submit" aria-label="search submit" class="hiredots-btn hiredots-btn--base">
                <span><i class="icon-magnifying-glass"></i></span>
            </button>
        </form>
    </div>
    <!-- /.search-popup__content -->
</div>
<!-- /.search-popup -->

<div class="modal fade" id="modal-popup" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
           
            <div class="modal-body">
              
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              
            </div>
        </div>
    </div>
</div>

<a href="#" data-target="html" class="scroll-to-target scroll-to-top">
    <span class="scroll-to-top__text">back top</span>
    <span class="scroll-to-top__wrapper"><span class="scroll-to-top__inner"></span></span>
</a>



@if (is_plugin_active('job-board'))
    @include(Theme::getThemeNamespace('partials.apply-modal'))
@endif
<div id="alert-container" class="toast-notification"></div>
{!! Theme::footer() !!}

</body>

</html>