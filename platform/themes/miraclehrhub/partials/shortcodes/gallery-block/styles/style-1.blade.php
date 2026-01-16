

<div class="project-one project-one--home-three background-gray">
    <div class="container py-5">
        <div class="sec-title text-center">

            <h6 class="sec-title__tagline">{!! BaseHelper::clean($shortcode->title) !!}</h6><!-- /.sec-title__tagline -->

            <h3 class="sec-title__title">{!! BaseHelper::clean($shortcode->subtitle) !!}</h3><!-- /.sec-title__title -->
        </div><!-- /.sec-title -->
        <div class="hiredots-owl__carousel owl-theme owl-carousel" data-owl-options='{
			"items": 4,
			"margin": 30,
			"loop": true,
			"smartSpeed": 3000,
            "autoplaySpeed": 3000,
            "slideTransition": "linear",
            "autoplayTimeout": 3000,            
			"nav": false,
			"navText": ["<span class=\"fa fa-angle-left\"></span>","<span class=\"fa fa-angle-right\"></span>"],
			"dots": false,
			"autoplay": true,
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

            @foreach (gallery_meta_data($gallery) as $image)
            <div class="item">
                <div class="project-one__card-" >
                    <div class="project-one__img">
                        <img src="{{ RvMedia::getImageUrl(Arr::get($image, 'img')) }}" alt="{{ BaseHelper::clean(Arr::get($image, 'description')) }}">
                    </div>                   
                </div>
            </div>
            @endforeach
            
        </div>
    </div>
</div>