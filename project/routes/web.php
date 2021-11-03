<?php

use App\UsersModel;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'FrontEndController@index');
Route::get('/about', 'FrontEndController@about');
Route::get('/faq', 'FrontEndController@faq');
Route::get('/contact', 'FrontEndController@contact');
Route::get('/listall', 'FrontEndController@all');
Route::get('/listfeatured', 'FrontEndController@featured');
Route::get('/services/{category}', 'FrontEndController@category');
Route::get('/services/order/{id}', 'FrontEndController@order');
Route::post('/subscribe', 'FrontEndController@subscribe');
Route::post('/profile/email', 'FrontEndController@usermail');
Route::post('/contact/email', 'FrontEndController@contactmail');
Route::get('/profile/{id}/{name}', 'FrontEndController@viewprofile');
Route::get('product/{id}/{title}', 'FrontEndController@productdetails');
Route::get('loadcategory/{slug}/{page}', 'FrontEndController@loadcatproduct');
Route::get('category/{slug}', 'FrontEndController@catproduct');
Route::get('tags/{tag}', 'FrontEndController@tagproduct');
Route::get('/blogs', 'FrontEndController@allblog');
Route::get('/blog/{id}', 'FrontEndController@blogdetails');
Route::get('shop/{id}', 'FrontEndController@vendorproduct');
Route::get('shop/{id}/{name}', 'FrontEndController@vendorproduct');
Route::get('loadvendor/{id}/{page}', 'FrontEndController@loadvendproduct');
Route::get('search/{search}', 'FrontEndController@searchproduct');

Route::get('quick-view/{id}', 'FrontEndController@getProduct');

Route::post('user/review', 'FrontEndController@reviewsubmit')->name('review.submit');

Route::get('/checkout', 'UserProfileController@checkout')->name('user.checkout');

Route::get('user/dashboard', 'UserProfileController@index')->name('user.account');
Route::get('user/account-information', 'UserProfileController@accinfo')->name('user.accinfo');
Route::get('user/account-password', 'UserProfileController@userchangepass')->name('user.accpass');
Route::get('user/orders', 'UserProfileController@userorders')->name('user.orders');
Route::get('user/order/{id}', 'UserProfileController@userorderdetails');
Route::post('user/update/{id}', 'UserProfileController@update')->name('user.update');
Route::post('user/passchange/{id}', 'UserProfileController@passchange')->name('user.passchange');

Route::get('/cart', 'FrontEndController@cart')->name('user.cart');


Route::get('/cartdelete/{id}', 'FrontEndController@cartdelete');
Route::get('/cartupdate', 'FrontEndController@cartupdate');
Route::post('/cartupdate', 'FrontEndController@cartupdate');

Route::get('/admin', function () {
    return view('admin.index');
})->name('admin.login');

Route::get('/vendor', function () {
    return view('vendor.index');
})->name('vendor.login');

Route::get('/login', function () {
    return view('admin.login');
});

Route::get('admin/themecolor', function () {
    return view('admin.themecolor');
});

Auth::routes();


Route::get('/vendor', 'Auth\VendorLoginController@showLoginFrom')->name('vendor.login');
Route::post('/vendor/login', 'Auth\VendorLoginController@login')->name('vendor.login.submit');
Route::get('/vendor/registration', 'Auth\VendorRegistrationController@showRegistrationForm')->name('vendor.reg');
Route::post('/vendor/registration', 'Auth\VendorRegistrationController@register')->name('vendor.reg.submit');


Route::get('/vendor/withdraws', 'VendorController@withdraws');
Route::get('/vendor/withdrawmoney', 'VendorController@withdraw');
Route::post('/vendor/withdrawsubmit', 'VendorController@withdrawsubmit')->name('account.withdraw.submit');;
Route::get('/vendor/dashboard', 'VendorController@index')->name('vendor.dashboard');
Route::get('vendor/products/status/{id}/{status}', 'VendorProductsController@status');
Route::resource('/vendor/products', 'VendorProductsController');


Route::get('/admin/dashboard', 'HomeController@index');
Route::post('/admin/updatecolor', 'SettingsController@themecolor');

Route::post('admin/settings/title', 'SettingsController@title');
Route::post('admin/settings/payment', 'SettingsController@payment');
Route::post('admin/settings/about', 'SettingsController@about');
Route::post('admin/settings/address', 'SettingsController@address');
Route::post('admin/settings/footer', 'SettingsController@footer');
Route::post('admin/settings/logo', 'SettingsController@logo');
Route::post('admin/settings/favicon', 'SettingsController@favicon');
Route::post('admin/settings/pickup', 'SettingsController@pickup');
Route::get('admin/settings/pickup-del/{id}', 'SettingsController@pickdel');
Route::post('admin/settings/background', 'SettingsController@background');
Route::get('admin/language-settings', 'SettingsController@setlanguage');
Route::post('admin/settings/language', 'SettingsController@language');
Route::resource('/admin/settings', 'SettingsController');

Route::resource('/admin/sliders', 'SliderController');

Route::get('/admin/customers/email/{id}', 'CustomerController@email');
Route::post('/admin/customers/emailsend', 'CustomerController@sendemail');
Route::resource('/admin/customers', 'CustomerController');

Route::get('/admin/vendors/accept/{id}', 'VendorsController@accept');
Route::get('/admin/vendors/reject/{id}', 'VendorsController@reject');
Route::get('/admin/vendors/pending', 'VendorsController@pending');
Route::get('/admin/vendors/email/{id}', 'VendorsController@email');
Route::post('/admin/vendors/emailsend', 'VendorsController@sendemail');
Route::resource('/admin/vendors', 'VendorsController');

Route::post('/admin/blog/titles', 'BlogController@titles');
Route::resource('/admin/blog', 'BlogController');

Route::post('/admin/service/titles', 'ServiceSectionController@titles');
Route::resource('/admin/service', 'ServiceSectionController');

Route::post('/admin/testimonial/titles', 'TestimonialController@titles');
Route::resource('/admin/testimonial', 'TestimonialController');


Route::resource('/admin/services', 'ServiceController');
Route::get('/admin/categories/delete/{id}', 'CategoryController@delete');
Route::resource('/admin/categories', 'CategoryController');

Route::get('/subcats/{id}', 'SubCategoryController@subcats');
Route::get('/childcats/{id}', 'ChildCategoryController@childcats');

Route::resource('/admin/subcategory', 'SubCategoryController');
Route::resource('/admin/childcategory', 'ChildCategoryController');

Route::get('admin/brand/add', 'PageSettingsController@addbrand');
Route::get('admin/brand/{id}/delete', 'PageSettingsController@branddelete');
Route::get('admin/brand/{id}/edit', 'PageSettingsController@brandedit');
Route::post('admin/brand/{id}/update', 'PageSettingsController@brandupdate');
Route::post('admin/brand/brandsave', 'PageSettingsController@brandsave');

Route::get('admin/banner/add', 'PageSettingsController@addbanner');
Route::get('admin/banner/{id}/delete', 'PageSettingsController@bannerdelete');
Route::get('admin/banner/{id}/edit', 'PageSettingsController@banneredit');
Route::post('admin/banner/{id}/update', 'PageSettingsController@bannerupdate');
Route::post('admin/banner/save', 'PageSettingsController@bannersave');

Route::get('admin/faq/add', 'PageSettingsController@addfaq');
Route::get('admin/faq/{id}/delete', 'PageSettingsController@faqdelete');
Route::get('admin/faq/{id}/edit', 'PageSettingsController@faqedit');
Route::post('admin/faq/{id}/update', 'PageSettingsController@faqupdate');
Route::post('admin/pagesettings/faqsave', 'PageSettingsController@faqsave');
Route::post('admin/banner/large', 'PageSettingsController@largebanner');

Route::post('admin/pagesettings/about', 'PageSettingsController@about');
Route::post('admin/pagesettings/faq', 'PageSettingsController@faq');
Route::post('admin/pagesettings/contact', 'PageSettingsController@contact');
Route::resource('/admin/pagesettings', 'PageSettingsController');

Route::get('admin/products/pending', 'ProductController@pending');
Route::get('admin/products/pending/{id}', 'ProductController@pendingdetails');
Route::get('admin/products/status/{id}/{status}', 'ProductController@status');
Route::resource('/admin/products', 'ProductController');

Route::get('admin/ads/status/{id}/{status}', 'AdvertiseController@status');

Route::resource('/admin/ads', 'AdvertiseController');
Route::resource('/admin/social', 'SocialLinkController');
Route::resource('/admin/tools', 'SeoToolsController');
Route::get('admin/subscribers/download', 'SubscriberController@download');

Route::resource('/admin/subscribers', 'SubscriberController');
Route::post('/admin/adminpassword/change/{id}', 'AdminProfileController@changepass');
Route::get('/admin/adminpassword', 'AdminProfileController@password');
Route::resource('/admin/adminprofile', 'AdminProfileController');

Route::get('/vendor/vendorpassword', 'VendorProfileController@password');
Route::post('/vendor/vendorpassword/change/{id}', 'VendorProfileController@changepass');
Route::resource('/vendor/vendorprofile', 'VendorProfileController');

Route::get('/admin/withdraws/pending', 'WithdrawController@pendings');
Route::get('/admin/withdraws/accept/{id}', 'WithdrawController@accept');
Route::get('/admin/withdraws/reject/{id}', 'WithdrawController@reject');
Route::resource('/admin/withdraws', 'WithdrawController');

Route::get('/admin/orders/status/{id}/{status}', 'OrderController@status');
Route::get('/admin/orders/email/{id}', 'OrderController@email');
Route::post('/admin/orders/emailsend', 'OrderController@sendemail');
Route::resource('/admin/orders', 'OrderController');

Route::get('/vendor/orders/status/{id}/{status}', 'VendorOrdersController@status');
Route::resource('/vendor/orders', 'VendorOrdersController');

Route::post('/payment', 'PaymentController@store')->name('payment.submit');
Route::get('/payment/cancle', 'PaymentController@paycancle')->name('payment.cancle');
Route::get('/payment/return', 'PaymentController@payreturn')->name('payment.return');
Route::post('/payment/notify', 'PaymentController@notify')->name('payment.notify');

Route::post('/stripe-submit', 'StripeController@store')->name('stripe.submit');

Route::post('/cashondelivery', 'FrontEndController@cashondelivery')->name('cash.submit');
Route::post('/mobile_money', 'FrontEndController@mobilemoney')->name('mobile.submit');
Route::post('/bank_wire', 'FrontEndController@bankwire')->name('bank.submit');

Route::get('/user/login', 'Auth\ProfileLoginController@showLoginFrom')->name('user.login');
Route::post('/user/login', 'Auth\ProfileLoginController@login')->name('user.login.submit');
Route::get('/user/registration', 'Auth\ProfileRegistrationController@showRegistrationForm')->name('user.reg');
Route::post('/user/registration', 'Auth\ProfileRegistrationController@register')->name('user.reg.submit');

Route::get('/user/forgot', 'Auth\ProfileResetPassController@showForgotForm')->name('user.forgotpass');
Route::post('/user/forgot', 'Auth\ProfileResetPassController@resetPass')->name('user.forgotpass.submit');

Route::get('/vendor/forgot', 'Auth\VendorResetPassController@showForgotForm')->name('vendor.forgotpass');
Route::post('/vendor/forgot', 'Auth\VendorResetPassController@resetPass')->name('vendor.forgotpass.submit');
