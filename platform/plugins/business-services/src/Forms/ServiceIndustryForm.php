<?php

namespace Botble\BusinessService\Forms;

use Botble\Base\Forms\FieldOptions\DescriptionFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\BusinessService\Http\Requests\ServiceIndustryRequest;
use Botble\BusinessService\Models\ServiceIndustry;

class ServiceIndustryForm extends FormAbstract
{
    public function buildForm(): void
    {
        $this
            ->setupModel(new ServiceIndustry())
            ->setValidatorClass(ServiceIndustryRequest::class)
            ->withCustomFields()           
            ->add('name', TextField::class, NameFieldOption::make()->required()->toArray())            
            ->add('description', TextareaField::class, DescriptionFieldOption::make()->toArray())
            ->add('content', 'editor', [
                'label' => trans('core/base::forms.content'),            
                'attr' => [
                    'rows' => 4,
                    'placeholder' => trans('core/base::forms.description_placeholder'),
                    'with-short-code' => true,
                ],
            ])                
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())   
            ->add('image', 'mediaImage')        
            ->setBreakFieldPoint('status');
    }
}
