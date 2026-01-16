<div class="job-info col-md-12">
    <div class="jobs-list__card my-1 p-2 ">
        <div class="jobs-list__left">
            <div class="jobs-list__logo">
                <a href="{{$job->company->url}}" title="{{$job->company->name}}">
                    <img width="150" src="{{ RvMedia::getImageUrl($job->company->logo_thumb) }}" alt="{{$job->company->name}}">
                </a>
            </div>
            <div class="jobs-list__content">
                <h3 class="jobs-list__title"><a href="{{ $job->url  ?: 'javascript:void(0);' }}">{{$job->name}}</a></h3>
                <!-- <span class="jobs-list__location">San Fransisco, California</span> -->
                <span class="jobs-list__price">Salary: <b>{{$job->salary}}</b></span>
                <div class="jobs-list__time"><a>{{$job->country->name}}</a> <i class="fas fa-clock"></i> Posted On: {{ date_format($job->created_at,"Y-m-d")}} </div>
                <div class="col-md-12">
                <a href="{{$job->url}}" class="hiredots-btn gray job-detail" > <i class="fa fa-eye"></i>View Details </a>
                    @if($job->applicattion_closing_date<=date("Y-m-d")) {!! Theme::partial('apply-button', compact('job')) !!} @else <span class="hiredots-btn red">Job Closed</span>
                        @endif
                </div>
            </div>
        </div>
    </div>
</div>