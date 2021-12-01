<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Weather</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).on("click", "#button", function () {
            $.post("/weather?city=" + document.getElementById("city").value, function (responseText) {
                document.getElementById('result').innerHTML =
                    '<p>' +
                        '<label> City: </label>' + JSON.parse(responseText)['name'] +
                    '</p>' +

                    '<p>' +
                        '<label> Temp: </label>' + JSON.parse(responseText)['temp'] +
                    '</p>' +

                    '<p>' +
                        '<label> Max temp: </label>' + JSON.parse(responseText)['temp_max'] +
                    '</p>' +

                    '<p>' +
                        '<label> Min temp: </label>' + JSON.parse(responseText)['temp_min'] +
                    '</p>' +

                    '<p>' +
                        '<label> Feels like: </label>' + JSON.parse(responseText)['feels_like'] +
                    '</p>' +

                    '<p>' +
                        '<label> Wind speed: </label>' + JSON.parse(responseText)['wind_speed'] +
                    '</p>'
            });
        });
    </script>
</head>
<body>
<form>
    <p class="lead">
        <input name="city" type="text" id="city" placeholder="City"><br>
    </p>
    <p class="lead">
        <input type="button" value="get predict" id="button">
    </p>
</form>
<br>
<div id="result"></div>
</body>
</html>