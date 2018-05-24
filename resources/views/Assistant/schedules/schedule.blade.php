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
                        {!! Form::open(['action' => 'Assistant\\PatientsController@store', 'method' => 'POST']) !!}
                        <div class="form-group">
                            {{Form::label('teethAffected', 'Teeth Affected')}}
                            {{Form::text('teethAffected', '', ['class' => 'form-control', 'placeholder' => 'Teeth Code (e.g. R1)'])}}
                        </div>
                        <div class="form-group">
                            {{Form::label('service', 'Service Rendered')}}
                            {{Form::text('service', '', ['class' => 'form-control', 'placeholder' => 'Teeth Whitening etc.'])}}
                        </div>
                        <div class="form-group">
                            {{Form::label('servicePrice', 'Price of Services')}}
                            {{Form::text('servicePrice', '', ['class' => 'form-control', 'placeholder' => 'Total price of services'])}}
                        </div>
                        <div class="form-group">
                            {{Form::label('payment', 'Payment')}}
                            {{Form::text('payment', '', ['class' => 'form-control', 'placeholder' => 'Payment Amount'])}}
                        </div>
                        
                        
                    {!! Form::close() !!}
                    </div>
                                           
                    <div class="box-footer">
                        <a href="{{ url('/assistant/schedules') }}" title="Back"><button class="btn btn-warning"> Cancel</button></a>
                    <div class="pull-right">
                {!! Form::open(['action' => ['Assistant\SchedulesController@destroy', $schedule->schedId], 'method' => 'post', 'class' => 'pull-left' ]) !!}
                    {{Form::hidden('_method', 'DELETE')}}
                    {{Form::submit('Mark as Done', ['class'=>'btn btn-success pull-right']) }}
                {!! Form::close() !!}
                    </div>  
                
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
