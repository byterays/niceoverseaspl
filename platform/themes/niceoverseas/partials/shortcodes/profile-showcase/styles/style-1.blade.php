<div class="project-one--home-three bg-warning p-3">
    <div class="container">
        <div class="row">
            <div class="col-md-6 ">
                <section class="row p-2">
                    <div class="col-lg-6 bg-white p-4">
                        <div class="team-details__image ">
                            <img src="{{RvMedia::getImageUrl($shortcode->photo)}}">
                        </div><!-- /.team-details__image -->
                        <div class="text-center">
                            <p><strong> {{$shortcode->name}},  {{$shortcode->position}}</strong></p>
                            {!!nl2br($shortcode->profile_list)!!}
                        </div>
                       
                    </div><!-- /.col-lg-6 -->
                    <div class="col-lg-6 bg-white px-0">
                        <div class="team-details__text text-center text-dark lh-sm p-4 ">
                           {!!$shortcode->message!!}
                        </div>
                        <!-- /.team-details__text -->
                    </div><!-- /.col-lg-6 -->
                </section><!-- /.team-details -->
            </div>

            <div class="col-md-6 ">

            @foreach($tabs as $tab)
          
                <div class="row mb-2 mx-0 py-2">
                    <div class="col-md-4">
                        <div class="team-details__image  bg-white p-5 ">
                            <img src="{{RvMedia::getImageUrl($tab['company_logo'])}}">
                        </div>
                    </div>
                    <div class="col-md-8 ">

                        <div class="row bg-white pt-3">
                            <div class="col-md-5 p-0">
                                <center><img class="profile-img mb-3" src="{{RvMedia::getImageUrl($tab['profile_thumb'])}}"></center>
                            </div>
                            <div class="col-md-7 d-flex flex-column">
                                <a href="//{{$tab['website_link']}}" class="btn btn-warning  mb-2">{{$tab['website_text']}}</a>
                                <a href="//{{$tab['profile_link']}}" target="_blank" class="btn btn-danger mb-2 ">{{$tab['profile_text']}}</a>
                            </div>

                        </div>

                    </div>
                </div>
            @endforeach
                <!-- <div class="row mb-2 mx-0 py-2-">
                    <div class="col-md-4">
                        <div class="team-details__image bg-white p-5" >
                            <img src="assets/images/company/miracle-manpower150-1.png">
                        </div>
                    </div>
                    <div class="col-md-8 ">

                        <div class="row bg-white pt-3">
                            <div class="col-md-5 p-0">
                            <center><img class="profile-img  mb-3" src="assets/images/resources/profile/miracle-nepal-profile.png"></center>
                            </div>
                            <div class="col-md-7 d-flex flex-column ">
                                <a href="//manpowermiracle.com" class="btn btn-warning mb-2">Visit Website</a>
                                <a href="//manpowermiracle.com" target="_blank" class="btn btn-danger mb-2">Company Profile</a>
                            </div>

                        </div>

                    </div>
                </div> -->

            </div>
        </div>
    </div><!-- /.container -->
</div>