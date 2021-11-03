<?php

namespace App\Http\Controllers;

use App\Category;
use App\Gallery;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Intervention\Image\ImageManagerStatic as Image;

class ProductController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::orderBy('id','desc')->get();
        return view('admin.productlist',compact('products'));
    }

//    public function pending()
//    {
//        $products = Product::where('status','2')->where('approved','no')->orderBy('id','desc')->get();
//        return view('admin.pendingproduct',compact('products'));
//    }
//
//    public function pendingdetails($id)
//    {
//        $product = Product::findOrFail($id);
//        return view('admin.pendingdetails',compact('product'));
//    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::where('role','main')->get();
        return view('admin.productadd',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = new Product();
        $data->fill($request->all());
        $data->category = $request->mainid.",".$request->subid.",".$request->childid;

        if ($file = $request->file('photo')){
            $photo_name = time().$request->file('photo')->getClientOriginalName();
            $large_image_path = 'assets/images/products/large/'.$photo_name;
            $medium_image_path = 'assets/images/products/medium/'.$photo_name;
            $small_image_path = 'assets/images/products/small/'.$photo_name;
            

            Image::make($file)->resize(1000,550)->save($large_image_path);
            Image::make($file)->resize(800,533)->save($medium_image_path);
            Image::make($file)->resize(300,115)->save($small_image_path);
            $data['feature_image'] = $photo_name;
        }

        if ($request->featured == 1){
            $data->featured = 1;
        }
        $data->startDate=$request->startDate;
        $data->endDate=$request->endDate;

        if ($request->pallow == ""){
            $data->sizes = null;
        }

        $data->save();
        $lastid = $data->id;

        if ($files = $request->file('gallery')){
            foreach ($files as $file){
                $gallery = new Gallery;
                $image_name = str_random(2).time().$file->getClientOriginalName();
                $large_image_path = 'assets/images/gallery/large/'.$image_name;
                
                $small_image_path = 'assets/images/gallery/small/'.$image_name;
                Image::make($file)->resize(1000,550)->save($small_image_path);
                Image::make($file)->resize(250,100)->save($large_image_path);
                
                $gallery['image'] = $image_name;
                $gallery['productid'] = $lastid;
                $gallery->save();
            }
        }
        Session::flash('message', 'New Product Added Successfully.');
        return redirect('admin/products');
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
        $product = Product::findOrFail($id);
        $child = Category::where('role','child')->where('subid',$product->category[1])->get();
        $subs = Category::where('role','sub')->where('mainid',$product->category[0])->get();
        $categories = Category::where('role','main')->get();
        return view('admin.productedit',compact('product','categories','child','subs'));
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
        $product = Product::findOrFail($id);
        $input = $request->all();
        // my code
        $product->startDate=$input['startDate'];
        $product->endDate=$input['endDate'];
        $input['category'] = $request->mainid.",".$request->subid.",".$request->childid;

        if ($file = $request->file('photo')){
            $photo_name = time().$request->file('photo')->getClientOriginalName();
            $large_image_path = 'assets/images/products/large/'.$photo_name;
            $medium_image_path = 'assets/images/products/medium/'.$photo_name;
            $small_image_path = 'assets/images/products/small/'.$photo_name;
            

            Image::make($file)->resize(1000,550)->save($large_image_path);
            Image::make($file)->resize(800,533)->save($medium_image_path);
            Image::make($file)->resize(300,115)->save($small_image_path);
            $input['feature_image'] = $photo_name;
        }
        
        if ($request->galdel == 1){
            $gal = Gallery::where('productid',$id);
            $gal->delete();
        }


        if ($request->pallow == ""){
            $input['sizes'] = null;
        }

        if ($request->featured == 1){
            $input['featured'] = 1;
        }else{
            $input['featured'] = 0;
        }

        $product->update($input);

        if ($files = $request->file('gallery')){
            foreach ($files as $file){
                $gallery = new Gallery;
                $image_name = str_random(2).time().$file->getClientOriginalName();

                $large_image_path = 'assets/images/gallery/large/'.$image_name;
                $small_image_path = 'assets/images/gallery/small/'.$image_name;
                Image::make($file)->resize(1000,550)->save($small_image_path);
                Image::make($file)->resize(250,100)->save($large_image_path);
                
                $gallery['image'] = $image_name;
                $gallery['productid'] = $id;
                $gallery->save();
            }
        }

        Session::flash('message', 'Product Updated Successfully.');
        return redirect('admin/products');
    }

    public function status($id , $status)
    {
        $product = Product::findOrFail($id);
        $input['status'] = $status;

        $product->update($input);
        Session::flash('message', 'Product Status Updated Successfully.');
        return redirect('admin/products');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        unlink('assets/images/products/large/'.$product->feature_image);
        unlink('assets/images/products/medium/'.$product->feature_image);
        unlink('assets/images/products/small/'.$product->feature_image);
        $product->delete();
        return redirect('admin/products')->with('message','Product Delete Successfully.');
    }
}
