<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kasya
  Date: 1/20/2017
  Time: 9:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>asd</title>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
            crossorigin="anonymous"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
          crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</head>

<body>
<style>
    html,
    body,
    .container {
        height: 100%;
    }

    .cabinet-header {
        padding: 10px 20px;
    }

    .header-container {
        padding: 20px;
    }

    .header {
        font-size: 24px;
    }
</style>
<div class="modal fade" id="addModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Добавить ученика</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="name">Имя студента</label>
                    <input id="name" class="form-control clear" type="text">
                </div>
                <div class="form-group">
                    <label for="surname">Фамилия студента</label>
                    <input id="surname" class="form-control clear" type="text">
                </div>
                <div class="form-group">
                    <label for="group">Группа</label>
                    <input id="group" class="form-control clear" type="text">
                </div>
                <div class="form-group">
                    <label for="study_mode">Форма обучения</label>
                    <select id="study_mode" class="form-control clear">
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                <button type="button" id="send" class="btn btn-primary">Отправить</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="header-container">
        <span class="header">Кабинет</span>
        <div class="add btn btn-primary pull-right">
            <i class="glyphicon glyphicon-plus"></i> Добавить
        </div>
        <div class="refresh btn btn-primary pull-right">
            <i class="glyphicon glyphicon-refresh"></i> Обновить список
        </div>
    </div>
    <div class="list-group"></div>
</div>
<script>
    (function ($) {
        refreshList();

        $(document).on('click', '.add', function (e) {
            $('#addModal').modal('show');
            var select = $('#study_mode');
            $.getJSON('<c:url value="/student/studyMode/list"/>', function (data) {
                var option = '';
                data.forEach(function (item) {
                    option += '<option value="' + item.id + '">' + item.name + '</option>';
                });
                select.html(option);
            })
        }).on('click', '.refresh', function (e) {
            refreshList();
        }).on('click', '#send', function (e) {
            var data = {
                name:$('#name').val(),
                surname:$('#surname').val(),
                group:$('#group').val(),
                study_mode_id:$('#study_mode').find(':selected').val()
            };
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            if (data) {
                $.ajax({
                    url: '<c:url value="/student/add"/>',
                    data: data,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success: function (data, textStatus, xhr) {
                        if (xhr.status == 200) {
                            refreshList();
                            showAlert($('.modal-body'), 'Успешно выполнено', 'success');
                            setTimeout(function () {
                                $('#addModal').modal('hide');
                                setTimeout(function () {
                                    hideAlert($('.modal-body'));
                                    $('.clear').val('');
                                }, 200);
                            }, 2000);
                        } else console.log(data);
                    },
                    error: function () {
                        showAlert($('.modal-body'), 'Возникла ошибка!', 'danger');
                    }
                });
            } else {
                showAlert($('.modal-body'), 'ФИО не указано', 'danger');
            }
        }).on('click', '.remove', function (e) {
            var listItem = $(this).closest('.list-group-item'),
                id = listItem.attr('id');

            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            $.ajax({
                url: '<c:url value="/student/delete/"/>' + id,
                type: 'delete',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: refreshList,
                error: function () {
                    showAlert($('.header-container'), 'Возникла ошибка!', 'danger');
                    setTimer(10000, function () {
                        hideAlert($('.header-container'))
                    });
                }
            });
        });

        function setTimer(time, callback) {
            if (window.lastTimeoutId)
                clearTimeout(window.lastTimeoutId);

            window.lastTimeoutId = setTimeout(function () {
                callback();
            }, time);
        }

        function showAlert(container, message, status) {
            var alert = container.children().filter('.alert');

            if (!alert.length) {
                alert = $('<div/>', {
                    class: 'alert'
                });
                container.prepend(alert);
            }

            alert.slideUp(200, function () {
                alert.attr('class', 'alert zoomalert alert-' + status)
                    .html(message).slideDown(200);
            });
        }

        function hideAlert(container) {
            var alert = container.children().filter('.alert');

            alert.slideUp(200);
        }

        function refreshList() {
            var list = $('.list-group');

            list.empty();

            list.append($('<div/>', {
                class: 'list-group-item'
            }).append($('<h4/>', {
                class: 'text-center list-group-item-heading'
            }).html('Загрузка...')));

            $.ajax({
                url: '<c:url value="/student/list"/>',
                success: generateList,
                error: function () {
                    showAlert($('.header-container'), 'При загрузке списка возникла ошибка!', 'danger');
                }
            });
        }

        function generateList(data) {
            var list = $('.list-group');

            list.empty();

            data.forEach(function (item) {
                var listItem = $('<div/>', {
                        class: 'list-group-item',
                        id: item.id
                    }),
                    row = $('<div/>', {
                        class: 'row'
                    }),
                    infoBlock = $('<div/>', {
                        class: 'col-md-10'
                    }),
                    fio = $('<h4/>', {
                        class: 'list-group-item-heading'
                    }),
                    extInfo = $('<p/>', {
                        class: 'list-group-item-text'
                    }),
                    remBlock = $('<div/>', {
                        class: 'col-md-2'
                    }),
                    remBtn = $('<div/>', {
                        class: 'remove btn btn-danger pull-right'
                    }).html('Удалить').prepend($('<i>', {
                        class: 'glyphicon glyphicon-remove'
                    }));
                var fio_ = item.surname + " " + item.name;
                console.log(item);
                listItem.append(row);
                row.append(infoBlock).append(remBlock);
                infoBlock.append(fio).append(extInfo);
                remBlock.append(remBtn);
                fio.html(fio_);
                extInfo.html("Группа: " + item.group
                    + '<br>' + "Форма обучения:" + item.studyMode.name);

                list.append(listItem);
            });
        }
    })(jQuery);
</script>
</body>

</html>
