$(document).ready(function (){
    $('#signup-form').submit(function (event){
        var verify =$('#verify').val();
        var tellReg = /^\d{6}/;
        var condition=true;
        if (verify === "") {
            $("#errVerify").text('(*)Vui lòng nhập mã xác thực!');
            $('#errVerify').attr('style', 'color:red');
            condition = false;
        } else if (!verify.match(tellReg)) {
            $('#errVerify').text('(*)Mã xác thực không hợp lệ!');
            $('#errVerify').attr('style', 'color:red')
            condition = false;
        }
        else{
            $("#errUser").text('');
            condition = true;
        }
        if(condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
})