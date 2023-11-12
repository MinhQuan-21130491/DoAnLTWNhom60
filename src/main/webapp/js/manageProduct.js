
//them san pham
$(document).ready(function () {

    $('#add-product').submit(function (event) {
        var nameP = $('#nameProduct').val();
        var price = $('#priceProduct').val();
        var delivery = $('#delivery').val();
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
        //tên sản phẩm
        if (nameP === "") {

            $("#errNameP").text(' (*)Vui lòng nhập tên sản phẩm');
            $('#errNameP').attr('style', 'font-size:12px');
            $('#nameProduct').attr('style', 'border-color:red');
            condition = false;

        } else {
            $("#errNameP").text('');
            $('#nameProduct').attr('style', 'border-color:#dee2e6');
        }
        //giá nhập
        if (price === "") {
            $("#errPrice").text(' (*)Vui lòng nhập giá sản phẩm!');
            $('#errPrice').attr('style', 'font-size:12px');
            $('#priceProduct').attr('style', 'border-color:red');
            condition = false;
        }else if(price.isNaN()){
            $("#errPrice").text(' (*)Giá tiền không hợp lệ!');
        }
        else {
            $("#errPrice").text('');
            $('#priceProduct').attr('style', 'border-color:#dee2e6');
        }
        //giá bán
        if (delivery === "") {
            $("#errDelivery").text(' (*)Vui lòng nhập giá bán!');
            $('#errDelivery').attr('style', 'font-size:12px');
            $('#delivery').attr('style', 'border-color:red');
            condition = false;
        } else {
            $("#errDelivery").text('');
            $('#delivery').attr('style', 'border-color:#dee2e6');
        }
        //mô tả
        if (des === "") {
            $("#errDes").text(' (*)Vui lòng nhập mô tả sản phẩm!');
            $('#errDes').attr('style', 'font-size:12px');
            $('#des').attr('style', 'border-color:red');
            condition = false;
        } else {
            $("#errDes").text('');
            $('#des').attr('style', 'border-color:#dee2e6');
        }
        //hình 1
        if (img1 === "") {
            $("#errImg1").text(' (*)Vui lòng nhập đường dẫn hình ảnh 1!');
            $('#errImg1').attr('style', 'font-size:12px');
            $('#image1').attr('style', 'border-color:red');
            condition = false;
        } else {
            $("#errImg1").text('');
            $('#image1').attr('style', 'border-color:#dee2e6');
        }
        //hình 2
        if (img2 === "") {
            $("#errImg2").text(' (*)Vui lòng nhập đường dẫn hình ảnh 2!');
            $('#errImg2').attr('style', 'font-size:12px');
            $('#image2').attr('style', 'border-color:red');
            condition = false;
        } else {
            $("#errImg2").text('');
            $('#image2').attr('style', 'border-color:#dee2e6');
        }
        //hình 3
        if (img3 === "") {
            $("#errImg3").text(' (*)Vui lòng nhập đường dẫn hình ảnh 3!');
            $('#errImg3').attr('style', 'font-size:12px');
            $('#image3').attr('style', 'border-color:red');
            condition = false;
        } else {
            $("#errImg3").text('');
            $('#image3').attr('style', 'border-color:#dee2e6');
        }
        //hình 4
        if (img4 === "") {
            $("#errImg4").text(' (*)Vui lòng nhập đường dẫn hình ảnh 4!');
            $('#errImg4').attr('style', 'font-size:12px');
            $('#image4').attr('style', 'border-color:red');
            condition = false;
        } else {
            $("#errImg4").text('');
            $('#image4').attr('style', 'border-color:#dee2e6');
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

//chinh sua san pham
$(document).ready(function () {
    $('#editProduct').submit(function (event) {

        var nameP = $('#nameProductEdit').val();
        var price = $('#priceProductEdit').val();
        var des = $('#desEdit').val();
        var delivery = $('#deliveryEdit').val();

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
        //tên sản phẩm
        if (nameP === "") {
            $("#errNamePEdit").text(' (*)Vui lòng nhập tên sản phẩm');
            $('#errNamePEdit').attr('style', 'font-size:12px');
            $('#nameProductEdit').attr('style', 'border-color:red');
            condition = false;

        } else {
            $("#errNamePEdit").text('');
            $('#nameProductEdit').attr('style', 'border-color:#dee2e6');
        }
        //giá nhập
        if (price === "") {
            $("#errPriceEdit").text(' (*)Vui lòng nhập giá sản phẩm!');
            $('#errPriceEdit').attr('style', 'font-size:12px');
            $('#priceProductEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errPriceEdit").text('');
            $('#priceProductEdit').attr('style', 'border-color:#dee2e6');
        }
        //van chuyen
        if (delivery === "") {
            $("#errDeliveryEdit").text(' (*)Vui lòng nhập giá bán!');
            $('#errDeliveryEdit').attr('style', 'font-size:12px');
            $('#deliveryEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errDeliveryEdit").text('');
            $('#deliveryEdit').attr('style', 'border-color:#dee2e6');
        }
        //mô tả
        if (des === "") {
            $("#errDesEdit").text(' (*)Vui lòng nhập mô tả sản phẩm!');
            $('#errDesEdit').attr('style', 'font-size:12px');
            $('#desEdit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errDesEdit").text('');
            $('#desEdit').attr('style', 'border-color:#dee2e6');
        }
        //hình 1
        if (img1 === "") {
            $("#errImg1Edit").text(' (*)Vui lòng nhập đường dẫn hình ảnh 1!');
            $('#errImg1Edit').attr('style', 'font-size:12px');
            $('#image1Edit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errImg1Edit").text('');
            $('#image1Edit').attr('style', 'border-color:#dee2e6');
        }
        //hình 2
        if (img2 === "") {
            $("#errImg2Edit").text(' (*)Vui lòng nhập đường dẫn hình ảnh 2!');
            $('#errImg2Edit').attr('style', 'font-size:12px');
            $('#image2Edit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errImg2Edit").text('');
            $('#image2Edit').attr('style', 'border-color:#dee2e6');
        }
        //hình 3
        if (img3 === "") {
            $("#errImg3Edit").text(' (*)Vui lòng nhập đường dẫn hình ảnh 3!');
            $('#errImg3Edit').attr('style', 'font-size:12px');
            $('#image3Edit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errImg3Edit").text('');
            $('#image3Edit').attr('style', 'border-color:#dee2e6');
        }
        //hình 4
        if (img4 === "") {
            $("#errImg4Edit").text(' (*)Vui lòng nhập đường dẫn hình ảnh 4!');
            $('#errImg4Edit').attr('style', 'font-size:12px');
            $('#image4Edit').attr('style', 'border-color:red');
            condition = false;
        }
        else{
            $("#errImg4Edit").text('');
            $('#image4Edit').attr('style', 'border-color:#dee2e6');
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
})
//chinh sua danh muc
$(document).ready(function () {
    $('#cateEdit').submit(function (event) {
        var nameCate = $('#nameCateEdit').val();
        if (nameCate === "") {
            $("#errNameCate").text(' (*)Vui lòng nhập danh mục!');
            condition = false;
        }
        else{
            $('#errNameCate').attr('style', 'border-color:#dee2e6');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
})
// them danh muc
$(document).ready(function () {
    $('#add-Cate').submit(function (event) {
        var nameCate = $('#nameCateEdit').val();
        if (nameCate === "") {
            $("#errNameCateAdd").text(' (*)Vui lòng nhập danh mục mới!');
            condition = false;
        }
        else{
            $('#errNameCateAdd').attr('style', 'border-color:#dee2e6');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
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
            condition = false;
        }
        else{
            $("#errNameSupEdit").text('');

        }
        // dia chi nha cung cap
        if (address === "") {
            $("#errAddEdit").text(' (*)Vui lòng nhập địa chỉ nhà cung cấp!');

            condition = false;
        }
        else{
            $("#errAddEdit").text('');
        }
        //so dien thoai
        if (phone === "") {
            $("#errphoneNumberSupEdit").text(' (*)Vui lòng nhập số điện thoại nhà cung cấp!');
            condition = false;
        }else if(!phone.match(tellReg)){
            $("#errphoneNumberSupEdit").text(' (*)Số điện thoại không hợp lệ!');
            condition = false;
        }
        else{
            $("#errphoneNumberSupEdit").text('');
        }
        //email
        if (email === "") {
            $("#errEmailSupEdit").text(' (*)Vui lòng nhập Email nhà cung cấp!');
            condition = false;
        }else if(!email.match(emailReg)){
            $("#errEmailSupEdit").text(' (*)Email không hợp lệ!');
            condition = false;
        }
        else{
            $("#errEmailSupEdit").text('');
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
            condition = false;
        }
        else{
            $("#errNameSupAdd").text('');
        }
        // dia chi nha cung cap
        if (address === "") {
            $("#errAddressSupAdd").text(' (*)Vui lòng nhập địa chỉ nhà cung cấp!');
            condition = false;
        }
        else{
            $("#errAddressSupAdd").text('');
        }
        //so dien thoai
        if (phone === "") {
            $("#errphoneSupAdd").text(' (*)Vui lòng nhập số điện thoại nhà cung cấp!');
            condition = false;
        }else if(!phone.match(tellReg)){
            $("#errphoneSupAdd").text(' (*)Số điện thoại không hợp lệ!');
            condition = false;
        }
        else{
            $("#errphoneSupAdd").text('');
        }
        //email
        if (email === "") {
            $("#errEmailSupAdd").text(' (*)Vui lòng nhập Email nhà cung cấp!');

            condition = false;
        }else if(!email.match(emailReg)){
            $("#errEmailSupAdd").text(' (*)Email không hợp lệ!');
            condition = false;
        }
        else{
            $("#errEmailSupAdd").text('');
        }
        if (condition) {
            $(this).submit();
        }
        event.preventDefault();

    })
})




