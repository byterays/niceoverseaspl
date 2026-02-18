@php
    $steps = [];

    foreach ($shortcode->toArray() as $key => $value) {

        if (str_starts_with($key, 'process_title_')) {
            $index = str_replace('process_title_', '', $key);

            $steps[$index] = [
                'title' => $value,
                'description' => $shortcode->{'process_description_' . $index} ?? '',
                'image' => $shortcode->{'process_image_' . $index} ?? '',
            ];
        }
    }

    ksort($steps);

    $smallTitle = $shortcode->small_title ?? '';
    $mainTitle  = $shortcode->main_title ?? '';
    $description = $shortcode->description ?? '';
    $buttonText = $shortcode->button_text ?? '';
    $buttonUrl  = $shortcode->button_url ?? '#';
@endphp

<div class="how-it-work">
    <div class="container">
        <div class="row">

            <div class="col-lg-6">
                <div class="how-work-content">

                    <div class="section-title">
                        @if($smallTitle)
                            <h3 class="wow fadeInUp">{{ $smallTitle }}</h3>
                        @endif

                        @if($mainTitle)
                            <h2 class="text-anime-style-2"
                                data-cursor="-opaque">
                                {!! BaseHelper::clean($mainTitle) !!}
                            </h2>
                        @endif

                        @if($description)
                            <p class="wow fadeInUp"
                               data-wow-delay="0.2s">
                                {{ $description }}
                            </p>
                        @endif
                    </div>

                    @if($buttonText)
                        <div class="how-it-work-btn wow fadeInUp"
                             data-wow-delay="0.4s">
                            <a href="{{ $buttonUrl }}"
                               class="btn-default">
                                {{ $buttonText }}
                            </a>
                        </div>
                    @endif

                </div>
            </div>

            <div class="col-lg-6">
                <div class="how-work-process-list">

                    @foreach($steps as $index => $step)
                        <div class="work-process-item wow fadeInUp"
                             data-wow-delay="{{ $index * 0.2 }}s">

                            <div class="work-process-content">
                                <h3>step {{ str_pad($index + 1, 2, '0', STR_PAD_LEFT) }}</h3>
                                <h2>{{ $step['title'] }}</h2>
                                <p>{{ $step['description'] }}</p>
                            </div>

                            @if($step['image'])
                                <div class="work-process-image">
                                    <figure class="image-anime">
                                        <img src="{{ RvMedia::getImageUrl($step['image']) }}"
                                             alt="{{ $step['title'] }}">
                                    </figure>
                                </div>
                            @endif

                        </div>
                    @endforeach

                </div>
            </div>

        </div>
    </div>
</div>
