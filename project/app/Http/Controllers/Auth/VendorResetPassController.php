<?php

namespace App\Http\Controllers\Auth;

use App\UserProfile;
use App\Vendors;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class VendorResetPassController extends Controller
{
    //Show Forgot Password Form
    public function showForgotForm(){
        return view('forgotvendor');
    }

    //Reset Users Profile Password
    public function resetPass(Request $request){

        if (Vendors::where('email', '=', $request->email)->count() > 0) {
            // user found
            $user = Vendors::where('email', '=', $request->email)->firstOrFail();
            $autopass = str_random(8);
            $input['password'] = Hash::make($autopass);

            $user->update($input);
            $subject = "Reset Password Request";
            $msg = "Your New Password is : ".$autopass;

            mail($request->email,$subject,$msg);
            Session::flash('success', 'Your Password Reseted Successfully. Please Check your email for new Password.');
            return redirect(route('vendor.forgotpass'));

        }else{
            // user not found
            Session::flash('error', 'No Account Found With This Email.');
            return redirect(route('vendor.forgotpass'));
        }
    }




}
