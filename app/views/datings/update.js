$("#article_datings_list").replaceWith("<%= escape_javascript(render(:partial => 'datings/list', locals: {article: @article})) %>");
$("#article_datings_form").replaceWith("<%= escape_javascript(render(:partial => 'datings/remote_form', locals: {article: @article, dating: Dating.new})) %>");
new Noty({
    type: 'success',
    theme    : 'relax',
    timeout: 2000,
    layout: 'bottomLeft',
    text: '<%=t :updated_successfully%>'
}).show();
