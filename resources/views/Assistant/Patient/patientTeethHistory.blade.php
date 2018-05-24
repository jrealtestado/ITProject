@extends('layouts.assistantLayout')
@section('content')
<section class="content-header">
    <h1>
       {{$patient->name}}
    </h1>
    <ol class="breadcrumb">
       <li><a href={{ url('/assistant') }}><i class="fa fa-dashboard"></i> Home</a></li>
       <li><a href="{{ url('/assistant/patient') }}">Records</a></li>
       <li><a href="">History</a></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Patient Teeth Operation History</h3>
                </div>
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td><center><button class="btn btn-primary">18</button></td>
                                    <td><center><button class="btn btn-primary">17</button></td>
                                    <td><center><button class="btn btn-primary">16</button></td>
                                    <td><center><button class="btn btn-primary">15</button></td>
                                    <td><center><button class="btn btn-primary">14</button></td>
                                    <td><center><button class="btn btn-primary">13</button></td>
                                    <td><center><button class="btn btn-primary">12</button></td>
                                    <td><center><button class="btn btn-primary">11</button></td>
                                    <td><center><button class="btn btn-primary">21</button></td>
                                    <td><center><button class="btn btn-primary">22</button></td>
                                    <td><center><button class="btn btn-primary">23</button></td>
                                    <td><center><button class="btn btn-primary">24</button></td>
                                    <td><center><button class="btn btn-primary">25</button></td>
                                    <td><center><button class="btn btn-primary">26</button></td>
                                    <td><center><button class="btn btn-primary">27</button></td>
                                    <td><center><button class="btn btn-primary">28</button></td>
                                </tr>
                                <tr>
                                    <td><center><button class="btn btn-primary">38</button></td>
                                    <td><center><button class="btn btn-primary">37</button></td>
                                    <td><center><button class="btn btn-primary">36</button></td>
                                    <td><center><button class="btn btn-primary">35</button></td>
                                    <td><center><button class="btn btn-primary">34</button></td>
                                    <td><center><button class="btn btn-primary">33</button></td>
                                    <td><center><button class="btn btn-primary">32</button></td>
                                    <td><center><button class="btn btn-primary">31</button></td>
                                    <td><center><button class="btn btn-primary">41</button></td>
                                    <td><center><button class="btn btn-primary">42</button></td>
                                    <td><center><button class="btn btn-primary">43</button></td>
                                    <td><center><button class="btn btn-primary">44</button></td>
                                    <td><center><button class="btn btn-primary">45</button></td>
                                    <td><center><button class="btn btn-primary">46</button></td>
                                    <td><center><button class="btn btn-primary">47</button></td>
                                    <td><center><button class="btn btn-primary">48</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>    
@endsection