<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Order Confirmation</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f8fa;
            color: #333;
        }
        .container {
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
            max-width: 700px;
        }
        .header {
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .header h1 {
            font-size: 28px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 5px;
        }
        .header p {
            font-size: 16px;
            color: #6c757d;
        }
        .table thead {
            background-color: #007bff;
            color: #fff;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .total-row {
            background-color: #f1f1f1;
            font-weight: bold;
        }
        .total-row td {
            color: #007bff;
        }
        .price-cell {
            white-space: nowrap;
        }
        address {
            font-style: normal;
            line-height: 1.5;
            margin-bottom: 20px;
        }
        .footer {
            margin-top: 30px;
            border-top: 1px solid #dee2e6;
            padding-top: 15px;
            text-align: center;
            color: #6c757d;
        }
    </style>
</head>
<body>

    @if ($mailData['userType']=='customer')
    <div class="container">
        <div class="header text-center">
            <h1>Thanks for Your Order!</h1>
            <p>Your Order ID: #{{$mailData['order']->id}}</p>
     </div>
     @else
     <div class="container">
        <div class="header text-center">
            <h1>You have received an order</h1>
            <p>Order ID: #{{$mailData['order']->id}}</p>
     </div>
    @endif
        <h2 class="h5 mb-3">Shipping Address</h2>
        <address>
            <strong>{{$mailData['order']->first_name . ' ' . $mailData['order']->last_name}}</strong><br>
            {{$mailData['order']->address}}<br>
            {{$mailData['order']->city}}, {{$mailData['order']->zip}} {{getCountryInfo($mailData['order']->country_id)->name}}<br>
            Phone: {{$mailData['order']->mobile}}<br>
            Email: {{$mailData['order']->email}}
        </address>

        <h2 class="h5 mb-3">Order Summary</h2>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Product</th>
                    <th class="text-right" width="100">Price</th>
                    <th class="text-right" width="100">Qty</th>
                    <th class="text-right" width="100">Total</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($mailData['order']->items as $item)
                <tr>
                    <td>{{$item->name}}</td>
                    <td class="text-right price-cell">{{number_format($item->price, 2)}} BDT</td>
                    <td class="text-right">{{$item->qty}}</td>
                    <td class="text-right price-cell">{{number_format($item->total, 2)}} BDT</td>
                </tr>
                @endforeach
                <tr>
                    <th colspan="3" class="text-right">Subtotal:</th>
                    <td class="text-right price-cell">{{number_format($mailData['order']->subtotal, 2)}} BDT</td>
                </tr>
                <tr>
                    <th colspan="3" class="text-right">
                        Discount: {{!empty($mailData['order']->cupon_code) ? '('.$mailData['order']->cupon_code.')' : ''}}
                    </th>
                    <td class="text-right price-cell">-{{number_format($mailData['order']->discount, 2)}} BDT</td>
                </tr>
                <tr>
                    <th colspan="3" class="text-right">Shipping:</th>
                    <td class="text-right price-cell">{{number_format($mailData['order']->shipping, 2)}} BDT</td>
                </tr>
                <tr class="total-row">
                    <th colspan="3" class="text-right">Grand Total:</th>
                    <td class="text-right price-cell">{{number_format($mailData['order']->grand_total, 2)}} BDT</td>
                </tr>
            </tbody>
        </table>

        <div class="footer">
            <p>If you have any questions about your order, feel free to contact us.</p>
        </div>
    </div>
</body>
</html>
