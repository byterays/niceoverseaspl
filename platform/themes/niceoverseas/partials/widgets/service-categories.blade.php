@php
    $items = $settings['items'] ?? [];
@endphp

<div class="page-catagery-list">
    <h3>{{ $settings['title'] ?? 'Services' }}</h3>
    <ul>

        @foreach ($items as $item)

            @switch($item['type'])

                @case('custom')
                    <li>
                        <a href="{{ $item['url'] ?? '#' }}">
                            {{ $item['label'] ?? '' }}
                        </a>
                    </li>
                    @break

                @case('page')
                    @php $model = \Botble\Page\Models\Page::find($item['id']); @endphp
                    @if($model)
                        <li><a href="{{ $model->url }}">{{ $model->name }}</a></li>
                    @endif
                    @break

                @case('post')
                    @php $model = \Botble\Blog\Models\Post::find($item['id']); @endphp
                    @if($model)
                        <li><a href="{{ $model->url }}">{{ $model->name }}</a></li>
                    @endif
                    @break

                @case('category')
                    @php $model = \Botble\Blog\Models\Category::find($item['id']); @endphp
                    @if($model)
                        <li><a href="{{ $model->url }}">{{ $model->name }}</a></li>
                    @endif
                    @break

                @case('latest_from_category')
                    @php
                        $posts = \Botble\Blog\Models\Post::whereHas('categories', function ($query) use ($item) {
                                $query->where('categories.id', $item['id']);
                            })
                            ->latest()
                            ->take($item['limit'] ?? 5)
                            ->get();
                    @endphp

                    @foreach($posts as $post)
                        <li>
                            <a href="{{ $post->url }}">
                                {{ $post->name }}
                            </a>
                        </li>
                    @endforeach
                    @break

            @endswitch

        @endforeach

    </ul>
</div>
