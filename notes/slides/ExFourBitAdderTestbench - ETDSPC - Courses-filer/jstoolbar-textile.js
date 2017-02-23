function jsToolBar(e){if(!document.createElement){return}if(!e){return}if(typeof document["selection"]=="undefined"&&typeof e["setSelectionRange"]=="undefined"){return}this.textarea=e;this.editor=document.createElement("div");this.editor.className="jstEditor";this.textarea.parentNode.insertBefore(this.editor,this.textarea);this.editor.appendChild(this.textarea);this.toolbar=document.createElement("div");this.toolbar.className="jstElements";this.editor.parentNode.insertBefore(this.toolbar,this.editor);if(this.editor.addEventListener&&navigator.appVersion.match(/\bMSIE\b/)){this.handle=document.createElement("div");this.handle.className="jstHandle";var t=this.resizeDragStart;var n=this;this.handle.addEventListener("mousedown",function(e){t.call(n,e)},false);window.addEventListener("unload",function(){var e=n.handle.parentNode.removeChild(n.handle);delete n.handle},false);this.editor.parentNode.insertBefore(this.handle,this.editor.nextSibling)}this.context=null;this.toolNodes={}}function jsButton(e,t,n,r){if(typeof jsToolBar.strings=="undefined"){this.title=e||null}else{this.title=jsToolBar.strings[e]||e||null}this.fn=t||function(){};this.scope=n||null;this.className=r||null}function jsSpace(e){this.id=e||null;this.width=null}function jsCombo(e,t,n,r,i){this.title=e||null;this.options=t||null;this.scope=n||null;this.fn=r||function(){};this.className=i||null}jsButton.prototype.draw=function(){if(!this.scope)return null;var e=document.createElement("button");e.setAttribute("type","button");e.tabIndex=200;if(this.className)e.className=this.className;e.title=this.title;var t=document.createElement("span");t.appendChild(document.createTextNode(this.title));e.appendChild(t);if(this.icon!=undefined){e.style.backgroundImage="url("+this.icon+")"}if(typeof this.fn=="function"){var n=this;e.onclick=function(){try{n.fn.apply(n.scope,arguments)}catch(e){}return false}}return e};jsSpace.prototype.draw=function(){var e=document.createElement("span");if(this.id)e.id=this.id;e.appendChild(document.createTextNode(String.fromCharCode(160)));e.className="jstSpacer";if(this.width)e.style.marginRight=this.width+"px";return e};jsCombo.prototype.draw=function(){if(!this.scope||!this.options)return null;var e=document.createElement("select");if(this.className)e.className=className;e.title=this.title;for(var t in this.options){var n=document.createElement("option");n.value=t;n.appendChild(document.createTextNode(this.options[t]));e.appendChild(n)}var r=this;e.onchange=function(){try{r.fn.call(r.scope,this.value)}catch(e){alert(e)}return false};return e};jsToolBar.prototype={base_url:"",mode:"wiki",elements:{},help_link:"",getMode:function(){return this.mode},setMode:function(e){this.mode=e||"wiki"},switchMode:function(e){e=e||"wiki";this.draw(e)},setHelpLink:function(e){this.help_link=e},button:function(e){var t=this.elements[e];if(typeof t.fn[this.mode]!="function")return null;var n=new jsButton(t.title,t.fn[this.mode],this,"jstb_"+e);if(t.icon!=undefined)n.icon=t.icon;return n},space:function(e){var t=new jsSpace(e);if(this.elements[e].width!==undefined)t.width=this.elements[e].width;return t},combo:function(e){var t=this.elements[e];var n=t[this.mode].list.length;if(typeof t[this.mode].fn!="function"||n==0){return null}else{var r={};for(var i=0;i<n;i++){var s=t[this.mode].list[i];r[s]=t.options[s]}return new jsCombo(t.title,r,this,t[this.mode].fn)}},draw:function(e){this.setMode(e);while(this.toolbar.hasChildNodes()){this.toolbar.removeChild(this.toolbar.firstChild)}this.toolNodes={};var t,n,r;for(var i in this.elements){t=this.elements[i];var s=t.type==undefined||t.type==""||t.disabled!=undefined&&t.disabled||t.context!=undefined&&t.context!=null&&t.context!=this.context;if(!s&&typeof this[t.type]=="function"){n=this[t.type](i);if(n)r=n.draw();if(r){this.toolNodes[i]=r;this.toolbar.appendChild(r)}}}},singleTag:function(e,t){e=e||null;t=t||e;if(!e||!t){return}this.encloseSelection(e,t)},encloseLineSelection:function(e,t,n){this.textarea.focus();e=e||"";t=t||"";var r,i,s,o,u,a;if(typeof document["selection"]!="undefined"){s=document.selection.createRange().text}else if(typeof this.textarea["setSelectionRange"]!="undefined"){r=this.textarea.selectionStart;i=this.textarea.selectionEnd;o=this.textarea.scrollTop;r=this.textarea.value.substring(0,r).replace(/[^\r\n]*$/g,"").length;i=this.textarea.value.length-this.textarea.value.substring(i,this.textarea.value.length).replace(/^[^\r\n]*/,"").length;s=this.textarea.value.substring(r,i)}if(s.match(/ $/)){s=s.substring(0,s.length-1);t=t+" "}if(typeof n=="function"){a=s?n.call(this,s):n("")}else{a=s?s:""}u=e+a+t;if(typeof document["selection"]!="undefined"){document.selection.createRange().text=u;var f=this.textarea.createTextRange();f.collapse(false);f.move("character",-t.length);f.select()}else if(typeof this.textarea["setSelectionRange"]!="undefined"){this.textarea.value=this.textarea.value.substring(0,r)+u+this.textarea.value.substring(i);if(s){this.textarea.setSelectionRange(r+u.length,r+u.length)}else{this.textarea.setSelectionRange(r+e.length,r+e.length)}this.textarea.scrollTop=o}},encloseSelection:function(e,t,n){this.textarea.focus();e=e||"";t=t||"";var r,i,s,o,u,a;if(typeof document["selection"]!="undefined"){s=document.selection.createRange().text}else if(typeof this.textarea["setSelectionRange"]!="undefined"){r=this.textarea.selectionStart;i=this.textarea.selectionEnd;o=this.textarea.scrollTop;s=this.textarea.value.substring(r,i)}if(s.match(/ $/)){s=s.substring(0,s.length-1);t=t+" "}if(typeof n=="function"){a=s?n.call(this,s):n("")}else{a=s?s:""}u=e+a+t;if(typeof document["selection"]!="undefined"){document.selection.createRange().text=u;var f=this.textarea.createTextRange();f.collapse(false);f.move("character",-t.length);f.select()}else if(typeof this.textarea["setSelectionRange"]!="undefined"){this.textarea.value=this.textarea.value.substring(0,r)+u+this.textarea.value.substring(i);if(s){this.textarea.setSelectionRange(r+u.length,r+u.length)}else{this.textarea.setSelectionRange(r+e.length,r+e.length)}this.textarea.scrollTop=o}},stripBaseURL:function(e){if(this.base_url!=""){var t=e.indexOf(this.base_url);if(t==0){e=e.substr(this.base_url.length)}}return e}};jsToolBar.prototype.resizeSetStartH=function(){this.dragStartH=this.textarea.offsetHeight+0};jsToolBar.prototype.resizeDragStart=function(e){var t=this;this.dragStartY=e.clientY;this.resizeSetStartH();document.addEventListener("mousemove",this.dragMoveHdlr=function(e){t.resizeDragMove(e)},false);document.addEventListener("mouseup",this.dragStopHdlr=function(e){t.resizeDragStop(e)},false)};jsToolBar.prototype.resizeDragMove=function(e){this.textarea.style.height=this.dragStartH+e.clientY-this.dragStartY+"px"};jsToolBar.prototype.resizeDragStop=function(e){document.removeEventListener("mousemove",this.dragMoveHdlr,false);document.removeEventListener("mouseup",this.dragStopHdlr,false)};
jsToolBar.prototype.elements.strong={type:"button",title:"Strong",fn:{wiki:function(){this.singleTag("*")}}};jsToolBar.prototype.elements.em={type:"button",title:"Italic",fn:{wiki:function(){this.singleTag("_")}}};jsToolBar.prototype.elements.ins={type:"button",title:"Underline",fn:{wiki:function(){this.singleTag("+")}}};jsToolBar.prototype.elements.del={type:"button",title:"Deleted",fn:{wiki:function(){this.singleTag("-")}}};jsToolBar.prototype.elements.code={type:"button",title:"Code",fn:{wiki:function(){this.singleTag("@")}}};jsToolBar.prototype.elements.space1={type:"space"};jsToolBar.prototype.elements.h1={type:"button",title:"Heading 1",fn:{wiki:function(){this.encloseLineSelection("h1. ","",function(e){e=e.replace(/^h\d+\.\s+/,"");return e})}}};jsToolBar.prototype.elements.h2={type:"button",title:"Heading 2",fn:{wiki:function(){this.encloseLineSelection("h2. ","",function(e){e=e.replace(/^h\d+\.\s+/,"");return e})}}};jsToolBar.prototype.elements.h3={type:"button",title:"Heading 3",fn:{wiki:function(){this.encloseLineSelection("h3. ","",function(e){e=e.replace(/^h\d+\.\s+/,"");return e})}}};jsToolBar.prototype.elements.space2={type:"space"};jsToolBar.prototype.elements.ul={type:"button",title:"Unordered list",fn:{wiki:function(){this.encloseLineSelection("","",function(e){e=e.replace(/\r/g,"");return e.replace(/(\n|^)[#-]?\s*/g,"$1* ")})}}};jsToolBar.prototype.elements.ol={type:"button",title:"Ordered list",fn:{wiki:function(){this.encloseLineSelection("","",function(e){e=e.replace(/\r/g,"");return e.replace(/(\n|^)[*-]?\s*/g,"$1# ")})}}};jsToolBar.prototype.elements.space3={type:"space"};jsToolBar.prototype.elements.bq={type:"button",title:"Quote",fn:{wiki:function(){this.encloseLineSelection("","",function(e){e=e.replace(/\r/g,"");return e.replace(/(\n|^) *([^\n]*)/g,"$1> $2")})}}};jsToolBar.prototype.elements.unbq={type:"button",title:"Unquote",fn:{wiki:function(){this.encloseLineSelection("","",function(e){e=e.replace(/\r/g,"");return e.replace(/(\n|^) *[>]? *([^\n]*)/g,"$1$2")})}}};jsToolBar.prototype.elements.pre={type:"button",title:"Preformatted text",fn:{wiki:function(){this.encloseLineSelection("<pre>\n","\n</pre>")}}};jsToolBar.prototype.elements.space4={type:"space"};jsToolBar.prototype.elements.link={type:"button",title:"Wiki link",fn:{wiki:function(){this.encloseSelection("[[","]]")}}};jsToolBar.prototype.elements.img={type:"button",title:"Image",fn:{wiki:function(){this.encloseSelection("!","!")}}};jsToolBar.prototype.elements.space5={type:"space"};jsToolBar.prototype.elements.help={type:"button",title:"Help",fn:{wiki:function(){window.open(this.help_link,"","resizable=yes, location=no, width=300, height=640, menubar=no, status=no, scrollbars=yes")}}}
