<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Авторизация</title>

    <!-- Bootstrap -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- iCheck -->
    <link href="/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/css/custom.min.css" rel="stylesheet">
</head>

<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form role="form" action="/login" method="post">
                    <h1>Авторизация</h1>
                    <div>
                        <input  class="form-control" placeholder="Username" type="email" name="username" id="username" required autofocus />
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="Password" name="password" id="password" required />
                    </div>
                    <div>
                        <button class="btn btn-default submit" type="submit">Войти</button>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">Не зарегестрированы?
                            <a href="#signup" class="to_register"> Создать аккаунт </a>
                        </p>

                        <div class="clearfix"></div>
                        <br />
                    </div>
                </form>
            </section>
        </div>

        <div id="register" class="animate form registration_form">
            <section class="login_content">
                <form method="post" action="/register">
                    <h1>Создание аккаунта</h1>
                    <div>
                        <input name="email" type="email" class="form-control" placeholder="Email" required="" />
                    </div>
                    <div>
                        <input name="password" type="password" class="form-control" placeholder="Password" required="" />
                    </div>
                    <div>
                        <button type="submit" class="btn btn-default submit" >Отправить</button>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">Уже отправили?
                            <a href="#signin" class="to_register"> Войти </a>
                        </p>

                        <div class="clearfix"></div>
                        <br />

                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>
