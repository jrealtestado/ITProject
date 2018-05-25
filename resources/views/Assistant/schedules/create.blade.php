@extends('layouts.assistantLayout')

@section('content')
    <section class="content-header">
        <h1>
            Create Schedule
        </h1>
        <ol class="breadcrumb">
            <li><a href="/assistant"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Schedule</li>
        </ol>
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

                        {!! Form::open(['action' => 'Assistant\\SchedulesController@store', 'method' => 'POST']) !!}
                            {{ csrf_field() }}
                            <div class="form-group" {{ $errors->has('patID') ? 'has-error' : ''}}>
                                {{Form::label('patID', 'Patient Name')}}
                                <select name="patID" class="form-control">
                                    @foreach($patients as $patient)
                                        <option value="{{$patient->patID}}">{{$patient->name}}</option>
                                    @endforeach
                                </select>
                            </div> 
                            <div class="form-group" {{ $errors->has('date') ? 'has-error' : ''}}>
                                {{Form::label('date', 'Date')}}
                                {{Form::date('date', '', ['class' => 'form-control'])}}
                            </div>
                            <div class="form-group" {{ $errors->has('timeFrom') ? 'has-error' : ''}}>
                                {{Form::label('timeFrom', 'Time From')}}
                                {{Form::time('timeFrom', '', ['class' => 'form-control'])}}
                            </div>
                            <div class="form-group" {{ $errors->has('timeTo') ? 'has-error' : ''}}>
                                {{Form::label('timeTo', 'Time To')}}
                                {{Form::time('timeTo', '', ['class' => 'form-control', 'placeholder' => 'First name followed by Last Name'])}}
                            </div>
                            <div class="form-group" {{ $errors->has('opStatus') ? 'has-error' : ''}}>
                                <input type="hidden" name="opStatus" value="Pending">
                            </div>
                            <div class="form-group" {{ $errors->has('servID') ? 'has-error' : ''}}>
                                {{Form::label('servID', 'Service')}}
                                <select name="servID" class="form-control">
                                        @foreach($services as $service)
                                            <option value="{{$service->servID}}">{{$service->servName}}</option>
                                        @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                {{Form::label('price', 'Price of Services')}}
                                <input name ="price" class="form-control" value="{{$service->price}}"/>
                            </div>
                            
                            <div class="form-group" {{ $errors->has('dentID') ? 'has-error' : ''}}> 
                                {{Form::label('dentID', 'Dentist')}}                              
                                 <select type="hidden" name="dentID" class="form-control">
                                    @foreach($dentists as $dentist)
                                        <option value="{{$dentist->dentID}}">{{$dentist->name}}</option>
                                    @endforeach
                                </select> 
                            </div>

                            <div class="form-group" {{ $errors->has('teethID') ? 'has-error' : ''}}> 
                                {{Form::label('teethID', '  ')}}
                                @foreach($teeth as $tooth)                              
                                    <input type="hidden" name="teethID" value="{{$tooth->teethID}}"></input>
                                @endforeach
                            </div>
                              
                            {{Form::submit('Submit', ['class'=>'btn btn-primary pull-right']) }}
                        {!! Form::close() !!}                        
                        <a href="{{ url('/assistant/schedules') }}" title="Back"><button class="btn btn-warning"> Cancel</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
