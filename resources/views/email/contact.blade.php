<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contact Email</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f8f9fa; color: #343a40; font-family: Arial, sans-serif;">
    <div class="container my-5">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h2 class="card-title">New Contact Message</h2>
            </div>
            <div class="card-body">
                <h5 class="card-title">Contact Details</h5>
                <p><strong>Name:</strong> {{$mailData['name']}}</p>
                <p><strong>Email:</strong> <a href="mailto:{{$mailData['email']}}">{{$mailData['email']}}</a></p>
                <p><strong>Subject:</strong> {{$mailData['subject']}}</p>
                <hr>
                <h5 class="card-title">Message</h5>
                <p>{{$mailData['message']}}</p>
            </div>
            <div class="card-footer text-muted text-end">
                <small>Received on {{ date('F j, Y, g:i a') }}</small>
            </div>
        </div>
    </div>
</body>
</html>
