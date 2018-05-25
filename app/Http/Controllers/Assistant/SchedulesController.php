<?php

namespace App\Http\Controllers\Assistant;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Schedule;
use Illuminate\Http\Request;

use App\Patient;
use App\Service;
use App\Dentist;
use App\Teeth;

class SchedulesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request)
    {
        $patients = Patient::all();
        $services = Service::all();
        $dentists = Dentist::all();
        
        $perPage = 25;
        $schedules = Schedule::paginate($perPage);
        // dd($schedules);
        return view('Assistant.schedules.index', compact('schedules'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        $services = Service::all();
        $dentists = Dentist::all();
        $patients = Patient::all();
        $teeth = Teeth::all();

        return view('Assistant.schedules.create')
        ->with('services', $services)
        ->with('dentists', $dentists)
        ->with('teeth', $teeth)
        // ->with('balance', $balance)
        ->with('patients', $patients);
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function store(Request $request)
    {
        $this->validate($request, [
			'date' => 'required',
			'timeFrom' => 'required',
            'timeTo' => 'required',
            'opStatus',
            'dentID',
            'servID',
            'teethID',
            'patID',
            'teethID'
            
        ]);
        
        $requestData = $request->all();
        Schedule::create($requestData);
        
        // dd($requestData);
        return redirect('assistant/schedules')->with('flash_message', 'Schedule added!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $schedID
     *
     * @return \Illuminate\View\View
     */
    public function show($schedId)
    {
        $patients = Patient::all();
        $services = Service::all();
        $dentists = Dentist::all();   
        $schedule = Schedule::findOrFail($schedId);
        // dd();
        return view('Assistant.schedules.show', compact('schedule'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     *
     * @return \Illuminate\View\View
     */
    public function edit($schedId)
    {
        $services = Service::all();
        $dentists = Dentist::all();
        $schedule = Schedule::find($schedId);
        return view('Assistant.schedules.edit', compact('schedule'))
        ->with('services',$services)
        ->with('dentists',$dentists);
    }

    public function view($schedId)
    {
        $services = Service::all();
        $dentists = Dentist::all();
        $patients = Patient::all();
        $teeth = Teeth::all();
        $schedule = Schedule::find($schedId);
        return view('Assistant.schedules.schedule', compact('schedule'))
        ->with('services',$services)
        ->with('teeth', $teeth)
        ->with('patients', $patients)
        ->with('dentists',$dentists);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param  int  $id
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function update(Request $request, $schedId)
    {
        $this->validate($request, [
			'date' => 'required',
			'timeFrom' => 'required',
            'timeTo' => 'required',
            'opStatus',
            'dentID',
            'servID',
            'patID',
            'teethID'
		]);
        $requestData = $request->all();
        
        $schedule = Schedule::findOrFail($schedId);
        $patID = $schedule->patient->patID;
        $patients = Patient::find($patID);

        // $paymentID = $schedule->payment->paymentID;
        // $payments = Payment::find($paymentID);
        

        $balance = $patients->balance;
        $servPrice = $schedule->service->price;
        $payment = $request->input('payment');
        $total = $servPrice - $payment;
        $newBalance = $total + $balance;
   


        $patients->balance = $newBalance;
        $patients->save();

        // $schedule->timeTo = 
        // $schedule->timeFrom =
        // $schedule->servID = 
        $schedule->update($requestData);

        // dd($payment);

        return redirect('assistant/schedules')->with('flash_message', 'Schedule updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    // public function destroy($schedId)
    // {
        
    //     $item = Schedule::find($schedId);

    //     $item->delete();

    //     return redirect('assistant/schedules')->with('flash_message', 'Schedule deleted!');
    // }

    public function destroy($opStatus)
    {
        $item = Schedule::find($opStatus);
        $item->opStatus = "Done";
        $item->save();

        return redirect('assistant/schedules')->with('success', 'Schedule Successfully Marked as Done !');
    }

    
}
