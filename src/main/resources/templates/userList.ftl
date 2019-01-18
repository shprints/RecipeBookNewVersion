<#import "parts/common.ftl" as c>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta charset="utf-8">

<@c.page>
<body class="bg-light">
<div class="list-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
<h1 class="display-4">
    List of users</h1>
    <p></p>
    <p class="lead"> <button class="btn btn-outline-primary" onclick="onClickBtnDelete()">Delete</button>
    <button onclick="onClickBtnBlock()" class="btn btn-outline-primary">Block</button>
        <button onclick="onClickBtnUnBlock()" class="btn btn-outline-primary">UnBlock</button></p>
</div>
    <table class="table table-striped" id="table-set">
    <caption>List of users</caption>
    <thead>
    <tr>
        <th scope="col"><button onclick="onClickBtnAll()" class="btn btn-outline-primary">All</button></th>
        <th scope="col">Name</th>
        <th scope="col">Role</th>
        <th scope="col">Edit</th>
        <th scope="col">DateReg</th>
        <th scope="col">DateLastSeen</th>
        <th scope="col">Active</th>

    </tr>
    </thead>
    <tbody>
    <#list users as user>
    <tr>
        <th>
            <input type="checkbox" value="${user.id}">
        </th>
        <td><u><a href="/user/User/${user.id}">${user.username}</a></u></td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td><a href="/user/${user.id}">edit</a></td>
        <td>${user.dateReg}</td>
        <td>${user.dateLastSeen}</td>
        <td>${user.active?c}</td>
    </tr>
    </#list>
    <script>
        var checkVar = false;
        function onClickBtnAll(){
            if (checkVar == false) {
                $('body input:checkbox').prop('checked', true);
                checkVar = !checkVar;
            } else {
                $('body input:checkbox').prop('checked', false);
                checkVar = !checkVar;
            }

        }
        function getArrayIdUser(){
            arrayIdUser = [];
            $('input:checkbox:checked').each(function(){
                arrayIdUser.push($(this).val());
            });
            return arrayIdUser;
        }
    </script>

    <script>
        function onClickBtnDelete(){
            idUsers = getArrayIdUser();
            $.ajax({
                url: '/delete',
                dataType: 'json',
                data: JSON.stringify(idUsers),
                contentType: "application/json",
                type: 'post',
                success: function(settings){
                    if(settings=="1") {
                        window.location.reload()
                    }else{
                        document.location.href = "http://localhost:8080/login?logout";
                    }
                }
            });
        }
    </script>

    <script>
        function onClickBtnBlock(){
            idUsers = getArrayIdUser();
            $.ajax({
                url: '/update',
                dataType:'json',
                data: JSON.stringify(idUsers),
                contentType: "application/json",
                type: 'post',
                success: function(settings){
                    if (settings=="1") {
                        window.location.reload();
                    } else {
                        document.location.href = "http://localhost:8080/login?logout";
                    }
                }
            });
        }
    </script>

    <script>
        function onClickBtnUnBlock(){
            idUsers = getArrayIdUser();
            $.ajax({
                url: '/updatee',
                dataType:'json',
                data: JSON.stringify(idUsers),
                contentType: "application/json",
                type: 'post',
                success: function(settings){
                    if (settings=="1") {
                        window.location.reload();
                    } else {
                        document.location.href = "http://localhost:8080/login?logout";
                    }
                }
            });
        }
    </script>
    </tbody>
</table>
<footer class="pt-4 my-md5 pt-md-3 border-top"></footer>
<footer class="footer">
    <div class="container text-center">
        © Company 2017-2018
    </div>
</footer>
</body>
</@c.page>