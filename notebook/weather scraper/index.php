<!DOCTYPE html>
<html>
    <head>
	
        <title>Weather Scraper Project</title>
        <meta charset="utf-8" />
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
		
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <style>
    .container {
    background-image:url("background.jpg");
    width:100%;
    height:100%;
    background-size:cover;
    background-positon:center;
    padding-top:150px;
}
    html, body {
        height:100%;
        width:100%;
    }
.center {
    text-align:center;
 }
.white {
        color:white;
 }
p{
    padding-top:15px;
    padding-bottom:15px;
}

button {
    margin-top:20px;
}
.alert {
    margin-top:20px;
    display:none;
}
    </style>
	</head>
	<body>
    <div class="container">
    <div class="row">
    <div class="col-md-6 col-md-offset-3 center">
<h1 class="center white">Weather Finder Project</h1>
        <p class="center white lead">Enter your city below to get a weather forecast.</p>
        <div class="formgroup">
        <input name="city" type="text" class="form-control" id="city" placeholder="Eg. London, Paris, San Francisco..." />
</div>
    <button class="btn btn-lg btn-success center" id="findMyWeather">Find My Weather</button>
        </form>
 

    <div id="success" class="alert alert-success"></div>
    <div id="fail" class="alert alert-danger">No data found for that city</div>
    <div id="noCity" class="alert alert-danger">Please enter a city</div>
    </div>
    </div>
    </div>
    
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script>
    $('#findMyWeather').click(function(event) {
        event.preventDefault();
        $(".alert").hide();
        if ($("#city").val()!="") {
            $.get("scraper.php?city="+$("#city").val(), function( data ) {
               
                if (data=="") {
                    $("#fail").fadeIn();
                } else {
                     $("#success").html(data).fadeIn();
                }
        });
        } else {
            $("#noCity").fadeIn();
        }
    });
    </script>
    </body>
</html>