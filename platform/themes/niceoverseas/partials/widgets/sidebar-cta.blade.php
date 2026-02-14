@php
    $heading = $settings['heading'] ?? 'Take control of your career unlock opportunities today!';
    $phone = $settings['phone'] ?? '';
    $logo = $settings['logo'] ?? '';
    $phoneIcon = $settings['phone_icon'] ?? '';
    $delay = $settings['animation_delay'] ?? '0.25s';
@endphp

<!-- Sidebar CTA Box Start -->
<div class="sidebar-cta-box wow fadeInUp"
     data-wow-delay="{{ $delay }}"
     style="animation-delay: {{ $delay }};">

    <!-- Sidebar CTA Logo Start -->
    @if($logo)
        <div class="sidebar-cta-logo">
            <img src="{{ $logo }}" alt="CTA Logo">
        </div>
    @endif
    <!-- Sidebar CTA Logo End -->

    <!-- Sidebar CTA Content Start -->
    <div class="sidebar-cta-content">

        @if($heading)
            <h3>{{ $heading }}</h3>
        @endif

        @if($phone)
            <a href="tel:{{ $phone }}" class="btn-default">

                @if($phoneIcon)
                    <img src="{{ $phoneIcon }}" alt="Phone Icon">
                @endif

                {{ $phone }}
            </a>
        @endif

    </div>
    <!-- Sidebar CTA Content End -->

</div>
<!-- Sidebar CTA Box End -->
