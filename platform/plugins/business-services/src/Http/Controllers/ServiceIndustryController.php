<?php

namespace Botble\BusinessService\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\BusinessService\Forms\ServiceIndustryForm;
use Botble\BusinessService\Http\Requests\ServiceIndustryRequest;
use Botble\BusinessService\Models\ServiceIndustry;
use Botble\BusinessService\Tables\ServiceIndustryTable;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ServiceIndustryController extends BaseController
{
    public function __construct(protected BaseHttpResponse $response)
    {
    }

    public function index(ServiceIndustryTable $table): View|JsonResponse
    {
        PageTitle::setTitle(trans('plugins/business-services::business-services.service_industry.name'));

        return $table->renderTable();
    }

    public function create(FormBuilder $formBuilder): string
    {
        PageTitle::setTitle(trans('plugins/business-services::business-services.service_industry.create'));

        return $formBuilder->create(ServiceIndustryForm::class)->renderForm();
    }

    public function store(ServiceIndustryRequest $request): BaseHttpResponse
    {
        $service = ServiceIndustry::query()->create($request->validated());

        event(new CreatedContentEvent('service-industry', $request, $service));

        return $this->response
            ->setNextUrl(route('business-services.service-industries.edit', $service))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(ServiceIndustry $service, Request $request, FormBuilder $formBuilder): string
    {
        event(new BeforeEditContentEvent($request, $service));
        
        PageTitle::setTitle(trans('core/base::forms.edit_item', ['name' => $service->name]));

        return $formBuilder->create(ServiceIndustryForm::class, ['model' => $service])->renderForm();
    }

    public function update(ServiceIndustry $service, ServiceIndustryRequest $request): BaseHttpResponse
    {
        $service->update($request->validated());

        event(new UpdatedContentEvent('service-industry', $request, $service));

        return $this->response
            ->setPreviousUrl(route('business-services.service-industries.index'))
            ->setNextUrl(route('business-services.service-industries.edit', $service))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(ServiceIndustry $service, Request $request): BaseHttpResponse
    {
        $service->delete();

        event(new DeletedContentEvent('service-industry', $request, $service));

        return $this->response->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
