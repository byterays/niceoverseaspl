<section class="job-categories ">
    <div class="container">
        <div class="sec-title text-center">
            <h3 class="sec-title__title upper-bar text-success"><?= $shortcode->title ?></h3><!-- /.sec-title__title -->
        </div>
        <div class="row">
            <div class="col-md-12">
                <center>
                    <?php
                    foreach ($countries as $country) {
                        echo "<a class='btn btn-warning' href='#'><i><img width='40' src='" . RvMedia::getImageUrl($country->flag) . "'/></i> " . $country->name . "</a>";
                    }
                    ?>
                </center>
            </div>
        </div>
    </div>
</section>