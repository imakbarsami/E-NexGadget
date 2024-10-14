<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f8f9fa; color: #495057; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
    <div class="container my-5">
        <div class="card shadow-lg border-0">
            <div class="card-body p-4">
                <h2 class="card-title text-center text-primary mb-4">Reset Your Password</h2>
                <p class="mb-4">Hello <strong>{{$formData['user']->name}},</strong>,</p>
                <p class="mb-4">You have requested to reset your password. Please click the button below to proceed:</p>
                <div class="text-center">
                    <a href="{{route('front.process_reset_password',$formData['token'])}}" class="btn btn-primary btn-lg">Reset Password</a>
                </div>
                <p class="mt-4">If you did not request this change, please ignore this email.</p>
                <p class="mt-4 text-muted">Thank you!</p>
            </div>
            <div class="card-footer text-center bg-light">
                <small class="text-muted">© {{ date('Y') }} Your Company Name. All rights reserved.</small>
            </div>
        </div>
    </div>
</body>
</html>
