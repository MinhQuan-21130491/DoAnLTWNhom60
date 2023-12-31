
$(document).ready(function (){
    $('#signup-form').submit(function (event){
        var password =$('#password').val();
        var newpassword =$('#new_password').val();
        var repassword =$('#re_password').val();
        var condition=true;
        if(password ===""){
            $("#errPW").text('Vui lòng nhập mật khẩu hiện tại');
            $('#errPW').attr('style','color:red');
            condition=false;
        }else{
            $("#errPW").text('');

        }
        if(newpassword===""){
            $("#errNPW").text('Vui lòng nhập mật khẩu mới');
            $('#errNPW').attr('style','color:red');
            condition=false;
        }else if(newpassword===password){
            $("#errNPW").text('Mật khẩu mới trùng với mật khẩu hiện tại');
            $('#errNPW').attr('style','color:red');
            condition=false;
        } else{
            $("#errPW").text('');

        }
        if(repassword===""){
            $("#errReNPW").text('Vui lòng nhập lại mật khẩu mới');
            $('#errReNPW').attr('style','color:red');
            condition=false;
        } else if(repassword!==newpassword){
            $("#errReNPW").text('Mật khẩu mới không chính xác');
            $('#errReNPW').attr('style','color:red');
            condition=false;
        }
        else{
            $("#errReNPW").text('');

        }
        if(newpassword===repassword && newpassword!=="" && newpassword!== password){
           alert('doi mat khau thanh cong');
        }
        if(condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
})
