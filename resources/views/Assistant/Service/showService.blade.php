@extends('layouts.assistantLayout')

@section('content')
    <section class="content-header">
        <h1>
            Show Service Information
        </h1>
        <ol class="breadcrumb">
            <li><a href="{{ url('/assistant') }}"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class=""><a href="{{ url('/assistant/service') }}">Services</a></li>
            <li class="active">Show</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Show Service</h3>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th>Service Name</th>
                                            <td>{{$service->servName}}</td>
                                        </tr>
                                        <tr>
                                            <th>Service Price</th>
                                            <td>{{$service->price}}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <a href="{{ url('/assistant/service') }}" class="btn btn-default">Back</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

