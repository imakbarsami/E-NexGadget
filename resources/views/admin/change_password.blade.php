
@extends('admin.layout.app')

@section('content')
<section class="content-header">
    <div class="container-fluid my-2">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Change Password</h1>
            </div>

        </div>
    </div>
    <!-- /.container-fluid -->
</section>
<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="container-fluid">
        @include('admin.message')
        <form action="" method="post" id="changePasswordForm" name="changePasswordForm">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mb-3">
                            <label for="name">Old Password</label>
                            <input type="password" name="old_password" id="old_password" class="form-control" placeholder="Old Password">
                            <p></p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="mb-3">
                            <label for="slug">New Password</label>
                            <input  type="password" name="new_password" id="new_password" class="form-control" placeholder="New Password">
                            <p></p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="mb-3">
                            <label for="slug">Confirm Password</label>
                            <input  type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm Password">
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="pb-5 pt-3">
            <button class="btn btn-primary" type="submit">Update</button>
        </div>
    </form>
    </div>
    <!-- /.card -->
</section>
@endsection

@section('customjs')
<script>
    $("#changePasswordForm").submit(function(event){
    event.preventDefault();

    $("button[type='submit']").prop('disabled',true)

    $.ajax({
        url: '{{ route("admin.process_change_password") }}',
        type: 'post',
        data: $(this).serializeArray(),
        dataType: 'json',
        success: function(response){

            $("button[type='submit']").prop('disabled',false)

            if(response.status == false){
                var errors = response.errors;

                if(errors.old_password){
                    $("#old_password").siblings('p').addClass('invalid-feedback').html(errors.old_password);
                    $("#old_password").addClass('is-invalid');
                } else {
                    $("#old_password").siblings('p').removeClass('invalid-feedback').html('');
                    $("#old_password").removeClass('is-invalid');
                }
                if(errors.new_password){
                    $("#new_password").siblings('p').addClass('invalid-feedback').html(errors.new_password);
                    $("#new_password").addClass('is-invalid');
                } else {
                    $("#new_password").siblings('p').removeClass('invalid-feedback').html('');
                    $("#new_password").removeClass('is-invalid');
                }
                if(errors.confirm_password){
                    $("#confirm_password").siblings('p').addClass('invalid-feedback').html(errors.confirm_password);
                    $("#confirm_password").addClass('is-invalid');
                } else {
                    $("#confirm_password").siblings('p').removeClass('invalid-feedback').html('');
                    $("#confirm_password").removeClass('is-invalid');
                }
            }else{
                window.location.href="{{route('admin.show_change_password_form')}}"
            }
        },
        error: function(jQXHR, exception){
            console.log('something went wrong');
        }
    });
});
</script>
@endsection
