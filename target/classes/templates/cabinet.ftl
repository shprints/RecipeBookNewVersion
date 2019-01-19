<#import "parts/common.ftl" as c>
<#include "parts/login.ftl">
<#include "parts/security.ftl">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta charset="utf-8">
<@c.page>
    <#if theme=="Fruit">
        <body background="../static/fruitfon.jpg" style="background-size: 100%;">
    <#else>
        <#if theme=="Vegetables">
            <body background="../static/vegfon.jpg" style="background-size: 100%;">
        <#else>
                <body class="bg-light">
        </#if>
    </#if>
<div class="list-header px-3 py-3 pt-md-5 pb-md-4 mx-auto">
    <#if language=="Russian">
     <h1 class="display-6">
         <em>Личный кабинет</em></h1>
    <#else>
    <h1 class="display-6">
        <em>Personal Area</em></h1>
    </#if>

    <#if language=="Russian">
     <p class="lead  my-1">
         <em>
             На этой странице вы можете создавать новые рецепты, удалять и изменять их.
         </em>
     </p>
    <#else>
    <p class="lead  my-1">
        <em>
            On this page you can create new recipes, and delete them, edit existing notes.
        </em>
    </p>
    </#if>
    <footer class="pt-4 my-md5 pt-md-3 border-top"></footer>
    <#if language=="Russian">
    <div class="mb-0"><h2 class="h3">
        <i>Поиск по заголовку</i></h2>
        <label></label>
    <#else>
    <div class="mb-0"><h2 class="h3">
        <i>Search by title</i></h2>
        <label></label>
    </#if>
    <#if language=="Russian">
    <form method="post" action="/Filter" class="form-inline my-2 my-lg-2">
        <input type="text" name="ffilterr" class="form-control mr-sm-2" placeholder="Поиск"  size="60%">
        <button type="submit" class="btn btn-primary">Поиск</button>
    </form>
    <#else>
    <form method="post" action="/Filter" class="form-inline my-2 my-lg-2">
        <input type="text" name="ffilterr" class="form-control mr-sm-2" placeholder="Search"  size="60%">
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
    </#if>

    <#if language=="Russian">
    <p class="lead  my-3">
        <a href="/NewRecipe" class="btn btn-outline-primary">Создать рецепт</a>
        <button onclick="onClickBtnDeleteSummery()" class="btn btn-outline-primary">Удалить</button>
        <a class="btn btn-outline-primary" href="/user/profile">Изменить профиль</a>
    </p>
    <#else>
    <p class="lead  my-3">
    <a href="/NewRecipe" class="btn btn-outline-primary">Create of recipe</a>
        <button onclick="onClickBtnDeleteSummery()" class="btn btn-outline-primary">Delete</button>
        <a class="btn btn-outline-primary" href="/user/profile">Edit profile</a>
    </p>
    </#if>
    </div>
    <table class="table table-striped" id="table-set">

        <thead>
        <tr>
    <#if language=="Russian">
            <th>
                <button onclick="onClickBtnAllSummeries()" class="btn btn-outline-primary">Все</button>
            </th>
            <th scope="col">Заголовок</th>
            <th scope="col">Описание</th>
            <th scope="col">Основные ингредиенты</th>
            <th scope="col">Рейтинг</th>
            <th scope="col">Тэг</th>
    <#else>
            <th>
                <button onclick="onClickBtnAllSummeries()" class="btn btn-outline-primary">All</button>
            </th>
            <th scope="col">Title</th>
            <th scope="col">Descript</th>
            <th scope="col">Main ingredients</th>
            <th scope="col">Rating</th>
            <th scope="col">Tags</th>
        </tr>
    </#if>
        </thead>
        <tbody>
    <#list summs as s>
    <tr>
        <th>
            <input type="checkbox" value="${s.id}">
        </th>
        <td><a href="/Recipes/Page/${s.id}"><u><em>${s.title}</em></u></a></td>
        <td>${s.descript}</td>
        <td>${s.number}</td>
        <td>
        <#if s.getRatings() == 0>
            <#if language=="Russian">
            <p>без рейтинга</p>
            <#else>
            <p>without rating</p>
            </#if>
        <#else>
            ${s.getRatings()} out of 5.0
        </#if>
        </td>
    <td><#list s.tags as tag>
        <a href="/Recipes/Page/${s.id}">${tag.tags} </a>
    <#else >
                No tags
    </#list>
    </td>
    </tr>
    </#list>
        <script>
            var checkVar = false;
            function onClickBtnAllSummeries(){
                if (checkVar == false) {
                    $('body input:checkbox').prop('checked', true);
                    checkVar = !checkVar;
                } else {
                    $('body input:checkbox').prop('checked', false);
                    checkVar = !checkVar;
                }
            }
            function getArrayIdSummeries(){
                arrayIdSummeries = [];

                $('input:checkbox:checked').each(function(){
                    arrayIdSummeries.push($(this).val());
                });

                return arrayIdSummeries;
            }
        </script>

        <script>
            function onClickBtnDeleteSummery(){
                idSummeries = getArrayIdSummeries();

                $.ajax({
                    url: '/deletesummeries',
                    dataType: 'json',
                    data: JSON.stringify(idSummeries),
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

        </tbody>
    </table>

</form>
    <footer class="pt-4 my-md5 pt-md-3 border-top"></footer>
    <footer class="footer">
    <#if language=="Russian">
        <div class="container text-center">
            © Компания 2019. Шпринц Константин
        </div>
    <#else>
        <div class="container text-center">
            © Company 2019. Shprints Konstantsin
        </div>
    </#if>
    </footer>
</body>
</div>
</@c.page>