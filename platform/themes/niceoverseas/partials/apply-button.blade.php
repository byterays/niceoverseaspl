@if ($job->canShowApplyJob())
    @php($classButtonApply = $class ?? 'btn btn-apply-now hiredots-btn')
  <?php if(@$wrapClass):?>
    <div class="{{ $wrapClass }}">
<?php endif; ?>
        @if ($job->is_applied)
            <button class="{{ $classButtonApply }} disabled" disabled>{{ __('Applied') }}</button>
       
        @elseif (!auth('account')->check() && !JobBoardHelper::isGuestApplyEnabled())
            <a href="{{ route('public.account.login') }}">
                <div class="{{ $classButtonApply }} ">{{ __('Apply Now') }}</div>
            </a>
        @else
            <button class="{{ $classButtonApply }}"
                    data-job-name="{{ $job->name }}"
                    data-job-id="{{ $job->id }}"
                    data-job-company="{{ $job->company->name }}"
                    data-job-country="{{ $job->country->name }}"
                    data-bs-toggle="modal"
                    data-bs-target="#ModalApplyJobForm"
            >
                {{ __('Apply Now') }}
            </button>
        @endif
    <?php if(@$wrapClass):?>
    </div>
    <?php endif; ?>
@endif
