<section class="service-details">
    <div class="container">
        <div class="row gutter-y-30">
            <div class="col-md-12 col-lg-4">
                <div class="service-sidebar">
                    <?php //include "template/widgets/service-sidebar.php" ?>
                </div><!-- /.sidebar -->
            </div><!-- /.col-md-12 col-lg-4 -->
            <div class="col-md-12 col-lg-8">
                <div class="service-details__content">
                    <h3 class="service-details__title">{{ $service->name }}</h3><!-- /.service-details__title -->
                    <div class="service-details__thumbnail">
                        <img src="{{ RvMedia::getImageUrl($service->image) }}" alt="{{ $service->name }}">
                    </div><!-- /.service-details__thumbnail -->

                    <p>{{ $service->description }}</p>

                    {!! BaseHelper::clean($service->content) !!}

                </div><!-- /.service-details__content -->
            </div><!-- /.col-md-12 col-lg-8 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</section><!-- /.service-details -->

