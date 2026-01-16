
<section class="job-categories mb-4">
<div class="container">
    <div class="sec-title text-center">
        <h3 class="sec-title__title upper-bar text-success"><?= $shortcode->title ?></h3><!-- /.sec-title__title -->
    </div>
    <div class="row">
        <div class="col-md-12-">

        <div class="hiredots-owl__carousel owl-theme owl-carousel" data-owl-options='{
                    
                    "items":12,                    
                     "loop":true,
                     "slideTransition": "linear",
                     "autoplay": true,
                     "autoplaySpeed": 5000,                                       
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
                    
 
                     @foreach ($countries as $country) 
                   
                         <div class="client-carousel__one__item align-middle">
                             <center>
                             <a class='btn btn-warning' href='countries/{{strtolower($country->name)}}'><i><img width='40' src="{{RvMedia::getImageUrl(@$country->image)}}" /></i> {{$country->name}} </a>
                             </center>
                         </div><!-- /.owl-slide-item-->
                    @endforeach
 
 
                 </div><!-- /.thm-owl__slider -->
           
        </div>
    </div>
</div>
</section>