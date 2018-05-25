@extends('layouts.assistantLayout')

@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
	Inventory
	</h1>
	<ol class="breadcrumb">
	<li><a href="{{ url('/assistant') }}"><i class="fa fa-dashboard"></i> Home</a></li>
	<li class="active">Inventory</li>
	</ol>
	<hr>
	<a class="btn btn-success" href="{{ url('/assistant/inventory/create') }}"><i class="fa fa-plus"></i> Create new Inventory Item</a>
	<a class="btn btn-primary" href="{{ url('newStocks') }}"><i class="fa fa-truck"></i> Delivery</a>
	<a class="btn btn-danger" href="{{ url('/assistant/inventory/') }}"><i class="fa fa-minus"></i> Usage</a>
</section>


<!-- Main content -->
<section class="content">
	<div class="row">
	<div class="col-xs-12">
		<div class="box">
		<!-- /.box-header -->
		<div class="box-body">
			<table id="example1" class="table table-bordered table-striped">
			<thead>
			<tr>
				<th>Name</th>
				<th>Quantity</th>
				<th>Unit</th>
				<th>Inventory Status</th>
				<th style="width: 40%">Options</th>
			</tr>
			</thead>
			<tbody>
				@if(count($inventory) > 0)
				@foreach($inventory as $item)
				<tr>
					<td>{{$item->invName}}</td>
					<td>{{$item->quantity}}</td>
					<td>{{$item->unit}}</td>
					<td>{{$item->invStatus}}</td>
					<td>
						<a href="{{ url('assistant/inventory/' . $item->invID . '/add') }}" title="View Schedule"><button class="btn btn-success"><i class="fa fa-plus" aria-hidden="true"></i>  Add</button></a>
						<a href="{{ url('assistant/inventory/' . $item->invID) }}" title="View Schedule"><button class="btn btn-info "><i class="fa fa-eye" aria-hidden="true"></i>  View</button></a>
						<a href="{{ url('assistant/inventory/' . $item->invID . '/minus') }}" title="Edit Schedule"><button class="btn btn-primary"><i class="fa fa-minus" aria-hidden="true"></i> Usage</button></a>					
						{!! Form::open(['action' => ['Assistant\InventoryController@destroy', $item->invID], 'method' => 'POST', 'style' => 'display:inline']) !!}
							{{Form::hidden('_method', 'DELETE')}}			
							<button class="btn btn-danger" type="submit" style="margin: 2px, display:inline"><i class="fa fa-trash"></i> Deactivate</button>
						{!! Form::close() !!}
					</td>
				</tr>
				@endforeach
				@else
				<p>No Inventory Found</p>
				@endif
			</tbody>
			<tfoot>
			<tr>
				<th>Name</th>
				<th>Quantity</th>
				<th>Unit</th>
				<th>Inventory Status</th>
				<th>Options</th>
			</tr>
			</tfoot>
			</table>
		</div>
		<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
	<!-- /.col -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

@endsection

