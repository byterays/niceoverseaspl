
<div class="project-one project-one--home-three background-gray">
    <div class="container py-5">
        <div class="sec-title text-center">

            <h6 class="sec-title__tagline">{!! BaseHelper::clean($shortcode->title) !!}</h6><!-- /.sec-title__tagline -->

            <h3 class="sec-title__title">{!! BaseHelper::clean($shortcode->subtitle) !!}</h3><!-- /.sec-title__title -->
        </div><!-- /.sec-title -->
        <div class="project-one__carousel hiredots-owl__carousel hiredots-owl__carousel--with-shadow hiredots-owl__carousel--basic-nav owl-carousel owl-theme" data-owl-options='{
			"items": 4,
			"margin": 30,
			"smartSpeed": 2000,
            "autoplaySpeed": 2000,
            "slideTransition": "linear",
			"autoplayTimeout": 2000,  
            "loop":true,
            "autoplay":true,     
			"nav": false,
			"navText": ["<span class=\"fa fa-angle-left\"></span>","<span class=\"fa fa-angle-right\"></span>"],
			"dots": false,			
			"responsive": {
				"0": {
					"items": 1
				},
				"576": {
					"items": 2
				},
				"992": {
					"items": 3
				},
				"1360": {
					"items": 4
				}
			}
			}'>

            @foreach($industries as $data)
            <div class="item">
                <div class="project-one__card wow fadeInUp" data-wow-duration='1500ms' data-wow-delay='1ms'>
                    <div class="project-one__img">
                        <img src="{{ RvMedia::getImageUrl($data->image) }}" alt="{{$data->name}}">
                    </div>
                    <div class="project-one__content">
                        <!-- <span class="project-one__tagline">Sourcing to</span> -->
                        <h3 class="project-one__title"><a href="#">{!! BaseHelper::clean($data->name) !!}</a></h3>
                    </div>
                </div>
            </div>
            @endforeach
            
        </div>
    </div>
</div>