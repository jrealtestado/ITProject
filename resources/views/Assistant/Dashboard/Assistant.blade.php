@extends('layouts.assistantLayout')

@section('content')
<body class="hold-transition skin-blue sidebar-mini">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Dashboard
                    <small>Control panel</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/admin"><i class="fa fa-dashboard"></i> Home</a></li>
                </ol>
            </section>
            <!-- Main content -->
            <section class="content">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3>{{$pCount}}</h3>
                                <p>Total Patients</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person"></i>
                            </div>
                            <a href="#" class="small-box-footer"></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3>{{$sCountToday}}<sup style="font-size: 20px"></sup></h3>
                                <p>Patients today</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person"></i>
                            </div>
                            <a href="#" class="small-box-footer"></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-yellow">
                            <div class="inner">
                                <h3>{{$sCount}}</h3>
                                <p>Scheduled Patients</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="#" class="small-box-footer"></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                            <div class="inner">
                                <h3>{{$fSched}}</h3>
                                <p>Patients Remaining Today</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="#" class="small-box-footer"></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->
                <!-- Main row -->
                <div class="row">
                    <!-- Left col -->
                    <section class="col-lg-7 connectedSortable">               
                        <!-- /.nav-tabs-custom -->
                        <!-- /.box (chat box) -->
                        <!-- Appointments for the day -->
                        <div class="box box-primary">
                            <div class="box-header">
                                <i class="ion ion-clipboard"></i>
                                <h3 class="box-title">Appointments for the day</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
                                <div class="box">
                                    <div class="box-header">
                                </div>
                                        <!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example2" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Time From</th>
                                                    <th>Time To</th>
                                                    <th>Operation</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @if($sCountToday > 0)
                                                    @foreach($schedules as $schedule)
                                                        @if($schedule->date == $today)
                                                            <tr>
                                                                <td>{{$schedule->patient->name}}</td>
                                                                <td>{{$schedule->timeFrom}}</td>
                                                                <td>{{$schedule->timeTo}}</td>
                                                                <td>{{$schedule->service->servName}}</td>
                                                                <td>{{$schedule->opStatus}}</td>
                                                            </tr>
                                                        @endif
                                                    @endforeach
                                                @else
                                                    <p>No Patients Scheduled for Today</p>
                                                @endif
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Time From</th>
                                                    <th>Time To</th>
                                                    <th>Operation</th>
                                                    <th>Status</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->

                        


                        <!-- DENTISTS List -->
                        <div class="box box-primary">
                            <div class="box-header">
                                <i class="ion ion-clipboard"></i>
                                <h3 class="box-title">Dentists</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Telephone Number</th>
                                            <th>Patients Today</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php $aptPerDentistT = 0 @endphp
                                        @if(count($dentists) > 1)
                                            @foreach($dentists as $dentist)
                                                @foreach($schedules as $schedule)
                                                    @php $cntr = 0 @endphp
                                                    @if($dentist->dentID == $schedule->dentID) 
                                                        @php $aptPerDentistT++ @endphp
                                                    @endif
                                                @endforeach
                                                <tr>
                                                    <td>{{$dentist->name}}</td>
                                                    <td>{{$dentist->dentTelNo}}</td>
                                                    <td>{{$aptPerDentistT}}</td>
                                                </tr>
                                                @php $aptPerDentistT = 0 @endphp
                                            @endforeach
                                        @else
                                            <p>No Dentist Found</p>
                                        @endif
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
    
                    </section>
                    <!-- /.Left col -->
                    <!-- right col (We are only adding the ID to make the widgets sortable)-->
                    <section class="col-lg-5 connectedSortable">

                        <div class="box box-primary">
                            <div class="box-header">
                                <i class="ion ion-clipboard"></i>
                                <h3 class="box-title">Services Offered</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
                                <div class="box">
                                    <div class="box-header">
                                </div>
                                        <!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Service Name</th>
                                                    <th>Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @if(count($services) > 1)
                                                    @foreach($services as $service)
                                                        <tr>
                                                            <td>{{$service->servName}}</td>
                                                            <td>{{$service->price}}</td>
                                                        </tr>
                                                    @endforeach
                                                @else
                                                    <p>No Services found</p>
                                                @endif
                                            </tbody>
                                        </table>
                                    </div>
                                <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->




                    </section>
                    <!-- right col -->
                </div>
                <!-- /.row (main row) -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <!-- Control Sidebar -->
        <!-- Add the sidebar's background. This div must be placed
            immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>

<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>

@endsection


