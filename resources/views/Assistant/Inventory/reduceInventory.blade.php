@extends('layouts.assistantLayout')

@section('content')

        <section class="content-header">
            <h1>
                Add inventory item
            </h1>
            <ol class="breadcrumb">
                <li><a href="{{ url('/assistant') }}"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class=""><a href="{{ url('/assistant/inventory') }}">Inventory</a></li>
                <li class="active">Deduct Item</li>
            </ol>
        </section>
        <div class="well">
            {!! Form::open(['action' => ['Assistant\\InventoryController@reduce', $inventory->invID], 'method' => 'POST']) !!}
            
            <div class="form-group">
                {{Form::label('invName', 'Name')}}
                {{Form::text('invName', $inventory->invName, ['class' => 'form-control', 'placeholder' => 'Inventory Name', 'readonly'])}}
            </div>
            <div class="form-group">
                {{Form::label('deduction', 'Amount')}}
                {{Form::number('deduction', '', ['class' => 'form-control', 'placeholder' => 'Deduction'])}}
            </div>
            <div class="form-group">
                {{Form::hidden('quantity', 'Quantity')}}
                {{Form::hidden('quantity', $inventory->quantity, ['class' => 'form-control', 'placeholder' => 'Initial Quantity'])}}
            </div>
            <div class="form-group">
                {{Form::hidden('low_stock_quantity', 'Low Stock Quantity')}}
                {{Form::hidden('low_stock_quantity', $inventory->low_stock_quantity, ['class' => 'form-control', 'placeholder' => 'Enter the Low Stock Quantity'])}}
            </div>
            <div class="form-group">
                {{Form::hidden('unit', 'Unit Category')}}
                {{Form::hidden('unit', $inventory->unit, ['class' => 'form-control', 'placeholder' => 'Enter the Unit category (e.g. Box, Pieces)'])}}
            </div>
                        
            {{Form::hidden('_method', 'PUT')}}
            <div class="box-footer">
                <a href="{{ url('/assistant/inventory') }}" class="btn btn-default">Cancel</a>
                {{Form::submit('Submit', ['class'=>'btn btn-primary pull-right']) }}
            </div>
            {!! Form::close() !!}
        </div>
@endsection