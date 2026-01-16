{!! Theme::partial('header') !!}


<section class="page-header">
    <!-- style="background-image: url({{ RvMedia::getImageUrl(Theme::get('pageCoverImage') ?: theme_option('background_breadcrumb'), null, false, RvMedia::getDefaultImage()) }})" -->
    <div class="page-header__bg" style="background-image: url({{ RvMedia::getImageUrl(Theme::get('pageCoverImage') ?: theme_option('background_breadcrumb'), null, false, RvMedia::getDefaultImage()) }}"></div>

    <!-- /.page-header__bg -->
    <div class="container">
        <h2 class="page-header__title">{!! SeoHelper::getTitle() !!}</h2>
        <ul class="hiredots-breadcrumb list-unstyled">
            @foreach($crumbs = Theme::breadcrumb()->getCrumbs() as $i => $crumb)
            <li>
                <a href="{{ $crumb['url'] }}">
                    @if($loop->first)

                    @endif
                    {{ $crumb['label'] }}
                </a>
            </li>
            @endforeach
        </ul>

    </div><!-- /.container -->
</section><!-- /.page-header -->

<section class="service-details pt-0">
    <div class="container">
        <div class="row gutter-y-30">
            <?php
            $hasSidebar = false;
            if (@$hasSidebar) : ?>
                {!! Theme::partial("sidebar-nav") !!}
            <?php endif; ?>
            <div class="col-md-12 col-lg-{{@$hasSidebar?'8':'12'}}">

                <div class="service-details__content">
                    @if(Theme::get('pageImage'))
                    <div class="pt-3 pb-3">
                        <img width="100%" src="{{ RvMedia::getImageUrl(Theme::get('pageImage'))}}" alt="{!! SeoHelper::getTitle() !!}" />
                    </div>
                    @endif
                    {!! Theme::content() !!}
                </div><!-- /.service-details__content -->
            </div><!-- /.col-md-12 col-lg-8 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</section><!-- /.service-details -->

{!! Theme::partial('footer') !!}