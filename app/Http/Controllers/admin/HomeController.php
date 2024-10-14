<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    //will show the admin dashboard
    public function index(){

        $totalOrders=Order::where('status','!=','canceled')->count();
        $totalProcduts=Product::count();
        $totalUsers=User::where('role',1)->count();
        $totalRevenue=Order::where('status','!=','canceled')->sum('grand_total');

        //this month revenue
        $startOfMonth=Carbon::now()->startOfMonth()->format('Y-m-d');
        $currentDate=Carbon::now()->format('Y-m-d');

        $totalRevenueThisMonth=Order::where('status','!=','canceled')->whereBetween('created_at',[$startOfMonth,$currentDate])->sum('grand_total');

        //last month revenue
        $startOfLastMonth=Carbon::now()->subMonth()->startOfMonth()->format('Y-m-d');
        $endOfLastMonth=Carbon::now()->subMonth()->endOfMonth()->format('Y-m-d');
        $lastMonthName=Carbon::now()->subMonth()->format('F');

        $totalRevenueLastMonth=Order::where('status','!=','canceled')->whereBetween('created_at',[$startOfLastMonth,$endOfLastMonth])->sum('grand_total');

        //last 30 days revenue
        $totalRevenueLast30Days=Order::where('status','!=','canceled')->whereBetween('created_at',[Carbon::now()->subDays(30),Carbon::now()])->sum('grand_total');

        return view('admin.dashboard',compact('totalOrders','totalProcduts','totalUsers','lastMonthName',
                    'totalRevenue','totalRevenueThisMonth','totalRevenueLastMonth','totalRevenueLast30Days'));
    }

    //it will logout admin
    public function logout(){
        $admin=Auth::guard('admin')->logout();
        return redirect()->route('admin.login');
    }
}
