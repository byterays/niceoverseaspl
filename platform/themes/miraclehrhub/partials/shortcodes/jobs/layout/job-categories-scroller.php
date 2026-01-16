<section class="project-one--home-three p-0 mb-10">
    <div class="container">
        <div class="row">
            <div class="col-md-12">               
                <div class="hiredots-owl__carousel owl-theme owl-carousel" data-owl-options='{
                    
                   "items":8,                    
                    "loop":true,
                    "slideTransition": "linear",
                    "autoplay": true,
                    "autoplaySpeed": 3000,                    
                    "nav":false,
                    "dots":false,
                    "responsiveClass": true,
                    "responsive":{
                        "0":{
                            "items":1,
                            "margin": 2
                        },
                        "360":{
                            "items":2,
                            "margin": 2
                        },
                        "575":{
                            "items":3,
                            "margin": 2
                        },
                        "768":{
                            "items":4,
                            "margin":2
                        },
                        "992":{
                            "items": 6,
                            "margin": 2
                        },
                        "1200":{
                            "items":8,
                            "margin": 2
                        }
                    }
                    }'>
                    <?php

                    foreach ($job_categories as $category) {
                    ?>
                        <div class="client-carousel__one__item align-middle">
                            <center>
                                <a href="#" class="btn btn-danger no-wrap"><?= $category ?> </a>
                            </center>
                        </div><!-- /.owl-slide-item-->
                    <?php
                    }
                    ?>


                </div><!-- /.thm-owl__slider -->
            </div>
        </div>

    </div><!-- /.container -->
</section>