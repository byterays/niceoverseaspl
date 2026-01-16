<div class="client-carousel client-carousel-one ">
    <div class="container">
        <div class="client-carousel__one hiredots-owl__carousel owl-theme owl-carousel" data-owl-options='{
            "items": 8,
            "margin": 55,           
            "loop": true,
			"smartSpeed": 2000,
            "autoplaySpeed": 2000,
            "slideTransition": "linear",
            "autoplayTimeout": 2000,  
            "autoplay":true,     
            "nav":false,
            "dots":false,
            "navText": ["<span class=\"fa fa-angle-left\"></span>","<span class=\"fa fa-angle-right\"></span>"],
            "responsive":{
                "0":{
                    "items":1,
                    "margin": 0
                },
                "360":{
                    "items":2,
                    "margin": 0
                },
                "575":{
                    "items":3,
                    "margin": 30
                },
                "768":{
                    "items":3,
                    "margin": 40
                },
                "992":{
                    "items": 4,
                    "margin": 40
                },
                "1200":{
                    "items": 5
                }
            }
            }'>

          @foreach($clients as $client)
            <div class="client-carousel__one__item">                
                <a href='{{$client->url}}'><img src="{{RvMedia::getImageUrl($client->logo)}}" alt="{{$client->name}}"></a>
            </div><!-- /.owl-slide-item-->
           @endforeach
        </div><!-- /.thm-owl__slider -->
    </div><!-- /.container -->
</div><!-- /.client-carousel -->