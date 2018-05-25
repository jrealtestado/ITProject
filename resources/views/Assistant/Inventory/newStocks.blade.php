@extends('layouts.assistantLayout')

@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1><i class="fa fa-truck"></i> Delivery</h1>
	<ol class="breadcrumb">
	<li><a href="{{ url('/assistant') }}"><i class="fa fa-dashboard"></i> Home</a></li>
	<li class="active">Inventory</li>
	</ol>
	<hr>
</section>


<!-- Main content -->
<section class="content">
	<div class="row">
	<div class="col-xs-12">
		<div class="box">
            <div class="box-header">
                <h3>Items</h3>
            </div>
            <div class="box-body">
                
                <div class="form-group">
                    
                </div>
    
            </div>
            <div class="box-footer">
                <a class="btn btn-success" href="{{ url('/#') }}">Add Item</a>
                <a class="btn btn-default" href="{{ url('/#') }}">Back</a>
            </div>
		</div>
		<!-- /.box -->
	</div>
	<!-- /.col -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

@endsection

