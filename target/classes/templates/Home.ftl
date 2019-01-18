<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta charset="utf-8">

<@c.page>
<body class="bg-light">
<main role="main">
<div class="jumbotron">
    <div class="container">
    <#if known>
       <h1 class="display-3">Hello, ${name}!</h1>
    <#else>
        <h1 class="display-3">Hello, guest!</h1>
    </#if>
        <p class="lead my-3"><em>
            Welcome to the recipe book! This is a unique forum where you can find any recipe and please your friends and loved ones with culinary excellence, as well as share your own secrets with other forum participants. Have a great time!
        </em></p>

        <h5 class="text-right">Regards, K. Shprints</h5>
    </div>

</div>



<div class="mb-0"><h1 class="h3  text-center">
    <h1>
        <i>List of recipes</i>
    </h1>
    <footer class="pt-4 my-md5 pt-md-3 border-top"></footer>
    <p class="lead my-3">
        <em>
            Secrets of culinary excellence here:
        </em>
    </p>
    </h1></div>
    <div class="row">
    <div class="my-3 p-3 bg-white rounded shadow-sm col-md-8 blog-name">
    <#list summs1 as s>
        <div class="media text-muted pt-3">
            <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" style="width: 32px; height: 32px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1679dfad5aa%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1679dfad5aa%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2211.546875%22%20y%3D%2216.9%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <strong class="d-block text-gray-dark"><a href="/home/${s.id}"><u><em>${s.title}</em></u></a></strong>
                <em>Main ingredients: ${s.number}</em>
                <br>
                ${s.descript}
        </p>
            </p>
        </div>
    </#list>
    </div>
    <aside class="col-md-4 blog-sidebar">
        <div class="p-3 mb-3 bg-light rounded">
            <h4 class="font-italic">About</h4>
            <p class="mb-0"><em>“The discovery of a new dish does more for the happiness of the human race than the discovery of a star.”
                </em></p>
            <h6 class="text-right">Jean Anthelme Brillat-Savarin</h6>
        </div>
        <div class="p-3">
            <h4 class="font-italic">Tags</h4>
            <ol class="list-unstyled mb-0">
                <#list summs1 as s>
           <#list s.tags as tag>
               <li><a href="/home/${s.id}" style="font-size:18px;"><i>${tag.tags}</i> </a>
        </li>
           </#list>
                </#list>
            </ol>
        </div>



            </aside>
    </div>
    <p></p>
    <footer class="pt-4 my-md5 pt-md-3 border-top"></footer>
<footer class="footer">
    <div class="container text-center">
        © Company 2019. Shprints Konstantsin
    </div>
</footer>
</main>
</body>

</@c.page>