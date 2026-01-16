<?php

namespace Botble\BusinessService\Tables;

use Botble\BusinessService\Models\ServiceIndustry;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\ImageColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\JsonResponse;

class ServiceIndustryTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(ServiceIndustry::class)
            ->addActions([
                EditAction::make()->route('business-services.service-industries.edit'),
                DeleteAction::make()->route('business-services.service-industries.destroy'),
            ]);
    }

    public function query(): Builder
    {
        $query = $this->getModel()
            ->query()
            ->select([
                'id',       
                'name' ,        
                'image',
                'description',
                'content',
                'created_at',
                'status',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),            
            NameColumn::make()->route('business-services.service-industries.edit'), 
            ImageColumn::make(),
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ];
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('business-services.service-industries.create'), 'business-services.service_industry.create');
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('business-services.service-industries.destroy'),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            'name' => [
                'title' => trans('core/base::tables.name'),
                'type' => 'text',
                'validate' => 'required|max:120',
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'datePicker',
            ],
        ];
    }
}
