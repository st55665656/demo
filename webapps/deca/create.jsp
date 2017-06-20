<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>建立帳號</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function() {
		$('#account').blur(function() {
			var nameVal = $('#account').val();
			if($('#account').val().length == 0) {
				$('#accgroup').attr('class', 'form-group has-error');
			}else{
				$.post("validate.jsp",
				{account:nameVal},
				function(response){
				if (response.trim()=="OK"){
					$('#accgroup').attr('class', 'form-group has-success');
				}else{
					$('#accgroup').attr('class', 'form-group has-error');
				}
				});
			}
		});
		$('#account').focus(function() {
			$('#accgroup').attr('class', 'form-group');
		});

		$('#confirm').blur(function() {
			if($('#confirm').val()!= $('#password').val()) {
			$('#congroup').attr('class', 'form-group has-error');
			}else{
				$('#congroup').attr('class', 'form-group has-success');
			}
		});
		$('#confirm').focus(function() {
			$('#congroup').attr('class', 'form-group');
		});

		$('form').submit(function (e) {
			if($('#confirm').val()!= $('#password').val()) {
			alert('submit intercepted');
			e.preventDefault(e);
			}
		});
	});
	</script>
	<style>
	li > a{
	color: white;
}
	body{font-family:微軟正黑體;list-style-type:none;}
	</style>
</head>
<body>
<div class="container-fluid" style="background-color:#00b2f5;height:20px;">
<div class="container">
<div class="row" style="color:white;">
	<div class="col-md-9">
		<p>【宅配單筆滿$1500免運(大型商品除外)，7-11取貨滿$699免運，門市取貨全面免運】 建議使用Chrome瀏覽器登入註冊</p>
	</div>
	<div class="col-md-3">
		<ul class="list-unstyled">
			<li><a href="create.jsp" style="float: right;">註冊</a></li>
			<li><a href="login.jsp" style="float: right;">登入</a></li>
		</ul>
	</div>
</div>
</div>
</div>
<div class="container" style="background-color:black;color:#fff;height:60px;">
<div style="margin-top: 11px;"><a href="index.jsp"><img src="logo.jpg"></a></div>
</div>
<br><br>
<div class="row">
	<div class="container">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="panel panel-primary">
				<div class="panel-heading"style="font-size:20px">我的帳號</div>
					<form action="insert.jsp" method="POST" id="form1"style="text-align:center;vertical-align:middle">
						<div class="form-group" id="accgroup">
							<label for="account"style="font-size:18px; padding:10px">電子信箱 (範例: xxx@gmail.com)*</label>
							<center><input type="email" class="form-control" name="account" id="account" style="width:80%;" required/></center>
						</div>
						<div class="form-group">
							<label for="password"style="font-size:18px; padding:10px">密碼*</label>
							<center><input type="password" class="form-control" name="password" id="password" style="width:80%;" required/></center>
						</div>
						<div class="form-group" id="congroup">
							<label for="confirm" style="font-size:18px; padding:10px">確認密碼*</label>
							<center><center><input type="password" class="form-control" name="confirm" id="confirm" style="width:80%;" required/></center>
						</div>
						<button class="btn btn-primary btn-lg" type="submit" form="form1"  id="subbtn" style="margin-left:10px;width:100px">確認</button>
					</form>
				<div class="panel-body">
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</div>
</body>
</html>
