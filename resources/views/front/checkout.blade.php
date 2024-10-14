
@extends('front.layout.app')

@section('content')

<section class="section-5 pt-3 pb-3 mb-3 bg-white">
    <div class="container">
        <div class="light-font">
            <ol class="breadcrumb primary-color mb-0">
                <li class="breadcrumb-item"><a class="white-text" href="{{route('front.home')}}">Home</a></li>
                <li class="breadcrumb-item"><a class="white-text" href="{{route('front.shop')}}">Shop</a></li>
                <li class="breadcrumb-item">Checkout</li>
            </ol>
        </div>
    </div>
</section>

<section class="section-9 pt-4">
    <div class="container">
        <form action="" id="orderForm" name="orderForm" method="post">
        <div class="row">
            <div class="col-md-8">
                <div class="sub-title">
                    <h2>Shipping Address</h2>
                </div>
                <div class="card shadow-lg border-0">
                    <div class="card-body checkout-form">
                        <div class="row">

                            <div class="col-md-12">
                                <div class="mb-3">
                                    <input type="text" name="first_name" id="first_name" class="form-control" value="{{(!empty($customerAddress)) ? $customerAddress->first_name : ''}}" placeholder="First Name">
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <input type="text" name="last_name" id="last_name" class="form-control" value="{{(!empty($customerAddress)) ? $customerAddress->last_name : ''}}" placeholder="Last Name">
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="mb-3">
                                    <input type="text" name="email" id="email" class="form-control" value="{{(!empty($customerAddress)) ? $customerAddress->email : ''}}" placeholder="Email">
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="mb-3">
                                    <select name="country" id="country" class="form-control">
                                        <option value="">Select a Country</option>
                                        @if ($countries->isNotEmpty())
                                            @foreach ($countries as $country)
                                            <option {{(!empty($customerAddress) && $customerAddress->country_id == $country->id) ? 'selected' : ''}} value="{{$country->id}}">{{$country->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="mb-3">
                                    <textarea name="address" id="address" cols="30" rows="3" placeholder="Address" class="form-control">{{(!empty($customerAddress)) ? $customerAddress->address : ''}}</textarea>
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="mb-3">
                                    <input type="text" name="appartment" id="appartment" class="form-control" value="{{(!empty($customerAddress)) ? $customerAddress->apartment : ''}}" placeholder="Apartment, suite, unit, etc. (optional)">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="mb-3">
                                    <input type="text" name="city" id="city" class="form-control" value="{{(!empty($customerAddress)) ? $customerAddress->city : ''}}" placeholder="City">
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="mb-3">
                                    <input type="text" name="state" id="state" class="form-control" value="{{(!empty($customerAddress)) ? $customerAddress->state : ''}}" placeholder="State">
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="mb-3">
                                    <input type="text" name="zip" id="zip" class="form-control" value="{{(!empty($customerAddress)) ? $customerAddress->zip : ''}}" placeholder="Zip">
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="mb-3">
                                    <input type="text" name="mobile" id="mobile" class="form-control" value="{{(!empty($customerAddress)) ? $customerAddress->mobile : ''}}" placeholder="Mobile No.">
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="mb-3">
                                    <textarea name="order_notes" id="order_notes" cols="30" rows="2" placeholder="Order Notes (optional)" class="form-control">{{(!empty($customerAddress)) ? $customerAddress->notes : ''}}</textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-4">
                <div class="sub-title">
                    <h2>Order Summery</h3>
                </div>
                <div class="card cart-summery">
                    <div class="card-body">
                        @foreach (Cart::content() as $item)
                            <div class="d-flex justify-content-between pb-2">
                                <div class="h6">{{$item->name}} X {{$item->qty}}</div>
                                <div class="h6">{{$item->price*$item->qty}} BDT</div>
                            </div>
                        @endforeach
                        <div class="d-flex justify-content-between summery-end">
                            <div class="h6"><strong>Subtotal</strong></div>
                            <div class="h6"><strong>{{Cart::subtotal()}} BDT</strong></div>
                        </div>
                        <div class="d-flex justify-content-between summery-end">
                            <div class="h6"><strong>Discount</strong></div>
                            <div class="h6"><strong id="discount_value">{{number_format($discount,2)}} BDT</strong></div>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                            <div class="h6"><strong>Shipping</strong></div>
                            <div class="h6"><strong id="shippingAmount">{{number_format($totalShippingCharge,2)}} BDT</strong></div>
                        </div>
                        <div class="d-flex justify-content-between mt-2 summery-end">
                            <div class="h5"><strong>Total</strong></div>
                            <div class="h5"><strong id="grandTotal">{{number_format($grandTotal,2)}} BDT</strong></div>
                        </div>
                    </div>
                </div>
                <div class="input-group apply-coupan mt-4">
                    <input type="text" name="discount_code" id="discount_code" placeholder="Coupon Code" class="form-control">
                    <button class="btn btn-dark" type="button" id="apply_discount">Apply Coupon</button>
                </div>
                <div id="discount_response_wrapper">
                    @if (Session::has('code'))
                    <div class=" mt-4" id="discount_response">
                        <strong>{{Session::get('code')->code}}</strong>
                        <a class="btn btn-sm btn-danger" id="remove_discount"><i class="fa fa-times"></i></a>
                    </div>
                @endif
                </div>
                <div class="card payment-form ">
                    <h3 class="card-title h5 mb-3">Payment Method</h3>
                     <div class="">
                        <input checked type="radio" name="payment_method" value="cod" id="payment_method1">
                        <label for="payment_method1" class="form-check-label">COD</label>
                    </div>
                     <div class="">
                        <input type="radio" name="payment_method" value="cod" id="payment_method2">
                        <label for="payment_method2" class="form-check-label">Stripe</label>
                    </div>
                    <div class="card-body p-0 d-none mt-3" id="cart_payment_form">
                        <div class="mb-3">
                            <label for="card_number" class="mb-2">Card Number</label>
                            <input type="text" name="card_number" id="card_number" placeholder="Valid Card Number" class="form-control">
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="expiry_date" class="mb-2">Expiry Date</label>
                                <input type="text" name="expiry_date" id="expiry_date" placeholder="MM/YYYY" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label for="expiry_date" class="mb-2">CVV Code</label>
                                <input type="text" name="expiry_date" id="expiry_date" placeholder="123" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="pt-4">
                        {{-- <a href="#" class="btn-dark btn btn-block w-100">Pay Now</a> --}}
                        <button type="submit" class="btn-dark btn btn-block w-100">Pay Now</button>
                    </div>
                </div>


                <!-- CREDIT CARD FORM ENDS HERE -->

            </div>
        </div>
        </form>
    </div>
</section>
@endsection

@section('customjs')

<script>
    $("#payment_method1").click(function(){
        if($(this).is(":checked")==true){
            $("#cart_payment_form").addClass("d-none");
        }
    })
    $("#payment_method2").click(function(){
        if($(this).is(":checked")==true){
            $("#cart_payment_form").removeClass("d-none");
        }
    })


    $("#orderForm").submit(function(event) {
    event.preventDefault();

    $('button[type="submit"]').prop('disabled',true)
    $.ajax({
        url: '{{route('front.process_checkout')}}',
        type: 'post',
        data: $(this).serializeArray(),
        dataType: 'json',
        success: function(response) {
            var error = response.errors;
            $('button[type="submit"]').prop('disabled',false)

            if (response.status == false) {
                if (error.first_name) {
                    $("#first_name").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(error.first_name);
                } else {
                    $("#first_name").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }

                if (error.last_name) {
                    $("#last_name").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(error.last_name);
                } else {
                    $("#last_name").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }

                if (error.email) {
                    $("#email").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(error.email);
                } else {
                    $("#email").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }

                if (error.country) {
                    $("#country").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(error.country);
                } else {
                    $("#country").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }

                if (error.city) {
                    $("#city").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(error.city);
                } else {
                    $("#city").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }

                if (error.address) {
                    $("#address").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(error.address);
                } else {
                    $("#address").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }

                if (error.state) {
                    $("#state").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(error.state);
                } else {
                    $("#state").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }

                if (error.mobile) {
                    $("#mobile").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(error.mobile);
                } else {
                    $("#mobile").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }

                if (error.zip) {
                    $("#zip").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(error.zip);
                } else {
                    $("#zip").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                }
            } else {
                window.location.href = '{{ url("thanks/") }}/'+response.orderId;
            }
        },
        error: function() {
            // Handle error case
            alert('An error occurred. Please try again.');
        }
    });
});

$("#country").change(function() {
    $.ajax({
        url: '{{ route("front.get_order_summery") }}',
        type: 'post',
        data: {
            country_id: $(this).val()
        },
        dataType: 'json',
        success: function(response) {
            if(response.status==true){
                $("#shippingAmount").html(response.shippingCharge+' BDT')
                $("#grandTotal").html(response.grandTotal+ ' BDT')
            }
        },
    });
});

$("#apply_discount").click(function(){

        $.ajax({
            url: '{{ route("front.apply_discount") }}',
            type: 'post',
            data: {
                code: $("#discount_code").val(),
                country_id: $("#country").val(),
                _token: '{{ csrf_token() }}'
            },
            dataType: 'json',
            cache: false,
            success: function(response) {
                if(response.status==true){
                    $("#shippingAmount").html(response.shippingCharge+' BDT')
                    $("#grandTotal").html(response.grandTotal+ ' BDT')
                    $("#discount_value").html(response.discount+ ' BDT')
                    $("#discount_response_wrapper").html(response.discountString)
                }else{
                    $("#discount_response_wrapper").html("<span class='text-danger'>"+response.message+"</span>")
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX error: " + status + ": " + error); // Log any error
            }
        });
    });

    $('body').on('click',"#remove_discount",function(){
        $.ajax({
                url: '{{ route("front.remove_discount") }}',
                type: 'post',
                data: {
                    country_id: $("#country").val(),
                    _token: '{{ csrf_token() }}'
                },
                dataType: 'json',
                cache: false,
                success: function(response) {
                    if(response.status==true){
                        $("#shippingAmount").html(response.shippingCharge+' BDT')
                        $("#grandTotal").html(response.grandTotal+ ' BDT')
                        $("#discount_value").html(response.discount+ ' BDT')
                        $("#discount_response").html('')
                        $("#discount_code").val('')
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX error: " + status + ": " + error); // Log any error
                }
            });
        });

</script>

@endsection
