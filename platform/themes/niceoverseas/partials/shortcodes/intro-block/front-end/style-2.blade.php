<section class="feature-two">
    <div class="container">
        <div class="row gutter-y-30">
        @foreach($tabs as $tab)
            <div class="col-md-6 col-lg-4">
                <div class="feature-two__item">
                    <div class="feature-two__item__top">
                        <div class="feature-two__item__icon"><span class="{!!BaseHelper::clean($tab['icon']) !!}"></span></div>
                        <h3 class="feature-two__item__title">{!!BaseHelper::clean($tab['title']) !!}</h3>
                    </div>
                    <p class="feature-two__item__text">{!!BaseHelper::clean($tab['description']) !!}</p>
                </div>
            </div>
        @endforeach   
        </div>
    </div>
</section>