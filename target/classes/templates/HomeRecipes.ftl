<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
    <script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<@c.page>
    <#if !known>
        <body class="bg-light">
    <#else>
        <#if theme=="Fruit">
            <body background="../static/fruit.jpg" style="background-size: 100%;">
        <#else>
            <#if theme=="Vegetables">
                <body background="../static/vegetables.jpg" style="background-size: 100%;">
            <#else>
                    <body class="bg-light">
            </#if>
        </#if>
    </#if>

<form action="/home" method="post">
    <p class="container">
    <#if !known>
        <div class="col-9 " style="display: inline-block">
    <#else>
        <#if theme=="Fruit">
        <div class="col-9 rounded" style="display: inline-block; background: url(../static/fruitBackground.jpg);">
        <#else>
            <#if theme=="Vegetables">
            <div class="col-9 rounded" style="display: inline-block; background: url(../static/vegetablesBackground.jpg);">
            <#else>
                <div class="col-9 rounded" style="display: inline-block; ">
            </#if>
        </#if>
    </#if>

    <div class="text-center"> <h2><u>${summ.title}</u></h2></div>
        <div>
             <#if summ.imageURL!="">
                 <img  class="img-fluid rounded float-left text-center" style="width: 300px; height: 200px; border: solid 4px #FFCC00" src="${summ.imageURL?if_exists}" >
             <#else>
             <img  class="img-fluid rounded float-left text-center" style="width: 300px; height: 200px; border: solid 4px #FFCC00" src="http://vollrath.com/ClientCss/images/VollrathImages/No_Image_Available.jpg" >
             </#if>
        </div>
        <div style="margin-left: 350px;">
            <b>Description:</b> ${summ.descript}
            <br><b>Main ingredients:</b> ${summ.number}
    </div>
    </div>


    <p></p>
    <div>
        <p></p>
        <style>
            p{
                text-align: justify;
            }
        </style>
        <p class="text-left" ">
        <script>
            $(document).ready(function () {
                createMarkdown(document.getElementById("area"));
                function createMarkdown(textarea) {
                    simplemde = new SimpleMDE({
                        element: textarea
                    })}
            });
        </script>
    <#if !known>
        <br> <div class="form-group text-left" >
        <textarea class="form-control" id="area" rows="3" name="text" >${summ.text}</textarea>
    </div>
    <#else>
        <#if theme=="Fruit">
        <br> <div class="form-group text-left" style="background: url(../static/fruitBackground.jpg);">
            <textarea class="form-control" id="area" rows="3" name="text" >${summ.text}</textarea>
        </div>
        <#else>
            <#if theme=="Vegetables">
            <br> <div class="form-group text-left" style="background: url(../static/vegetablesBackground.jpg);">
                <textarea class="form-control" id="area" rows="3" name="text" >${summ.text}</textarea>
            </div>
            <#else>
                <br> <div class="form-group text-left" >
                <textarea class="form-control" id="area" rows="3" name="text" >${summ.text}</textarea>
            </div>
            </#if>
        </#if>
    </#if>

        </p>

    </div>
    <br>
    <br>

        <aside class="col-md-4 blog-sidebar">
        </aside>
    <p></p>
    <br>
    <div class="text-center">
    <a href="/home"><u>Return</u></a>
    </div>
    </div>
</form>
</body>
</@c.page>