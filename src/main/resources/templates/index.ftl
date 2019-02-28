<#import "parts/common.ftl" as c>
<#import  "parts/login.ftl" as l>
<@c.page>
<div>

</div>
    <@l.logout/>
<div>
    <form method="post">
        <input type="text" name="text" placeholder="Введите сообщение">
        <input type="text" name="tag" placeholder="Тег">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">addText</button>
    </form>
</div>

<div>Список сообщений</div>
<div>
    <form method="get" action="/index">
        <input type="text" name="filter" value="${filter}">
        <button type="submit">Search</button>
    </form>
</div>

    <#list  messages as message>
<div>
    <b>${message.id}</b>
    <span>${message.text}</span>
    <b>${message.tag}</b>
    <strong>${message.userName}</strong>
</div>
    <#else>
No messages
    </#list>
</@c.page>