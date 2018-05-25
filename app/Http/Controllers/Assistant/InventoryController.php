<?php

namespace App\Http\Controllers\Assistant;

use App\Http\Controllers\Controller;
use App\Http\Requests;

use Illuminate\Http\Request;
use App\Inventory;
use App\Stock;

class InventoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $inventory = Inventory::all()->where('status', 'Active');
        return view('Assistant.Inventory.inventory')->with('inventory', $inventory);
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view ('Assistant.Inventory.createNewInventory');
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
            'invName' => 'required',
            'quantity' => 'required',
            'low_stock_quantity' => 'required',
            'unit' => 'required',
        ]);

        $inventory = new Inventory;
        $inventory->invName = $request->input('invName');
        $inventory->quantity = $request->input('quantity');
        $inventory->low_stock_quantity = $request->input('low_stock_quantity');
        $inventory->unit = $request->input('unit');

        if($inventory->quantity <= $inventory->low_stock_quantity){
            $inventory->invStatus = "Low in Stock";
        }
        else if($inventory->quantity >= $inventory->low_stock_quantity){
            $inventory->invStatus = "Good";
        }
        else {
            $inventory->invStatus = "Out of Stock";
        }
        $inventory->status = 'Active';
        $inventory->save();

        return redirect('assistant/inventory')->with('success', 'New Inventory Created');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($invID)
    {
       $inventory = Inventory::find($invID);
       $items = Stock::all()->where('invID', $invID);

       return view('Assistant.Inventory.showInventory')
            ->with('inventory', $inventory)
            ->with('items', $items); 
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($invID)
    {
        $inventory = Inventory::find($invID);
        return view('Assistant.Inventory.editInventory')->with('inventory', $inventory);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    
    public function update(Request $request, $invID)
    {
        $this->validate($request, [
            'invName' => 'required',
            'quantity' => 'required',
            'additional',
            'low_stock_quantity',
            'unit' => 'required'
        ]);
        
        $inventory = Inventory::find($invID);
        $inventory->invName = $request->input('invName');
        $inventory->quantity = $request->input('quantity');
        $inventory->low_stock_quantity = $request->input('low_stock_quantity');
        $inventory->unit = $request->input('unit');

        if($inventory->quantity == 0){
            $inventory->invStatus = "Out of Stock";            
        }
        else if($inventory->quantity >= $inventory->low_stock_quantity){
            $inventory->invStatus = "Good";
        }
        else if($inventory->quantity <= $inventory->low_stock_quantity){
            $inventory->invStatus = "Low in Stock";
        }

        $inventory->save();

        // $stock = new Stock;
        // $stock->invID = $invID;
        // $stock->patID = 0;
        // $stock->quantity = $additional;
        // $stock->historyStatus = 'Added';

        // $stock->save();

        $inventoryList = Inventory::all()->where('status', 'Active');
        return redirect('assistant/inventory')
            ->with('inventory', $inventoryList)
            ->with('success', 'Inventory Information Updated');
    }

    public function add($invID)
    {
        $inventory = Inventory::find($invID);
        return view('Assistant.Inventory.addInventory')->with('inventory', $inventory);
    }
    
    public function added(Request $request, $invID)
    {
        $this->validate($request, [
            'invName' => 'required',
            'quantity' => 'required',
            'additional',
            'low_stock_quantity',
            'unit' => 'required'
        ]);
        
        $inventory = Inventory::find($invID);
        $inventory->invName = $request->input('invName');
        $additional = $request->input('additional');
        $inventory->quantity = $request->input('quantity');
        $inventory->low_stock_quantity = $request->input('low_stock_quantity');
        $inventory->unit = $request->input('unit');
        $inventory->quantity = $inventory->quantity + $additional;

        if($inventory->quantity == 0){
            $inventory->invStatus = "Out of Stock";            
        }
        else if($inventory->quantity >= $inventory->low_stock_quantity){
            $inventory->invStatus = "Good";
        }
        else if($inventory->quantity <= $inventory->low_stock_quantity){
            $inventory->invStatus = "Low in Stock";
        }

        $inventory->save();

        $stock = new Stock;
        $stock->invID = $invID;
        $stock->patID = 0;
        $stock->quantity = $additional;
        $stock->historyStatus = 'Added';

        $stock->save();

        $inventoryList = Inventory::all()->where('status', 'Active');
        return redirect('assistant/inventory')
            ->with('inventory', $inventoryList)
            ->with('success', 'Inventory Information Updated');
    }

    public function minus($invID)
    {
        $inventory = Inventory::find($invID);
        return view('Assistant.Inventory.reduceInventory')->with('inventory', $inventory);
    }

    public function reduce(Request $request, $invID)
    {
        $this->validate($request, [
            'invName' => 'required',
            'quantity' => 'required',
            'additional',
            'low_stock_quantity',
            'unit' => 'required'
        ]);
        
        $inventory = Inventory::find($invID);
        $inventory->invName = $request->input('invName');
        $deduction = $request->input('deduction');
        $inventory->quantity = $request->input('quantity');
        $inventory->low_stock_quantity = $request->input('low_stock_quantity');
        $inventory->unit = $request->input('unit');
        $inventory->quantity = $inventory->quantity - $deduction;

        if($inventory->quantity == 0){
            $inventory->invStatus = "Out of Stock";            
        }
        else if($inventory->quantity >= $inventory->low_stock_quantity){
            $inventory->invStatus = "Good";
        }
        else if($inventory->quantity <= $inventory->low_stock_quantity){
            $inventory->invStatus = "Low in Stock";
        }

        $inventory->save();

        $stock = new Stock;
        $stock->invID = $invID;
        $stock->patID = 0;
        $stock->quantity = $deduction;
        $stock->historyStatus = 'Reduced';

        $stock->save();

        $inventoryList = Inventory::all()->where('status', 'Active');
        return redirect('assistant/inventory')
            ->with('inventory', $inventoryList)
            ->with('success', 'Inventory Information Updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($invID)
    {
        $inventory = Inventory::find($invID);
        $inventory->status = "Inactive";
        $inventory->save();

        $inventoryList = Inventory::all()->where('status', 'Active');
        return redirect('assistant/inventory')
            ->with('inventory', $inventoryList)
            ->with('success', 'Inventory Information Updated');
    }
}
