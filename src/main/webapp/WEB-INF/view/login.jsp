<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Форма авторизации</title>
    <link rel="stylesheet" href="<c:url value="/resources/static/css/bootstrap.min.css"/>">
    <script src="<c:url value="/resources/static/js/bootstrap.min.js"/>"></script>
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

</head>
<body>
<style>
    html,
    body,
    .container {
        height: 100%;
    }

    .login-form {
        border-radius: 10px;
        box-shadow: 0 0 5px #aaa;
        padding: 10px 20px;
        position: relative;
        height: 200px;
        width: 400px;
        top: 50%;
        margin: -100px auto 0 auto;
    }
</style>
<div class="container">
    <div class="login-form">
        <form action="login" method="POST">
            <div class="form-group">
                <label for="login">Логин</label>
                <input id="login" type="text" name="username" class="form-control">
            </div>
            <div class="form-group">
                <label for="pass">Пароль</label>
                <input id="pass" type="password" name="password" class="form-control">
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </div>
            <div class="form-group">
                <input type="submit" value="Войти" class="btn btn-primary pull-right">
            </div>
        </form>
    </div>
</div>
</body>
</html>


</body>
</html>
