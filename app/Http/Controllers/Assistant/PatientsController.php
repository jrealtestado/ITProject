<?php

namespace App\Http\Controllers\Assistant;

use App\Http\Controllers\Controller;
use App\Http\Requests;

use Illuminate\Http\Request;
use App\Patient;
use App\Schedule;
use App\Teeth;

class PatientsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $patients = Patient::all()->where('patStatus', 'Active');
        $schedules = Schedule::all();
        $counter = 0;
        return view('Assistant.Patient.patient')
        ->with('patients', $patients)
        ->with('schedules', $schedules);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view ('Assistant.Patient.createPatient');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'address' => 'required',
            'occupation' => 'required',
            'patientTelNo' => 'required',
            'status' => 'required',
            'birthdate' => 'required',
            'age' => 'required',
            'sex' => 'required',
            'medConditions',
            'allergies',
            'patStatus' => 'required',
        ]);

        $patient = new Patient;
        $patient->name = $request->input('name');
        $patient->address = $request->input('address');
        $patient->occupation = $request->input('occupation');
        $patient->patientTelNo = $request->input('patientTelNo');
        $patient->status = $request->input('status');
        $patient->birthdate = $request->input('birthdate');
        $patient->age = $request->input('age');
        $patient->sex = $request->input('sex');
        $patient->medConditions = $request->input('medConditions');
        $patient->allergies = $request->input('allergies');
        $patient->patStatus = $request->input('patStatus');
        $patient->save();
        return redirect('assistant/patient')->with('success', 'Patient Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($patID)
    {
       $patient = Patient::find($patID);
       return view('Assistant.Patient.showPatient')->with('patient', $patient); 
    }  //
        /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($patID)
    {
        $patient = Patient::find($patID);
        return view('Assistant.Patient.editPatient')->with('patient', $patient);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $patID)
    {
        $this->validate($request, [
            'name' => 'required',
            'address' => 'required',
            'occupation' => 'required',
            'patientTelNo' => 'required',
            'status' => 'required',
            'birthDate' => 'required',
            'age' => 'required',
            'sex' => 'required',
            'medconditions',
            'allergies',
            'patStatus' => 'required',
        ]);

        $patient = Patient::find($patID);
        $patient->name = $request->input('name');
        $patient->address = $request->input('address');
        $patient->occupation = $request->input('occupation');
        $patient->patientTelNo = $request->input('patientTelNo');
        $patient->status = $request->input('status');
        $patient->birthDate = $request->input('birthDate');
        $patient->age = $request->input('age');
        $patient->sex = $request->input('sex');
        $patient->medconditions = $request->input('medconditions');
        $patient->allergies = $request->input('allergies');
        $patient->patStatus = $request->input('patStatus');
        $patient->save();

        return redirect('assistant/patient')
        ->with('success', 'Patient Information Updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($patID)
    {
        $patient = Patient::find($patID);
        $patient->patStatus = "Inactive";
        $patient->save();

        return redirect('assistant/patient')->with('success', 'Patient Information Updated');
    }

    public function teethHistory($patID)
    {
        $teeth = Teeth::all();
        $patient = Patient::find($patID);
        return view('Assistant.Patient.patientTeethHistory')->with('patient', $patient)->with('teeth', $teeth);
    }
}
