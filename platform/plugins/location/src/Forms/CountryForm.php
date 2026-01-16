<?php

namespace Botble\Location\Forms;

use Botble\Base\Forms\FieldOptions\ContentFieldOption;
use Botble\Base\Forms\FieldOptions\IsDefaultFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\SortOrderFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\Fields\EditorField;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\NumberField;
use Botble\Base\Forms\Fields\OnOffField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\Location\Http\Requests\CountryRequest;
use Botble\Location\Models\Country;
use Yajra\DataTables\Html\Editor\Editor;

class CountryForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Country::class)
            ->setValidatorClass(CountryRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required()->toArray())
            ->add('content', EditorField::class)
            // ->add('is_default', OnOffField::class, IsDefaultFieldOption::make()->toArray())
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->add('image', MediaImageField::class, ['label' => "Flag"])
            //->add('order', NumberField::class, SortOrderFieldOption::make()->toArray())
            ->setBreakFieldPoint('status');
    }
}
