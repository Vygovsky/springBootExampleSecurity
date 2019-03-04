<#import "parts/common.ftl" as c>
<@c.page>

User edit
<form action="/user" method="post">
    <input type="text" value="${user.name}" name="name">
    <#list roles as role>
        <div>
           <label> <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("cheked", " ")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button type="submit">Save</button>
</form>
</@c.page>