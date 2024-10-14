<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PageController extends Controller
{
    public function index(Request $request){

        $pages=Page::latest();

        if($request->get('keyword')){
            $brands = $pages->where('name', 'like', '%' . $request->keyword.'%');
        }

        $pages=$pages->paginate(5);
        return view('admin.pages.list',compact('pages'));
    }

    public function create(){

        return view('admin.pages.create');
    }

    public function store(Request $request){

        $validator=Validator::make($request->all(),[
            'name'=>'required',
            'slug'=> 'required|unique:pages',
        ]);

        if($validator->passes()){
            $page=new Page();
            $page->name=$request->name;
            $page->slug=$request->slug;
            $page->content=$request->content;
            $page->save();

            session()->flash('success','Page Created Successfully');
            return response()->json([
                'status'=>true,
                'message'=>'Page Created Successfully',
            ]);
        }else{
            return response()->json([
                'status'=>false,
                'errors'=>$validator->errors()
            ]);
        }
    }

    public function edit($id,Request $request){

        $page=Page::find($id);
        return view('admin.pages.edit',compact('page'));
    }

    public function update(Request $request,$id){

        $page=Page::find($id);

        if($page==null){

            session()->flash('error','Page Not Found');
            return response()->json([
                'status'=>true,
                'message'=>'Page Not Found',
            ]);
        }
        $validator=Validator::make($request->all(),[
            'name'=>'required',
            'slug'=>'required|unique:pages,slug,'.$page->id.'id',
        ]);

        if($validator->passes()){
            $page->name=$request->name;
            $page->slug=$request->slug;
            $page->content=$request->content;
            $page->save();

            session()->flash('success','Page Updated Successfully');
            return response()->json([
                'status'=>true,
                'message'=>'Page Updated Successfully',
            ]);
        }else{
            return response()->json([
                'status'=>false,
                'errors'=>$validator->errors()
            ]);
        }
    }

    public function destroy($id,Request $request){

        $page=Page::find($id);

        if($page==null){

            session()->flash('error','Page Not Found');
            return response()->json([
                'status'=>true,
                'message'=>'Page Not Found',
            ]);
        }

        $page->delete();

        session()->flash('success','Page Deleted Successfully');
        return response()->json([
            'status'=>true,
            'message'=>'Page Deleted Successfully',
        ]);
    }
}
