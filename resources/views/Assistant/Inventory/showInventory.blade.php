@extends('layouts.assistantLayout')

@section('content')


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        {{$inventory->invName}}
      </h1>
      <ol class="breadcrumb">
        <li><a href="{{ url('/assistant') }}"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="{{ url('/assistant/inventory') }}">Inventory</a></li>
        <li>Inventory Information</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Inventory Information</h3>
              <div class="pull-right">
                <a href="{{ url('assistant/inventory/' . $inventory->invID . '/edit') }}" title="Edit Schedule"><button class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</button></a>
                <a href="{{ url('/assistant/inventory') }}" class="btn btn-default">Back</a>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tbody>
                  <tr>
                      <td>Name :</td>
                      <td>{{$inventory->invName}}</td>
                  </tr>
                  <tr>
                    <td>Quantity :</td>
                    <td>{{$inventory->quantity}}</td>
                  </tr>
                  <tr>
                    <td>Low Stock Quantity :</td>
                    <td>{{$inventory->low_stock_quantity}}</td>
                  </tr>
                  <tr>
                      <td>Unit :</td>
                    <td>{{$inventory->unit}}</td>
                  </tr>
                  <tr>
                    <td>Inventory Status</td>
                    <td>{{$inventory->invStatus}}</td>
                  </tr>
                  <tr>
                    <td>Status :</td>
                    <td>{{$inventory->status}}</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              
            </div>
          </div>
          <!-- /.box -->
        </div>
      </div>

      <div class="row">
          <div class="col-md-12">
            <div class="box">
              <div class="box-header with-border">
                <h3 class="box-title">Item History</h3>
              </div>
              <!-- /.box-header -->
              <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                      <th>Date</th>
                      <th>Quantity</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                      @if(count($items) > 0)
                      @foreach($items as $item)
                        {{-- @if($item->historyStatus == 'Added')   --}}
                          <tr>
                            <td>{{$item->created_at->format('F d, Y h:i a')}}</td>
                            <td>{{$item->quantity}}</td>
                          @if($item->historyStatus == 'Added')  
                            <td class="text-primary">{{$item->historyStatus}}</td>
                          </tr>
                          @else
                            <td class="text-danger">{{$item->historyStatus}}</td>
                          @endif
                      @endforeach
                      @else
                      <p>No Inventory Found</p>
                      @endif
                  </tbody>
                  <tfoot>
                    <tr>
                      <td>Date</td>
                      <td>Quantity</td>
                    </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                
              </div>
            </div>
            <!-- /.box -->
          </div>
          {{-- <div class="col-md-6">
              <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">Reduced Dates</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  <table id="ex" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>Date</th>
                        <th>Quantity</th>
                      </tr>
                    </thead>
                    <tbody>
                        @if(count($items) > 0)
                        @foreach($items as $item)
                          @if($item->historyStatus == 'Reduced')  
                            <tr>
                              <td>{{$item->created_at}}</td>
                              <td>{{$item->quantity}}</td>
                            </tr>
                          @else
                          @endif  
                        @endforeach
                        @else
                        <p>No Inventory Found</p>
                        @endif
                    </tbody>
                    <tfoot>
                      <tr>
                        <td>Date</td>
                        <td>Quantity</td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                  
                </div>
              </div>
              <!-- /.box -->
            </div> --}}
        </div>
    </section>
    <!-- /.content -->
@endsection


