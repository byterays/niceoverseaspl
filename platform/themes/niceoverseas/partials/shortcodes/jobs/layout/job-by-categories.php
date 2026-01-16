<section class="job-categories ">
    <div class="container">
        <div class="sec-title text-center">
            <h3 class="sec-title__title upper-bar text-success"><?=$shortcode->title?></h3><!-- /.sec-title__title -->
        </div>
        <div class="row">
            <div class="col-md-12">
                <center>
                    <?php                   
                        foreach ($job_categories as $category) {
                            echo "<a class='btn btn-warning' href='#'>{$category}</a>";
                        }
                    ?>
                </center>
            </div>
        </div>
    </div>
</section>