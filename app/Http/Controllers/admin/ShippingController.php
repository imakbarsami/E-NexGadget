<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Country;
use App\Models\ShippingCharge;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ShippingController extends Controller
{
    public function create(){

        $countries=Country::get();
        $shippingCharges=ShippingCharge::select('shipping_charges.*','countries.name')
                            ->leftJoin('countries','countries.id','shipping_charges.country_id')->get();

        return view('admin.shipping.create',['countries'=>$countries,'shippingCharges'=>$shippingCharges]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'country' => 'required',
            'amount' => 'required|numeric'
        ]);

        if ($validator->passes()) {

            $count=ShippingCharge::where('country_id',$request->country)->count();

            if($count>0){
                session()->flash('error','Shipping Already Added');
                return response()->json([
                    'status' => true,
                    'errors' => $validator->errors()
                ]);
            }
            $shipping = new ShippingCharge();
            $shipping->country_id = $request->country;
            $shipping->amount = $request->amount;
            $shipping->save();

            session()->flash('success', 'Shipping Added Successfully');
            return response()->json([
                'status' => true,
                'message' => 'Shipping Added Successfully'
            ]);
        } else {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function edit($id){

        $shippingCharge=ShippingCharge::find($id);
        $countries=Country::get();
        return view('admin.shipping.edit',compact('shippingCharge','countries'));
    }

    public function update($id,Request $request)
    {
        $shipping = ShippingCharge::find($id);
        $validator = Validator::make($request->all(), [
            'country' => 'required',
            'amount' => 'required|numeric'
        ]);

        if ($validator->passes()) {

            if($shipping==null){
                session()->flash('error', 'Shipping Not Found');
                return response()->json([
                    'status' => true,
                ]);
            }
            $shipping->country_id = $request->country;
            $shipping->amount = $request->amount;
            $shipping->save();

            session()->flash('success', 'Shipping Updated Successfully');
            return response()->json([
                'status' => true,
                'message' => 'Shipping Updated Successfully'
            ]);
        } else {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function destroy($id,Request $request){

        $shippingCharge=ShippingCharge::find($id);

        if($shippingCharge==null){
            session()->flash('error', 'Shipping Not Found');
            return response()->json([
                'status' => true,
            ]);
        }

        $shippingCharge->delete();

        session()->flash('success', 'Shipping Deleted Successfully');
            return response()->json([
                'status' => true,
            ]);

    }
}
