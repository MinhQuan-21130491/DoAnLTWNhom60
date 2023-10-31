// function send(){
//     var pw= document.getElementById('password');
//     var password = pw.value;
//     var newPW = document.getElementById('new_password');
//     var npw=newPW.value;
//     var rePassword = document.getElementById('re_password');
//     var repw=rePassword.value;
//
//
//
//     if(password === ""){
//         // alert('vui long nhap mat khau');
//         err.innerHTML='vui lòng nhập mật khẩu';
//         return;
//     }
//     if(password===npw){
//         alert('mat khau ms trung vs mat khau hien tai');
//
//     }
//     if(npw!==repw){
//         alert("mat khau nhap lai khong trung vs mat khau moi")
//     }
// }
$(document).ready(function (){
    $('#signup-form').submit(function (event){
        var password =$('#password').val();
        var newpassword =$('#new_password').val();
        var repassword =$('#re_password').val();

        var condition=true;

        if(password ===""){
            $("#errPW").text(' (*)Vui lòng nhập mật khẩu hiện tại');
            $('#errPW').attr('style','color:red');

            condition=false;

        }else{
            $("#errPW").text('');
        }
        if(newpassword===""){
            $("#errNPW").text(' (*)Vui lòng nhập mật khẩu mới');
            $('#errNPW').attr('style','color:red');
            condition=false;
        }else if(newpassword===password){
            $("#errNPW").text(' (*)Mật khẩu mới trùng với mật khẩu hiện tại');
            $('#errNPW').attr('style','color:red');
            condition=false;
        } else{
            $("#errPW").text('');
        }
        if(repassword===""){
            $("#errReNPW").text(' (*)Vui lòng nhập lại mật khẩu mới');
            $('#errReNPW').attr('style','color:red');
            condition=false;
        } else if(repassword!==newpassword){
            $("#errReNPW").text(' (*)Mật khẩu mới không chính xác');
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
