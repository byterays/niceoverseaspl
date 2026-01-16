<div class="project-one--home-three  jobs background-gray">
    <div class="container ">
        <div class="sec-title text-center">
            <h3 class="sec-title__title upper-bar">{{$shortcode->title}}</h3><!-- /.sec-title__title -->
        </div>
        <div class="jobs-list row">           
            <!-- begin job card  -->

            @foreach($jobs as $job)                   
            <div class="job-info col-md-6">
                <div class="jobs-list__card my-1 p-2 ">
                    <div class="jobs-list__left">
                        <div class="jobs-list__logo">
                            <img width="150" src="{{ RvMedia::getImageUrl($job->company->logo) }}" alt="{{$job->name}}">
                        </div>
                        <div class="jobs-list__content">
                            <h3 class="jobs-list__title"><a href="{{$job->url}}">{{$job->name}} ({{$job->number_of_positions}})</a></h3>
                            <h4 class="jobs-list__sub-title"><a href="{{$job->company_url}}">{{$job->company->name}}</a></h4>
                            <!-- <span class="jobs-list__location">San Fransisco, California</span> -->
                            <span class="jobs-list__price">Salary: <b>{{$job->salary}}</b></span>
                            <div class="jobs-list__time"><a>{{$job->country->name}}</a> <i class="fas fa-clock"></i> Posted On: {{ date_format($job->created_at,"Y-m-d")}} </div>

                            <div class="col-md-12">
                                
                                <a href="{{$job->url}}" class="hiredots-btn gray job-detail" > <i class="fa fa-eye"></i>View Details </a>
                                @if($job->application_closing_date<date("Y-m-d"))



                                {!! Theme::partial('apply-button', ['job' => $job, 'class' => "hiredots-btn"]) !!}
                                    
                                @else
                                    <span class="hiredots-btn red">Job Closed</span>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
            <!-- end job card  -->
           
        </div>
        <div class="row">
            <div class="col-12">
                <center>
                    <a href="jobs" class="hiredots-btn">View All</a>
                </center>
            </div>
        </div>
    </div>
</div>