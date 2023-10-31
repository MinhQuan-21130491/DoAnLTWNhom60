$(document).ready(function () {
    $('#signup-form').submit(function (event) {
        var user = $('#user_name').val();
        var password = $('#password').val();
        var rePW = $('#re_password').val();
        var name = $('#name').val();
        var tell = $('#phone_number').val();
        var email = $('#email').val();
        var date = $('#birthday').val();
        var address = $('#address').val();


        var condition = true;
        var nameReg = /^[A-Za-zÀ-ỹ\s]+$/;
        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var tellReg = /^\d{10}/;

        if (user === "") {
            $("#errUser").text(' (*)Vui lòng nhập tên đăng nhập!');
            $('#errUser').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errUser").text('');
        }
        if(password===""){
            $("#errPW").text(' (*)Vui lòng nhập mật khẩu!');
            $('#errPW').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errPW").text('');
        }
        if(rePW === ""){
            $("#errRePW").text(' (*)Vui lòng nhập lại mật khẩu!');
            $('#errRePW').attr('style', 'color:red');
            condition = false;
        }else if(rePW !==password){
            $("#errRePW").text(' (*)Mật khẩu nhập lại không đúng!');
            $('#errRePW').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errRePW").text('');
        }
        if(name===""){
            $("#errName").text(' (*)Vui lòng nhập tên!');
            $('#errName').attr('style', 'color:red');
            condition = false;
        if(!name.match(nameReg) && name!==""){
            $("#errName").text(' (*)Tên không hợp lệ!');
            $('#errName').attr('style', 'color:red');
            condition = false;
        }
        }else{
            $("#errName").text('');
        }
        if(tell===""){
            $("#errTell").text(' (*)Vui lòng nhập số điện thoại!');
            $('#errTell').attr('style', 'color:red');
            condition = false;
        }else if(!tell.match(tellReg)){
            $("#errTell").text(' (*)Số điện thoại không hợp lệ!');
            $('#errTell').attr('style', 'color:red');
            condition = false;
        }
        else{
            $("#errTell").text('');
        }
        if(email===""){
            $("#errEmail").text(' (*)Vui lòng nhập Gmail!');
            $('#errEmail').attr('style', 'color:red');
            condition = false;
        }else if(!email.match(emailReg)){
            $("#errEmail").text(' (*)Gmail không hợp lệ!');
            $('#errEmail').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errEmail").text('');
        }
        if(date===""){
            $("#errDate").text(' (*)Vui lòng nhập ngày sinh!');
            $('#errDate').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errDate").text('');
        }
        if(address===""){
            $("#errAd").text(' (*)Vui lòng nhập địa chỉ của bạn!');
            $('#errAd').attr('style', 'color:red');
            condition = false;
        }else{
            $("#errAd").text('');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
})