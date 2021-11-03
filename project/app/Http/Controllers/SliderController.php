<?php

namespace App\Http\Controllers;

use App\Slider;
use Illuminate\Http\Request;
use Intervention\Image\ImageManagerStatic as Image;


class SliderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $sliders = Slider::all();
        return view('admin.sliderlist',compact('sliders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.slideradd');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $slider = new Slider();
        $slider->fill($request->all());

        if ($file = $request->file('image')){
            $photo_name = str_random(3).$request->file('image')->getClientOriginalName();
            $large_image_path = 'assets/images/sliders/large/'.$photo_name;
            $small_image_path = 'assets/images/sliders/small/'.$photo_name;
            

            Image::make($file)->resize(1343,600)->save($large_image_path);
            Image::make($file)->resize(300,115)->save($small_image_path);

            $slider['image'] = $photo_name;
            
        }
        $slider->save();
        return redirect('admin/sliders')->with('message','Slider Added Successfully.');
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
        $slider = Slider::findOrFail($id);
        return view('admin.slideredit',compact('slider'));
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
        $slider = Slider::findOrFail($id);
        $data = $request->all();

        if ($file = $request->file('image')){
            $photo_name = str_random(3).$request->file('image')->getClientOriginalName();
            $large_image_path = 'assets/images/sliders/large/'.$photo_name;
            $small_image_path = 'assets/images/sliders/small/'.$photo_name;
            

            Image::make($file)->resize(1343,600)->save($large_image_path);
            Image::make($file)->resize(300,115)->save($small_image_path);
            $data['image'] = $photo_name;
        }
        $slider->update($data);
        return redirect('admin/sliders')->with('message','Slider Updated Successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $slider = Slider::findOrFail($id);
        $slider->delete();
        return redirect('admin/sliders')->with('message','Slider Delete Successfully.');
    }
}
