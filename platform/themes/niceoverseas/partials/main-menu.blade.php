<ul  {!! BaseHelper::clean($options) !!}>
    @foreach ($menu_nodes as $key => $row)
    <li class=" nav-item @if($row->has_child) submenu @endif {{ $row->css_class }} @if ($row->active) active @endif">
        <a href="{{ $row->url }}" target="{{ $row->target }}" class="nav-link" >{{ $row->title }}</a>
            @if ($row->has_child)
                {!!
                    Menu::generateMenu([
                        'menu' => $menu,
                        'menu_nodes' => $row->child,
                        'view' => 'main-menu',
                        'options' => ['class' => ''],
                    ])
                !!}
            @endif
    </li>
   
    @endforeach
</ul>
