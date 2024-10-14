@extends('front.layout.app')

@section('content')
<section class="section-5 pt-3 pb-3 mb-3 bg-white">
    <div class="container">
        <div class="light-font">
            <ol class="breadcrumb primary-color mb-0">
                <li class="breadcrumb-item"><a class="white-text" href="#">My Account</a></li>
                <li class="breadcrumb-item">Settings</li>
            </ol>
        </div>
    </div>
</section>

<section class=" section-11 ">
    <div class="container  mt-5">
        <div class="row">
            <div class="col-md-12">
                @include('front.account.common.message')
            </div>
            <div class="col-md-3">
                @include('front.account.common.sliderbar')
            </div>
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h2 class="h5 mb-0 pt-2 pb-2">Personal Information</h2>
                    </div>
                    <form action="" name="profileForm" id="profileForm">
                    <div class="card-body p-4">
                        <div class="row">
                            <div class="mb-3">
                                <label for="name">Name</label>
                                <input value="{{$user->name}}" type="text" name="name" id="name" placeholder="Enter Your Name" value="" class="form-control">
                                <p></p>
                            </div>
                            <div class="mb-3">
                                <label for="email">Email</label>
                                <input type="text" value="{{$user->email}}" name="email" id="email" value="" placeholder="Enter Your Email" class="form-control">
                                <p></p>
                            </div>
                            <div class="mb-3">
                                <label for="phone">Phone</label>
                                <input type="text" value="{{$user->phone}}" name="phone" id="phone" value="" placeholder="Enter Your Phone" class="form-control">
                                <p></p>
                            </div>
                            <div class="d-flex">
                                <button type="submit" class="btn btn-dark">Update</button>
                            </div>
                        </div>
                    </div>
                </form>
                </div>


                <div class="card mt-5">
                    <div class="card-header">
                        <h2 class="h5 mb-0 pt-2 pb-2">Address</h2>
                    </div>
                    <form action="" name="addressForm" id="addressForm">
                    <div class="card-body p-4">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="name">First Name</label>
                                <input value="{{(!empty($userAddress)) ? $userAddress->first_name:''}}" type="text" name="first_name" id="first_name" placeholder="First Name" value="" class="form-control">
                                <p></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="name">Last Name</label>
                                <input value="{{(!empty($userAddress)) ? $userAddress->last_name:''}}" type="text" name="last_name" id="last_name" placeholder="Last Name" value="" class="form-control">
                                <p></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="email">Email</label>
                                <input type="text" value="{{(!empty($userAddress)) ? $userAddress->email:''}}" name="email" id="email" value="" placeholder="Email" class="form-control">
                                <p></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="mobile">Mobile</label>
                                <input type="text" value="{{(!empty($userAddress)) ? $userAddress->mobile:''}}" name="mobile" id="mobile" value="" placeholder="Mobile" class="form-control">
                                <p></p>
                            </div>
                            <div class=" mb-3">
                                <label for="country_id">Country</label>
                                <select name="country_id" id="country_id" class="form-control">
                                    <option value="">Select a Country</option>
                                    @if ($countries->isNotEmpty())
                                        @foreach ($countries as $country )
                                         <option {{(!empty($userAddress) && $userAddress->country_id == $country->id) ? 'selected':''}} value="{{$country->id}}">{{$country->name}}</option>
                                        @endforeach
                                    @endif
                                </select>
                                <p></p>
                            </div>
                            <div class=" mb-3">
                                <label for="address">Address</label>
                                <textarea class="form-control" name="address" id="address" cols="30" rows="5">{{(!empty($userAddress)) ? $userAddress->address:''}}</textarea>                                <p></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="apartment">Apartment</label>
                                <input type="text"  name="apartment" id="apartment" value="{{(!empty($userAddress)) ? $userAddress->apartment:''}}" placeholder="Apartment" class="form-control">
                                <p></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="city">City</label>
                                <input type="text" value="{{(!empty($userAddress)) ? $userAddress->city:''}}" name="city" id="city"  placeholder="City" class="form-control">
                                <p></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="state">State</label>
                                <input type="text" value="{{(!empty($userAddress)) ? $userAddress->state:''}}" name="state" id="state"  placeholder="State" class="form-control">
                                <p></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="zip">Zip</label>
                                <input type="text" value="{{(!empty($userAddress)) ? $userAddress->zip:''}}" name="zip" id="zip"  placeholder="Zip" class="form-control">
                                <p></p>
                            </div>
                            <div class="d-flex">
                                <button type="submit" class="btn btn-dark">Update</button>
                            </div>
                        </div>
                    </div>
                </form>
                </div>

            </div>
        </div>
    </div>
</section>
@endsection

@section('customjs')
<script>

$("#profileForm").submit(function(event){
    event.preventDefault();

    $.ajax({
        url:'{{route("account.update_profile")}}',
        type:'post',
        data:$(this).serializeArray(),
        dataType:'json',
        success:function(response){
            if(response.status==true){

            $("#profileForm #name").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
            $("#profileForm #email").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
            $("#profileForm #phone").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");

                window.location.href="{{route('account.profile')}}"
            }else{
            var errors = response['errors'];

                if(errors['name']){
                    $("#profileForm #name").addClass('is-invalid')
                    .siblings('p')
                    .addClass('invalid-feedback')
                    .html(errors['name']);
                } else {
                    $("#profileForm #name").removeClass('is-invalid')
                    .siblings('p')
                    .removeClass('invalid-feedback')
                    .html("");
                }
                if(errors['email']){
                    $("#profileForm #email").addClass('is-invalid')
                    .siblings('p')
                    .addClass('invalid-feedback')
                    .html(errors['email']);
                } else {
                    $("#profileForm #email").removeClass('is-invalid')
                    .siblings('p')
                    .removeClass('invalid-feedback')
                    .html("");
                }
                if(errors['phone']){
                    $("#profileForm #phone").addClass('is-invalid')
                    .siblings('p')
                    .addClass('invalid-feedback')
                    .html(errors['phone']);
                } else {
                    $("#profileForm #phone").removeClass('is-invalid')
                    .siblings('p')
                    .removeClass('invalid-feedback')
                    .html("");
                }
            }
        }
    });
});

$("#addressForm").submit(function(event){
    event.preventDefault();

    $.ajax({
        url: '{{route("account.update_address")}}',
        type: 'post',
        data: $(this).serializeArray(),
        dataType: 'json',
        success: function(response) {
            if(response.status == true) {
                $("#addressForm #first_name").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
                $("#addressForm #last_name").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
                $("#addressForm #email").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
                $("#addressForm #mobile").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
                $("#addressForm #zip").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
                $("#addressForm #city").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
            $("#addressForm #state").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
                $("#addressForm #country_id").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
                $("#addressForm #address").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");
                $("#addressForm #apartment").removeClass('is-invalid')
                .siblings('p')
                .removeClass('invalid-feedback')
                .html("");

                window.location.href="{{route('account.profile')}}"
            } else {
                var errors = response['errors'];
                $("#addressForm input, #addressForm select, #addressForm textarea").each(function() {
                    var field = $(this);
                    var fieldName = field.attr('name');
                    if(errors[fieldName]){
                        field.addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors[fieldName]);
                    } else {
                        field.removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html("");
                    }
                });
            }
        }
    });
});


</script>
@endsection
