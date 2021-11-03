<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['customerid', 'products', 'quantities', 'method','shipping', 'pickup_location', 'pay_amount', 'txnid', 'charge_id', 'order_number', 'payment_status', 'customer_email', 'customer_name', 'customer_phone', 'customer_address', 'customer_city', 'customer_zip','shipping_name', 'shipping_email', 'shipping_phone', 'shipping_address', 'shipping_city', 'shipping_zip', 'order_note', 'booking_date', 'status'];
    public $timestamps = false;
    public static $withoutAppends = false;

    public function getProductsAttribute($products)
    {
        if(self::$withoutAppends){
            return $products;
        }
        return explode(',',$products);
    }
    public function getQuantitiesAttribute($quantities)
    {
        if(self::$withoutAppends){
            return $quantities;
        }
        return explode(',',$quantities);
    }

}
