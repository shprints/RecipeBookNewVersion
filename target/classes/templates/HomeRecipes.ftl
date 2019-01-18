<#import "parts/common.ftl" as c>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
    <script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<@c.page>
<body class="bg-light">
<form action="/home" method="post">
    <p class="container">

    <div class="text-center"> <h3><em><u>${summ.title}</u></em></h3></div>
    <div class="col-9 " style="display: inline-block">
        <div>
            <img class="img-fluid rounded float-left text-center" style="width: 300px; height: 200px; border: solid 4px #FFCC00" src="${summ.imageURL?if_exists}" alt="No image available">
        </div>
        <div style="margin-left: 350px;">
            Description: ${summ.descript}
            <br>Main ingredients: ${summ.number}
        </div>
    </div>


    <p></p>
    <br>
<style>
    p{
        text-align: justify;
    }
</style>
        <p>
            <script>
                $(document).ready(function () {
                    createMarkdown(document.getElementById("area"));
                    function createMarkdown(textarea) {
                        simplemde = new SimpleMDE({
                            element: textarea
                        })}
                });
            </script>
            <br> <div class="form-group text-left">
    <textarea class="form-control" id="area" rows="3" name="text">${summ.text}</textarea>
</div>
    </p>
    <br>
    <br>
        <div class="text-center">
                   <#if summ.filename??>
                       <img src="/img/${summ.filename}">
                   </#if>
        </div>
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