@extends('admin.layout.app')

@section('content')
<section class="content-header">
    <div class="container-fluid my-2">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Order: #{{$order->id}}</h1>
            </div>
            <div class="col-sm-6 text-right">
                <a href="{{route('orders.index')}}" class="btn btn-primary">Back</a>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</section>

<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9">
                @include('admin.message')
                <div class="card">
                    <div class="card-header pt-3">
                        <div class="row invoice-info">
                            <div class="col-sm-4 invoice-col">
                                <h1 class="h5 mb-3">Shipping Address</h1>
                                <address>
                                    <strong>{{$order->first_name.' '.$order->last_name}}</strong><br>
                                    {{$order->address}}<br>
                                    {{$order->city}}, {{$order->zip}} {{$order->countryName}}<br>
                                    Phone: {{$order->mobile}}<br>
                                    Email: {{$order->email}}
                                </address>
                                <strong>Shipping Date: </strong>
                                @if (!empty($order->shipped_date))
                                {{\Carbon\Carbon::parse($order->shipped_date)->format('d M,Y')}}
                                @else
                                n/a
                                @endif
                            </div>

                            <div class="col-sm-4 invoice-col">
                                <br>
                                <b>Order ID:</b> {{$order->id}}<br>
                                <b>Total:</b> {{number_format($order->grand_total,2)}} BDT<br>
                                <b>Status:</b>
                                @if ($order->status == 'delivered')
                                    <span class="text-success">Delivered</span>
                                @elseif ($order->status == 'pending')
                                    <span class="text-danger">Pending</span>
                                @elseif ($order->status == 'canceled')
                                    <span class="text-danger">Cancelled</span>
                                @else
                                    <span class="text-info">Shipping</span>
                                @endif
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="card-body table-responsive p-3">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th width="100">Price</th>
                                    <th width="100">Qty</th>
                                    <th width="100">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($orderItems as $item)
                                <tr>
                                    <td>{{$item->name}}</td>
                                    <td>{{number_format($item->price,2)}} BDT</td>
                                    <td>{{$item->qty}}</td>
                                    <td>{{number_format($item->total,2)}} BDT</td>
                                </tr>
                                @endforeach
                                <tr>
                                    <th colspan="3" class="text-right">Subtotal:</th>
                                    <td>{{number_format($order->subtotal, 2)}} BDT</td>
                                </tr>
                                <tr>
                                    <th colspan="3" class="text-right">Discount: {{(!empty($order->cupon_code))? '('.$order->cupon_code.')':''}}</th>
                                    <td>{{number_format($order->discount, 2)}} BDT</td>
                                </tr>
                                <tr>
                                    <th colspan="3" class="text-right">Shipping:</th>
                                    <td>{{number_format($order->shipping, 2)}} BDT</td>
                                </tr>
                                <tr>
                                    <th colspan="3" class="text-right">Grand Total:</th>
                                    <td>{{number_format($order->grand_total, 2)}} BDT</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card mb-3">
                    <form action="" method="post" name="changeOrderStatusForm" id="changeOrderStatusForm">
                    <div class="card-body">
                        <h2 class="h4 mb-3">Order Status</h2>
                        <div class="form-group mb-3">
                            <select name="status" id="status" class="form-control">
                                <option value="pending" {{($order->status=='pending')?'selected':''}}>Pending</option>
                                <option value="shipped" {{($order->status=='shipped')?'selected':''}}>Shipped</option>
                                <option value="delivered" {{($order->status=='delivered')?'selected':''}}>Dlivered</option>
                                <option value="canceled" {{($order->status=='canceled')?'selected':''}}>Cancelled</option>
                                </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="shipped_date">Shipped Date</label>
                            <input autocomplete="off" placeholder="Shipped Date" value="{{$order->shipped_date}}" type="text" name="shipped_date" id="shipped_date" class="form-control">
                        </div>
                        <button class="btn btn-primary btn-block">Update</button>
                    </div>
                </form>
                </div>
                <div class="card">
                    <div class="card-body">
                        <form action="" method="post" name="sendInvoiceEmail" id="sendInvoiceEmail">
                        <h2 class="h4 mb-3">Send Invoice Email</h2>
                        <div class="form-group mb-3">
                            <select name="userType" id="userType" class="form-control">
                                <option value="customer">Customer</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <button class="btn btn-primary btn-block">Send</button>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.card -->
</section>

@endsection

@section('customjs')
<script>
     $(document).ready(function(){
        $('#shipped_date').datetimepicker({
            // options here
            format:'Y-m-d H:i:s',
        });
    });

    $("#changeOrderStatusForm").submit(function(event){
        event.preventDefault()

        if(confirm('Are you sure you want to change status?')){

            $.ajax({
            url:'{{route("orders.change_order_status",$order->id)}}',
            type:'post',
            data:$(this).serializeArray(),
            dataType:'json',
            success:function(response){
                window.location.href="{{route('orders.detail',$order->id)}}"
            }
        })
        }

    })

    $("#sendInvoiceEmail").submit(function(event){
        event.preventDefault()

        if(confirm('Are you sure you want to send email?')){
            $.ajax({
            url:'{{route("orders.send_invoice_email",$order->id)}}',
            type:'post',
            data:$(this).serializeArray(),
            dataType:'json',
            success:function(response){
                window.location.href="{{route('orders.detail',$order->id)}}"
            }
        })

    }

    })
</script>
@endsection
