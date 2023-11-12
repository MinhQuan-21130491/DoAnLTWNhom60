
//them san pham
$(document).ready(function () {
    $('#add-product').submit(function (event) {
        var nameP = $('#nameProduct').val();
        var priceImp = $('#priceImpProductAdd').val();
        var price = $('#priceProductAdd').val();
        var des = $('#des').val();
        var img1 = $('#image1').val();
        var img2 = $('#image2').val();
        var img3 = $('#image3').val();
        var img4 = $('#image4').val();
        var length = $('#length').val();
        var width = $('#width').val();
        var height = $('#height').val();
        var material = $('#material').val();
        var color = $('#color').val();
        var amount = $('#amount').val();
        var condition = true;
        var priceReg = /^\d+$/;
        //tên sản phẩm
        if (nameP === "") {
            $("#errNameP").text(' (*)Vui lòng nhập tên sản phẩm');
            condition = false;
        } else {
            $("#errNameP").text('');
        }
        //giá nhập
        if (priceImp === "") {
            $("#errImpPriceAdd").text(' (*)Vui lòng nhập giá sản phẩm!');
            condition = false;
        } else if(!priceImp.match(priceReg)) {
            $("#errImpPriceAdd").text(' (*)Giá tiền không hợp lệ!');
            condition = false;
        }else {
            $("#errImpPriceAdd").text('');
        }
        //giá bán
        if (price === "") {
            $("#errPriceAdd").text(' (*)Vui lòng nhập giá bán!');
            condition = false;
        } else if(!price.match(priceReg)) {
            $("#errPriceAdd").text(' (*)Giá tiền không hợp lệ!');
            condition = false;
        }else {
            $("#errPriceAdd").text('');
        }
        //mô tả
        if (des === "") {
            $("#errDes").text(' (*)Vui lòng nhập mô tả sản phẩm!');
            condition = false;
        } else {
            $("#errDes").text('');
        }
        //hình 1
        if (img1 === "") {
            $("#errImg1").text(' (*)Vui lòng nhập đường dẫn hình ảnh 1!');
            condition = false;
        } else {
            $("#errImg1").text('');
        }
        //hình 2
        if (img2 === "") {
            $("#errImg2").text(' (*)Vui lòng nhập đường dẫn hình ảnh 2!');
            condition = false;
        } else {
            $("#errImg2").text('');
        }
        //hình 3
        if (img3 === "") {
            $("#errImg3").text(' (*)Vui lòng nhập đường dẫn hình ảnh 3!');
            condition = false;
        } else {
            $("#errImg3").text('');
        }
        //hình 4
        if (img4 === "") {
            $("#errImg4").text(' (*)Vui lòng nhập đường dẫn hình ảnh 4!');
            condition = false;
        } else {
            $("#errImg4").text('');
        }
        //length
        if (length === "") {
            $('#length').attr('style', 'border-color:red');
            condition = false;
        } else {
            $('#length').attr('style', 'border-color:#dee2e6');
        }
        //width
        if (width === "") {
            $('#width').attr('style', 'border-color:red');
            condition = false;
        } else {
            $('#width').attr('style', 'border-color:#dee2e6');
        }
        //height
        if (height === "") {
            $('#height').attr('style', 'border-color:red');
            condition = false;
        } else {
            $('#height').attr('style', 'border-color:#dee2e6');
        }
        //material
        if (material === "") {
            $('#material').attr('style', 'border-color:red');
            condition = false;
        } else {
            $('#material').attr('style', 'border-color:#dee2e6');
        }
        //color
        if (color === "") {
            $('#color').attr('style', 'border-color:red');
            condition = false;
        } else {
            $('#color').attr('style', 'border-color:#dee2e6');
        }
        //amount
        if (amount === "") {
            $('#amount').attr('style', 'border-color:red');
            condition = false;
        } else {
            $('#amount').attr('style', 'border-color:#dee2e6');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })

});
    $('#editProduct').submit(function (event) {

        var nameP = $('#nameProductEdit').val();
        var priceImp = $('#priceImpProductEdit').val();
        var price = $('#priceProductEdit').val();
        var des = $('#desEdit').val();

        var img1 = $('#image1Edit').val();
        var img2 = $('#image2Edit').val();
        var img3 = $('#image3Edit').val();
        var img4 = $('#image4Edit').val();

        var length = $('#lengthEdit').val();
        var width = $('#widthEdit').val();
        var height = $('#heightEdit').val();
        var material = $('#materialEdit').val();
        var color = $('#colorEdit').val();
        var amount = $('#amountEdit').val();
        var condition = true;
        var priceReg = /^\d+$/;
        //tên sản phẩm
        if (nameP === "") {
            $("#errNamePEdit").text(' (*)Vui lòng nhập tên sản phẩm');
            condition = false;
        } else {
            $("#errNamePEdit").text('');
        }
        //giá nhập
        if (priceImp === "") {
            $("#errImpPriceEdit").text(' (*)Vui lòng nhập giá sản phẩm!');
            condition = false;
        } else if(!priceImp.match(priceReg)) {
            $("#errImpPriceEdit").text(' (*)Giá tiền không hợp lệ!');
            condition = false;
        } else{
            $("#errImpPriceEdit").text('');
        }
        //gia ban
        if (price === "") {
            $("#errPriceEdit").text(' (*)Vui lòng nhập giá bán!');
            condition = false;
        }else if(!price.match(priceReg)) {
                $("#errPriceEdit").text(' (*)Giá tiền không hợp lệ!');
                condition = false;
        }else{
            $("#errPriceEdit").text('');
        }
        //mô tả
        if (des === "") {
            $("#errDesEdit").text(' (*)Vui lòng nhập mô tả sản phẩm!');
            condition = false;
        }
        else{
            $("#errDesEdit").text('');
        }
        //hình 1
        if (img1 === "") {
            $("#errImg1Edit").text(' (*)Vui lòng nhập đường dẫn hình ảnh 1!');
            condition = false;
        }
        else{
            $("#errImg1Edit").text('');

        }
        //hình 2
        if (img2 === "") {
            $("#errImg2Edit").text(' (*)Vui lòng nhập đường dẫn hình ảnh 2!');
            condition = false;
        }
        else{
            $("#errImg2Edit").text('');
        }
        //hình 3
        if (img3 === "") {
            $("#errImg3Edit").text(' (*)Vui lòng nhập đường dẫn hình ảnh 3!');
            condition = false;
        }
        else{
            $("#errImg3Edit").text('');
        }
        //hình 4
        if (img4 === "") {
            $("#errImg4Edit").text(' (*)Vui lòng nhập đường dẫn hình ảnh 4!');
            condition = false;
        }
        else{
            $("#errImg4Edit").text('');
        }
        //length
        if (length === "" ) {
            $('#lengthEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $('#lengthEdit').attr('style', 'border-color:#dee2e6');
        }
        //width
        if (width === "") {
            $('#widthEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $('#widthEdit').attr('style', 'border-color:#dee2e6');
        }
        //height
        if (height === "") {
            $('#heightEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $('#heightEdit').attr('style', 'border-color:#dee2e6');
        }
        //material
        if (material === "") {
            $('#materialEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $('#materialEdit').attr('style', 'border-color:#dee2e6');
        }
        //color
        if (color === "") {
            $('#colorEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $('#colorEdit').attr('style', 'border-color:#dee2e6');
        }
        //amount
        if (amount === "") {
            $('#amountEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errImg4Edit").text('');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
//chinh sua danh muc
    $('#cateEdit').submit(function (event) {
        var nameCate = $('#nameCateEdit').val();
        if (nameCate === "") {
            $("#errNameCate").text(' (*)Vui lòng nhập danh mục!');
            condition = false;
        }
        else{
            $('#errNameCate').text('');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
// them danh muc
    $('#add-Cate').submit(function (event) {
        var nameCate = $('#nameCateEdit').val();
        if (nameCate === "") {
            $("#errNameCateAdd").text(' (*)Vui lòng nhập danh mục mới!');
            condition = false;
        }
        else{
            $('#errNameCateAdd').text('');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
//chinh sua nha cung cap
$(document).ready(function () {
    $('#supEdit').submit(function (event) {
        var nameSup = $('#nameSupEdit').val();
        var address = $('#addressSupEdit').val();
        var phone = $('#phoneNumberSupEdit').val();
        var email = $('#emailSupEdit').val();

        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var tellReg = /^\d{10}/;

        //ten nha cung cap
        if (nameSup === "") {
            $("#errNameSupEdit").text(' (*)Vui lòng nhập tên nhà cung cấp!');
            $('#errNameSupEdit').attr('style', 'font-size:12px');
            $('#nameSupEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errNameSupEdit").text('');
            $('#nameSupEdit').attr('style', 'border-color:#dee2e6');
        }
        // dia chi nha cung cap
        if (address === "") {
            $("#errAddEdit").text(' (*)Vui lòng nhập địa chỉ nhà cung cấp!');
            $('#errAddEdit').attr('style', 'font-size:12px');
            $('#addressSupEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errAddEdit").text('');
            $('#addressSupEdit').attr('style', 'border-color:#dee2e6');
        }
        //so dien thoai
        if (phone === "") {
            $("#errphoneNumberSupEdit").text(' (*)Vui lòng nhập số điện thoại nhà cung cấp!');
            $('#errphoneNumberSupEdit').attr('style', 'font-size:12px');
            $('#phoneNumberSupEdit').attr('style', 'border-color:red');
            condition = false;
        }else if(!phone.match(tellReg)){
            $("#errphoneNumberSupEdit").text(' (*)Số điện thoại không hợp lệ!');
            $('#errphoneNumberSupEdit').attr('style', 'font-size:12px');
            condition = false;
        }
        else{
            $("#errphoneNumberSupEdit").text('');
            $('#phoneNumberSupEdit').attr('style', 'border-color:#dee2e6');
        }
        //email
        if (email === "") {
            $("#errEmailSupEdit").text(' (*)Vui lòng nhập Email nhà cung cấp!');
            $('#errEmailSupEdit').attr('style', 'font-size:12px');
            $('#emailSupEdit').attr('style', 'border-color:red');
            condition = false;
        }else if(!email.match(emailReg)){
            $("#errEmailSupEdit").text(' (*)Email không hợp lệ!');
            $('#errEmailSupEdit').attr('style', 'font-size:12px');
            condition = false;
        }
        else{
            $("#errEmailSupEdit").text('');
            $('#emailSupEdit').attr('style', 'border-color:#dee2e6');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
})
//them nha cung cap
$(document).ready(function () {
    $('#supAdd').submit(function (event) {
        var nameSup = $('#nameSupAdd').val();
        var address = $('#addressSupAdd').val();
        var phone = $('#phoneSupAdd').val();
        var email = $('#emailSupAdd').val();

        var emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var tellReg = /^\d{10}/;

        //ten nha cung cap
        if (nameSup === "") {
            $("#errNameSupAdd").text(' (*)Vui lòng nhập tên nhà cung cấp!');
            $('#errNameSupAdd').attr('style', 'font-size:12px');
            $('#nameSupAdd').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errNameSupAdd").text('');
            $('#nameSupAdd').attr('style', 'border-color:#dee2e6');
        }
        // dia chi nha cung cap
        if (address === "") {
            $("#errAddressSupAdd").text(' (*)Vui lòng nhập địa chỉ nhà cung cấp!');
            $('#errAddressSupAdd').attr('style', 'font-size:12px');
            $('#addressSupAdd').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errAddressSupAdd").text('');
            $('#addressSupAdd').attr('style', 'border-color:#dee2e6');
        }
        //so dien thoai
        if (phone === "") {
            $("#errphoneSupAdd").text(' (*)Vui lòng nhập số điện thoại nhà cung cấp!');
            $('#errphoneSupAdd').attr('style', 'font-size:12px');
            $('#phoneSupAdd').attr('style', 'border-color:red');
            condition = false;
        }else if(!phone.match(tellReg)){
            $("#errphoneSupAdd").text(' (*)Số điện thoại không hợp lệ!');
            $('#errphoneSupAdd').attr('style', 'font-size:12px');
            condition = false;
        }
        else{
            $("#errphoneSupAdd").text('');
            $('#phoneSupAdd').attr('style', 'border-color:#dee2e6');
        }
        //email
        if (email === "") {
            $("#errEmailSupAdd").text(' (*)Vui lòng nhập Email nhà cung cấp!');
            $('#errEmailSupAdd').attr('style', 'font-size:12px');
            $('#emailSupAdd').attr('style', 'border-color:red');
            condition = false;
        }else if(!email.match(emailReg)){
            $("#errEmailSupAdd").text(' (*)Email không hợp lệ!');
            $('#errEmailSupAdd').attr('style', 'font-size:12px');
            condition = false;
        }
        else{
            $("#errEmailSupAdd").text('');
            $('#emailSupAdd').attr('style', 'border-color:#dee2e6');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
})




