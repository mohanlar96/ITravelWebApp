<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--    handlebar.js for handling the infinite scroll templating html--%>
<script src="js/vendor/handlebars.js"></script>


<script id="postTemplate" type="text/x-handlebars-template">
    {{#each this}}
        <h1>{{postID}} == {{postDate}}</h1>

    {{/each}}
</script>