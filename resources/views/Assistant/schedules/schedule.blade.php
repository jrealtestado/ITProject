@extends('layouts.assistantLayout')

@section('content')
    <section class="content-header">
        <h1>
            Checkout
        </h1>
        <ol class="breadcrumb">
            <li><a href="/assistant"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Schedule</li>
        </ol>
        <h4>{{$schedule->patient->name}}</h4>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body">
                        @if ($errors->any())
                            <ul class="alert alert-danger">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        @endif
                        {!! Form::open(['action' => ['Assistant\\SchedulesController@update',  $schedule->schedId], 'method' => 'POST']) !!}
                        <div class="form-group" {{ $errors->has('patID') ? 'has-error' : ''}}>
                            <input type="hidden" name="patID" value="{{$schedule->patient->patID}}">
                        </div>
                        <div class="form-group" {{ $errors->has('date') ? 'has-error' : ''}}>
                            <input type="hidden" name="date" value="{{$schedule->date}}">
                        </div>
                        <div class="form-group" {{ $errors->has('timeFrom') ? 'has-error' : ''}}>
                            <input type="hidden" name="timeFrom" value="{{$schedule->timeFrom}}">
                        </div>
                        <div class="form-group" {{ $errors->has('timeTo') ? 'has-error' : ''}}>
                            <input type="hidden" name="timeTo" value="{{$schedule->timeTo}}">
                        </div>    
                        <div class="form-group">
                            {{Form::label('teethAffected', 'Teeth Affected')}}
                            <select name="teethID" class="form-control">
                                @foreach($teeth as $tooth)
                                    <option value="{{$tooth->teethID}}">{{$tooth->teethCode}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            {{Form::label('service', 'Service Rendered')}}
                            <select name="servID" class="form-control" disabled>
                                <option value="{{$schedule->service->servID}}">{{$schedule->service->servName}}</option>
                                @foreach($services as $service)
                                    <option value="{{$service->servID}}">{{$service->servName}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            {{Form::label('price', 'Price of Services')}}
                            {{Form::text('price', $schedule->service->price, ['class' => 'form-control', 'placeholder' => 'Total price of services'])}}
                        </div>
                        <div class="form-group">
                            {{Form::label('payment', 'Payment')}}
                            {{Form::text('payment', '', ['class' => 'form-control', 'placeholder' => 'Payment Amount'])}}
                            <input type="hidden" name="balance" value="">
                        </div>
                        {{Form::hidden('_method', 'PATCH')}}

                        <div class="box-footer">
                            <a href="{{ url('/assistant/schedules') }}" title="Back"><button class="btn btn-warning"> Cancel</button></a>
                            {{Form::submit('Submit', ['class'=>'btn btn-primary pull-right']) }}               
                        </div>
    
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
