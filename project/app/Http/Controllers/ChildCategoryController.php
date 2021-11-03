<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\ImageManagerStatic as Image;

class ChildCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth',['except' => 'childcats']);
    }

    public function index()
    {
        $child = Category::where('role','child')->get();
        $subs = Category::where('role','sub')->get();
        $categories = Category::where('role','main')->get();
        return view('admin.categories',compact('categories','subs','child'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::where('role','main')->get();
        return view('admin.childcategoryadd',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'slug' => 'required|max:255|unique:categories',
        ]);

        if ($validator->passes()) {
            $category = new Category;
            $category->fill($request->all());
            $category['role'] = "child";
            if ($request->featured == 1){
                $category->featured = 1;
            }else{
                $category->featured = 0;
            }
            if ($file = $request->file('fimage')){
                $photo_name = time().$request->file('fimage')->getClientOriginalName();
                $large_image_path = 'assets/images/categories/banner/'.$photo_name;
                $small_image_path = 'assets/images/categories/small/'.$photo_name;
                Image::make($file)->resize(1280,660)->save($large_image_path);
                Image::make($file)->resize(320,150)->save($small_image_path);
                $category['feature_image'] = $photo_name;
            }
            $category->save();
            Session::flash('message', 'New Child Category Added Successfully.');
            return redirect('admin/categories');
        }
        return redirect()->back()->with('message', 'Category Slug Must Be Unique.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category = Category::findOrFail($id);
        $categories = Category::where('role','main')->get();
        $subcats = Category::where('mainid',$category->mainid->id)->where('role','sub')->get();
        return view('admin.childcategoryedit',compact('categories','category','subcats'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(),[
            'slug' => 'required|max:255|unique:categories,slug,'.$id
        ]);

        if ($validator->passes()) {
            $category = Category::findOrFail($id);
            $input = $request->all();

            if ($file = $request->file('fimage')){
                $photo_name = time().$request->file('fimage')->getClientOriginalName();
                $large_image_path = 'assets/images/categories/banner/'.$photo_name;
                $small_image_path = 'assets/images/categories/small/'.$photo_name;
                Image::make($file)->resize(1280,660)->save($large_image_path);
                Image::make($file)->resize(320,150)->save($small_image_path);
                $input['feature_image'] = $photo_name;
            }
            if ($request->featured == 1){
                $input['featured'] = 1;
            }else{
                $input['featured'] = 0;
            }
            $category->update($input);
            Session::flash('message', 'Child Category Updated Successfully.');
            return redirect('admin/categories');
        }
        return redirect()->back()->with('message', 'Category Slug Must Be Unique.');
    }

    public function childcats($id)
    {
        $childcats = Category::where('subid', $id)->where('role', 'child')->get();
        return response()->json(['response' => $childcats]);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::findOrFail($id);
        $category->delete();
        Session::flash('message', 'Child Category Deleted Successfully.');
        return redirect('admin/categories');
    }
}
