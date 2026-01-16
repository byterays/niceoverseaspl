<div class="job-info col-md-6">
    <div class="jobs-list__card my-1 p-2 ">
        <div class="jobs-list__left">
            <div class="jobs-list__logo">
                <img width="150" src="{{ RvMedia::getImageUrl($job->company_logo_thumb) }}" alt="{{$job->name}}">
            </div>
            <div class="jobs-list__content">
                <h3 class="jobs-list__title"><a href="{{ $job->url  ?: 'javascript:void(0);' }}">{{$job->name}}</a></h3>
                <h4 class="jobs-list__sub-title"><a href="{{ $job->company_url ?: 'javascript:void(0);' }}">{{$job->company->name}}</a></h4>
                <!-- <span class="jobs-list__location">San Fransisco, California</span> -->
                <span class="jobs-list__price">Salary: <b>{{$job->salary}}</b></span>
                <div class="jobs-list__time"><a>{{$job->country->name}}</a> <i class="fas fa-clock"></i> Posted On: {{ date_format($job->created_at,"Y-m-d")}} </div>

                <div class="col-md-12">
                    <a href="{{$job->url}}" class="hiredots-btn gray job-detail"> <i class="fa fa-eye"></i>View Details </a>
                    @if($job->applicattion_closing_date<=date("Y-m-d")) {!! Theme::partial('apply-button', compact('job')) !!} @else <span class="hiredots-btn red">Job Closed</span>
                        @endif
                </div>
            </div>
        </div>
    </div>
</div>

<!--


<div class="col-md-6 col-sm-12 col-12 jobs-item job-grid job-info">
    <div class="jobs-list__card card-grid-2 hover-up @if ($job->is_featured) featured-job-item @endif">
        <div class="jobs-list__logo card-grid-2-image-left">
            @if($job->is_featured)
            <span class="flash"></span>
            @endif
            <div class="image-box">
                <img width="150" src="{{ RvMedia::getImageUrl($job->company_logo_thumb) }}" alt="{{ $job->name }}">
            </div>
            <div class="right-info">
                <a class="name-job" href="{{ $job->company_url ?: 'javascript:void(0);' }}">
                    {{ $job->company_name ?: $job->name }}
                </a>
                <span class="location-small">
                    {{ $job->location }}
                </span>
            </div>
        </div>
        <div class="jobs-list__content card-block-info">
            <h6 class="text-truncate">
                <a href="{{ $job->url }}" title="{{ $job->name }}">{{ $job->name }}</a>
            </h6>
            <div class="mt-5">
                <span class="card-briefcase">
                    @if($job->jobTypes->isNotEmpty())
                    @foreach($job->jobTypes as $jobType)
                    {{ $jobType->name }}@if (!$loop->last), @endif
                    @endforeach
                    @endif
                </span>
                <span class="card-time">{{ $job->created_at->diffForHumans() }}</span>
            </div>
            <p class="font-sm color-text-paragraph mt-15 job-description">{{ $job->description }}</p>
            <div class="mt-30">
                @if($job->tags->isNotEmpty())
                @foreach($job->tags->take(10) as $tag)
                <a class="btn btn-grey-small mr-5 mb-2" href="{{ $tag->url }}">{{ $tag->name }}</a>
                @endforeach
                @endif
            </div>
            <div class="card-2-bottom mt-30">
                <div class="row">
                    <div class="col-12 salary-information">
                        {!! Theme::partial('salary', compact('job')) !!}
                    </div>
                    <div class="col-12 mt-3">
                        {!! Theme::partial('apply-button', compact('job')) !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

-->