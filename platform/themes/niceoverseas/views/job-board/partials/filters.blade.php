@php
    [$jobCategories, $jobTypes, $jobExperiences, $jobSkills, $maxSalaryRange, $jobCountries] = JobBoardHelper::dataForFilter(request()->input());
@endphp

<div class="col-lg-3 col-md-12 filter-section col-sm-12 col-12 sidebar-filter-mobile">
    <div class="sidebar-shadow none-shadow mb-30">
        <div class="backdrop"></div>
        <div class="sidebar-filters sidebar-filter-mobile__inner">
            {!! Form::open(['url' => route('public.ajax.jobs'), 'method' => 'GET', 'id' => 'jobs-filter-form', 'class' => 'sidebar-filter-mobile__content']) !!}
                <input type="hidden" name="page" data-value="{{ $jobs->currentPage() ?: 1 }}" />
                <input type="hidden" name="keyword" value="{{ BaseHelper::stringify(request()->query('keyword')) }}" />
                <input type="hidden" name="per_page" />
                <input type="hidden" name="layout" />
                <input type="hidden" name="sort_by" />
                @isset($cityId)
                    <input type="hidden" name="city_id" value="{{ $cityId }}" />
                @endisset
                @isset($stateId)
                    <input type="hidden" name="state_id" value="{{ $stateId }}" />
                @endisset
                @if (isset($jobTags))
                    @foreach($jobTags as $jobTag)
                        <input type="hidden" name="job_tags[]" value="{{ $jobTag }}" />
                    @endforeach
                @endif
                
                @if(! Route::is('public.job-category') && $jobCountries->isNotEmpty())
                    <div class="filter-block mb-20">
                        <h5 class="medium-heading mb-15">{{ __('Country') }}</h5>
                        <div class="mb-3 ps-custom-scrollbar">
                            <ul class="list-checkbox">
                                @foreach($jobCountries as $country)
                                    <li>
                                        <label class="cb-container">
                                            <input
                                                type="checkbox"
                                                class="submit-form-filter"
                                                name="job_countries[]"
                                                form="jobs-filter-form"
                                                @checked(in_array($country->id, (array) request()->input('job_countries', [])))
                                                value="{{ $country->id }}"
                                            >
                                            <span class="text-small">{{ $country->name }}</span>
                                            <span class="checkmark"></span>
                                        </label>
                                        <span class="number-item">{{ $country->jobs_count ?: 0 }}</span>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                @endif

                @if(! Route::is('public.job-category') && $jobCategories->isNotEmpty())
                    <div class="filter-block mb-20">
                        <h5 class="medium-heading mb-15">{{ __('Industry') }}</h5>
                        <div class="mb-3 ps-custom-scrollbar">
                            <ul class="list-checkbox">
                                @foreach($jobCategories as $jobCategory)
                                    <li>
                                        <label class="cb-container">
                                            <input
                                                type="checkbox"
                                                class="submit-form-filter"
                                                name="job_categories[]"
                                                form="jobs-filter-form"
                                                @checked(in_array($jobCategory->id, (array) request()->input('job_categories', [])))
                                                value="{{ $jobCategory->id }}"
                                            >
                                            <span class="text-small">{{ $jobCategory->name }}</span>
                                            <span class="checkmark"></span>
                                        </label>
                                        <span class="number-item">{{ $jobCategory->jobs_count ?: 0 }}</span>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                @endif

                @if($jobTypes->isNotEmpty())
                <div class="filter-block mb-20">
                    <h5 class="medium-heading mb-15">{{ __('Job type') }}</h5>
                    <div class="mb-3 ps-custom-scrollbar">
                        <ul class="list-checkbox">
                            @foreach($jobTypes as $jobType)
                                <li>
                                    <label class="cb-container">
                                        <input
                                            type="checkbox"
                                            class="submit-form-filter"
                                            value="{{ $jobType->id }}"
                                            name="job_types[]"
                                            id="check-job-type-{{ $jobType->id }}"
                                            form="jobs-filter-form"
                                            @checked(in_array($jobType->id, (array) request()->input('job_types', [])))
                                        >
                                        <span class="text-small">{{ $jobType->name }}</span>
                                        <span class="checkmark"></span>
                                    </label>
                                    <span class="number-item">{{ $jobType->jobs_count ?: 0 }}</span>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            @endif


            <div class="filter-block mb-30">
                    <h5 class="medium-heading mb-10">{{ __('Job Posted') }}</h5>
                    <div class="mb-3">
                        <ul class="list-checkbox">
                            @foreach(JobBoardHelper::postedDateRanges() as $key => $item)
                                <li>
                                    <label class="cb-container">
                                        <input
                                            type="checkbox"
                                            class="submit-form-filter"
                                            name="date_posted"
                                            value="{{ $key }}"
                                            id="date-posted-{{ $key }}"
                                            form="jobs-filter-form"
                                            @checked($key == request()->input('date_posted'))
                                        >
                                        <span class="text-small">{{ $item['name'] }}</span>
                                        <span class="checkmark"></span>
                                    </label>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>

          
            {!! Form::close() !!}
        </div>
    </div>
</div>
