/*
 Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
!function(){function t(t,e){var r;try{r=t.getSelection().getRanges()[0]}catch(i){return null}return r.shrink(CKEDITOR.SHRINK_TEXT),t.elementPath(r.getCommonAncestor()).contains(e,1)}function e(e,n){var l=e.lang.liststyle;if("bulletedListStyle"==n)return{title:l.bulletedTitle,minWidth:300,minHeight:50,contents:[{id:"info",accessKey:"I",elements:[{type:"select",label:l.type,id:"type",align:"center",style:"width:150px",items:[[l.notset,""],[l.circle,"circle"],[l.disc,"disc"],[l.square,"square"]],setup:function(t){t=t.getStyle("list-style-type")||r[t.getAttribute("type")]||t.getAttribute("type")||"",this.setValue(t)},commit:function(t){var e=this.getValue();e?t.setStyle("list-style-type",e):t.removeStyle("list-style-type")}}]}],onShow:function(){var e=this.getParentEditor();(e=t(e,"ul"))&&this.setupContent(e)},onOk:function(){var e=this.getParentEditor();(e=t(e,"ul"))&&this.commitContent(e)}};if("numberedListStyle"==n){var a=[[l.notset,""],[l.lowerRoman,"lower-roman"],[l.upperRoman,"upper-roman"],[l.lowerAlpha,"lower-alpha"],[l.upperAlpha,"upper-alpha"],[l.decimal,"decimal"]];return(!CKEDITOR.env.ie||7<CKEDITOR.env.version)&&a.concat([[l.armenian,"armenian"],[l.decimalLeadingZero,"decimal-leading-zero"],[l.georgian,"georgian"],[l.lowerGreek,"lower-greek"]]),{title:l.numberedTitle,minWidth:300,minHeight:50,contents:[{id:"info",accessKey:"I",elements:[{type:"hbox",widths:["25%","75%"],children:[{label:l.start,type:"text",id:"start",validate:CKEDITOR.dialog.validate.integer(l.validateStartNumber),setup:function(t){t=t.getFirst(i).getAttribute("value")||t.getAttribute("start")||1,this.setValue(t)},commit:function(t){var e=t.getFirst(i),r=e.getAttribute("value")||t.getAttribute("start")||1;t.getFirst(i).removeAttribute("value");var n=parseInt(this.getValue(),10);for(isNaN(n)?t.removeAttribute("start"):t.setAttribute("start",n),t=e,e=r,n=isNaN(n)?1:n;(t=t.getNext(i))&&e++;)t.getAttribute("value")==e&&t.setAttribute("value",n+e-r)}},{type:"select",label:l.type,id:"type",style:"width: 100%;",items:a,setup:function(t){t=t.getStyle("list-style-type")||r[t.getAttribute("type")]||t.getAttribute("type")||"",this.setValue(t)},commit:function(t){var e=this.getValue();e?t.setStyle("list-style-type",e):t.removeStyle("list-style-type")}}]}]}],onShow:function(){var e=this.getParentEditor();(e=t(e,"ol"))&&this.setupContent(e)},onOk:function(){var e=this.getParentEditor();(e=t(e,"ol"))&&this.commitContent(e)}}}}var i=function(t){return t.type==CKEDITOR.NODE_ELEMENT&&t.is("li")},r={a:"lower-alpha",A:"upper-alpha",i:"lower-roman",I:"upper-roman",1:"decimal",disc:"disc",circle:"circle",square:"square"};CKEDITOR.dialog.add("numberedListStyle",function(t){return e(t,"numberedListStyle")}),CKEDITOR.dialog.add("bulletedListStyle",function(t){return e(t,"bulletedListStyle")})}();