@extends('layouts.assistantLayout')

@section('content')
    <section class="content-header">
        <h1>
            Schedule
        </h1>
        <ol class="breadcrumb">
            <li><a href="/assistant"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Schedule</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <a href="{{ url('/assistant/schedules/create') }}" class="btn btn-success" title="Add New Schedule">
                    <i class="fa fa-plus" aria-hidden="true"></i>  Add New
                </a>
                <br>
                <br>
                <div class="box">
                <div class="box-body">
                    <form method="GET" action="{{ url('/assistant/schedules') }}" accept-charset="UTF-8" class="form-inline my-2 my-lg-0 float-right" role="search">
                        <div class="input-group pull-right">
                            <input type="text" class="form-control" name="search" placeholder="Search..." value="{{ request('search') }}">
                        </div>
                        <span class="input-group-append pull-right">
                            <button class="btn btn-secondary" type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </form>
                    <br>
                    <br>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Patient Name</th>
                                    <th>Date</th>
                                    <th>Time From</th>
                                    <th>Time To</th>
                                    <th>Services</th>
                                    <th>Dentist</th>
                                    <th>Operation Status</th>
                                    <th><center>Actions</center></th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach($schedules as $item)
                            @if($item->opStatus == 'Pending')
                                <tr>
                                    <td>{{ $item->patient->name }}</td>
                                    <td>{{ $item->date }}</td>
                                    <td>{{ $item->timeFrom }}</td>
                                    <td>{{ $item->timeTo }}</td>
                                    <td>{{ $item->service->servName }}</td>
                                    <td>{{ $item->dentist->name }}</td>
                                    <td>{{ $item->opStatus }}</td>
                                    <td>
                                        <center>
                                        <a href="{{ url('/assistant/schedules/' . $item->schedId . '/edit') }}" title="Edit Schedule"><button class="btn btn-primary btn-sm" onclick="return confirm(&quot;Confirm delete?&quot;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Reschedule</button></a>
                                        <a href="{{ url('/assistant/schedules/' . $item->schedId . '/view') }}" title="View Schedule"><button class="btn btn-success btn-sm" onclick="return confirm(&quot;Confirm delete?&quot;"><i class="fa fa-check" aria-hidden="true"></i> Checkout</button></a>

                                    </center>
                                    </td>
                                </tr>
                                @endif
                            @endforeach
                            </tbody>
                        </table>
                        <div class="pagination-wrapper"> {!! $schedules->appends(['search' => Request::get('search')])->render() !!} </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </section>
@endsection
