$("#article_originatings_list").replaceWith("<%= escape_javascript(render(:partial => 'originatings/list', locals: {article: @article})) %>");
$("#article_originatings_form").replaceWith("<%= escape_javascript(render(:partial => 'originatings/remote_form', locals: {article: @article, originating: Originating.new})) %>");
new Noty({
    type: 'success',
    theme    : 'relax',
    timeout: 2000,
    layout: 'bottomLeft',
    text: '<%=t :added_successfully%>'
}).show();
