var postShopCart=function(){if(validateItemInput()){var a=$("#itemId").val(),c=$("#SelectedNum").val(),d=$("#SelectedSkuId").val(),e=$("#SelectedSKU").val(),f=$("#SelectedPrice").val(),b=$("#channelId").val();if(b==null||b=="undefind")b="";if(d==null||d=="undefind")d="";if(e==null||e=="undefind")e="";jQuery.post(shopCartAction+"?itemId="+a+"&itemCount="+c+"&itemPrice="+f+"&skuid="+d+"&skuDesc="+e+"&channelId="+b,function(a){var c=$$("cart_num"),b=$$("cart_price"),a=eval(a);a.stockCountLower==!0?alert("\u8d2d\u4e70\u6570\u91cf\u4e0d\u80fd\u5927\u4e8e\u5e93\u5b58"):
a.addSuccess==!0?(c.innerHTML=a.catCount,b.innerHTML=a.totalPrice,$(".shop_cart_pop .tips-error").hide(),$(".shop_cart_pop .tips-right").show(),$(".shop_cart_pop").show(),setItemCount()):($(".shop_cart_pop .tips-error").show(),$(".shop_cart_pop .tips-right").hide(),$(".shop_cart_pop").show())})}},postForm=function(a){validateItemInput()&&($("#detailForm").attr("action",a),$("#detailForm").submit())};
function setItemCount(){var a=new PinjuCookie("/"),a=decodeURIComponent(a.getShoppingCartContent()).split("~");a.length?$("#carts").html(a.length):$("#carts").html("0")}
var validateItemInput=function(){var a=$("#itemId").val(),c=$("#SelectedNum").val(),d=$("#SpecCapacity").text();$("#SelectedSkuId").val();$("#SelectedSKU").val();var e=$("#SelectedPrice").val(),f=$("#SpecPrice").text(),b=/^\+?[1-9][0-9]*$/;if(isNaN(a)||!parseFloat(a)>0)return!1;if(isSku){a=!0;a=validateSku();if(!a)return!1;if(e!=f||isNaN(e))return!1}if(isNaN(c)||!parseFloat(c)>0||!b.test(c))return alert("\u8bf7\u6b63\u786e\u586b\u5199\u8d2d\u4e70\u6570\u91cf"),$("#SelectedNum").val("1"),!1;if(isActDiscount==
!0&&(e=$("#actLimitCount").text(),parseFloat(e)>0&&parseFloat(e)<parseFloat(c)))return alert("\u60a8\u6240\u586b\u5199\u7684\u5546\u54c1\u6570\u91cf\u8d85\u8fc7\u9650\u8d2d\u6570\u91cf"),!1;if(parseFloat(d)<parseFloat(c))return alert("\u8d2d\u4e70\u6570\u91cf\u4e0d\u80fd\u5927\u4e8e\u5e93\u5b58"),!1;return!0},validateSku=function(){var a="\u8bf7\u9009\u62e9: ",c=!0,d=$("div[name='sort_list']");$.each(d,function(e,f){var b=$(f).find("span.sort_tit").text(),d=!1,h=$(f).find("div").find("ul").find("li");
$.each(h,function(a,c){var b=$(c).attr("class");if(b=="ho"||b=="imgsitem-outline ho")d=!0});d||(a+=b.replace("\uff1a"," "),c=!1)});return c?!0:(alert(a),!1)},$$=function(a){return document.getElementById(a)},unDisplayShopCartLayer=function(){$("#J_CartInfo").hide()},displayShopCartLayer=function(){$("#J_CartInfo").show()};
function getLogisticsByCity(a){$("#current_value").text("\u7269\u6d41\u4fe1\u606f\u52a0\u8f7d\u4e2d..");$.ajax({type:"post",url:logisticsAction,data:{logisticsTemplateId:templateId,cityName:a,memberId:sellerMemberId},dataType:"json",cache:!1,success:function(a){var d="",e="",f="",b="";$.each(a,function(a,c){if(c!=null&&c!=0){var d=parseFloat(c/100).toFixed(2)+"\u5143\u3000";a==1?e="\u5e73\u90ae:"+d:a==2?f="\u5feb\u9012:"+d:b="EMS:"+d}});$("#current_value").text(b+f+e)}})}
function getTradeCount(){typeof base!="undefined"&&(jQuery.post(base+"/orderQuery/queryajaxitembuynum.htm?itemId="+itemId,function(a){a=a.buyNum;a!=0&&$(".trade_buy_count").text(a)}),jQuery.getJSON(base+"/async/comments/item-count.htm?item="+itemId+"&callback=?",function(a){$(".trade_comment_count").text(a.count)}))}function buyListPageCallback(a){initBuyListTable(a,$("#J_buyTable"),$("#Pagination"),$("#pd_tabar"))}
function contentBuyListPageCallback(a){initBuyListTable(a,$("#J_contentBuyTable"),$("#J_contentBuyPagination"),$("#J_buyTitleBar"))}
function initBuyListTable(a,c,d,e){var f=c.find(".already_buy_list"),b=base+"/async/detail/getBuyOrderList.htm?itemId="+itemId+"&page="+(a+1)+"&size="+buyPageSize+"&jsoncallback=?&t="+new Date,g=$('<div style="margin-top:10px;">\u6b63\u5728\u8bfb\u53d6\u8d2d\u4e70\u8bb0\u5f55,\u8bf7\u7a0d\u5019...</div>');f.html("");c.after(g);jQuery.post(b,function(b){g.remove();f.html('<tr><td colspan="5"></td></tr>');d.pagination(b.count,{callback:c.attr("id")=="J_contentBuyTable"?contentBuyListPageCallback:buyListPageCallback,
link_to:"javascript:;",prev_text:"\u4e0a\u4e00\u9875",next_text:"\u4e0b\u4e00\u9875",items_per_page:buyPageSize,num_display_entries:4,current_page:a,num_edge_entries:2});$.each(b.list,function(a,b){var c="",c=b.isCoupon==2?'<tr class=""><td>'+b.buyerNick+"</td><td>"+b.price+"&nbsp;<img src='http://static.pinju.com/images/detail/buy-list-sale.png' /></td><td>"+b.buycount+"</td><td>"+b.gmtCreate+"</td><td>"+b.skuAttr+"</td></tr>":'<tr class=""><td>'+b.buyerNick+"</td><td>"+b.price+"</td><td>"+b.buycount+
"</td><td>"+b.gmtCreate+"</td><td>"+b.skuAttr+"</td></tr>";f.append(c)});c.find("tr").hover(function(){$(this).addClass("hover")},function(){$(this).removeClass("hover")});if(e)b=e.offset().top,$(window).scrollTop(b)})}function initPageStyle(a,c){$(a).pagination(c,{callback:buyListPageCallback,link_to:"javascript:;",prev_text:"\u4e0a\u4e00\u9875",next_text:"\u4e0b\u4e00\u9875",items_per_page:buyPageSize,num_display_entries:4,current_page:buyPageIndex,num_edge_entries:2})}
function isLimitBuyCode(){var a=$("#itemId").val(),c=$("#limit_input").val();c==null||c==""||c=="undefind"?alert("\u8bf7\u8f93\u5165\u9650\u8d2d\u7801"):jQuery.post(limitBuyAction+"?itemid="+a+"&xianGouCode="+c,function(a){a.error!=null?alert(a.error):a.success!=null?($("#limitBuyCode").val(c),postForm(buyNowAction)):alert("\u7f51\u7edc\u9519\u8bef")})}
function ratePageCallback(a){$("#review_list").text("\u6b63\u5728\u8bfb\u53d6\u8bc4\u4ef7\u4fe1\u606f,\u8bf7\u7a0d\u5019...");rateInitTable(a,$("#review_list"),$("#ratePagination"),$("#pd_tabar"))}function contentRatePageCallback(a){$("#J_contentReviewList").text("\u6b63\u5728\u8bfb\u53d6\u8bc4\u4ef7\u4fe1\u606f,\u8bf7\u7a0d\u5019...");rateInitTable(a,$("#J_contentReviewList"),$("#J_contentRatePagination"),$("#J_commentTitleBar"))}
function rateInitTable(a,c,d,e){a+=1;$.getJSON(base+"http://www.pinju.com/async/comments/item.htm?item="+itemId+"&page="+a+"&pageSize="+ratePageSize+"&t="+new Date,function(f){var b=f.count;d.pagination(b,{callback:c.attr("id")=="J_contentReviewList"?contentRatePageCallback:ratePageCallback,link_to:"javascript:;",prev_text:"\u4e0a\u4e00\u9875",next_text:"\u4e0b\u4e00\u9875",items_per_page:ratePageSize,num_display_entries:4,current_page:a-1,num_edge_entries:2});c.text("");f.comments&&$.each(f.comments,
function(a,b){var f=!b.anonymous&&b.bid?getAvatarPath(b.bid):RATE_DEFAULT_IMG,d=!b.anonymous&&b.bid?'<a href="http://sns.pinju.com/'+b.bid+'" target="_blank">'+replaceHTMLTag(b.name)+"</a>":replaceHTMLTag(b.name),e=replaceHTMLTag(b.comment);c.append('<li><div class="avatar_box"> <div class="avatar"><img src="'+f+'" /></div><div class="use_name">'+d+'</div></div><div class="text">'+e+'<span class="date">['+b.time+"] </span></div></li>")});b==0?c.text("\u6ca1\u6709\u627e\u5230\u7ed3\u679c"):c.find(">li:odd").addClass("gray_bg");
if(e)f=e.offset().top,$(window).scrollTop(f)})}function getAvatarPath(a){var c=(""+a).substr(0,6);return IMG_SERVER+"/usericon/"+parseInt(c.substr(0,3))+"/"+parseInt(c.substr(3,3))+"/"+a+".jpg_50x50.jpg"}
$(function(){function a(){if(typeof base!="undefined"){var a=$("#J_recommendItemsContent"),b="";$.getJSON(base+"/async/detail/getShopkeeperRecommend.htm?mid="+sellerMemberId,function(c){c.itemDOList?$.each(c.itemDOList,function(){b+='<li class="item">';b+='<div class="itemwrap">';b+='\t<div class="img">';b+='\t\t<a href="'+base+"/detail/"+this.id+'.htm" target="_blank"><img src="'+IMG_SERVER+"/"+this.picUrl+'_160x160.jpg" /></a>';b+="\t</div>";b+="\t<ul>";b+='\t\t<li class="titletext">';b+='\t\t\t<a href="'+
base+"/detail/"+this.id+'.htm" target="_blank">'+this.title.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;")+"</a>";b+="\t\t</li>";b+='\t\t<li class="price">';b+=this.discountPrice==null?"\t\t\t\uffe5 <strong>"+this.price+"</strong>":"\t\t\t\uffe5 <strong>"+this.discountPrice+"</strong> <del>"+this.price+"</del>";b+="\t\t</li>";b+="\t</ul>";b+="</div>";b+="</li>"}):b='<li style="margin-bottom:20px;">\u6ca1\u6709\u627e\u5230\u7ed3\u679c</li>';a.html(b)})}}$("#express_ar").hover(function(){$(this).clearQueue();
s=setTimeout(function(){$("#national_list").show()},100)},function(){$(this).clearQueue();t=setTimeout(function(){$("#national_list").hide()},300)});$("#national_list").hover(function(){clearTimeout(t)},function(){$(this).clearQueue().hide()});$("#national_list>a").each(function(){$(this).click(function(){getLogisticsByCity($(this).text());$("#current_city").text($(this).text());$("#national_list").hide()})});$(".sp_list>li").find("a").hover(function(){$(this).clearQueue()});"jqzoom"in $.fn&&$("#J_itemPhoto").jqzoom({zoomType:"standard",
zoomWidth:425,zoomHeight:310,xOffset:10,yOffset:0,preloadText:"\u56fe\u7247\u52a0\u8f7d\u4e2d",lens:!0,title:"",preloadImages:!0,alwaysOn:!1});$("#submitBuyNow").click(function(){isLimitBuyItem?validateItemInput()&&$(".stint_pop").show():postForm(buyNowAction)});$(".btn_addshopcart").click(function(){postShopCart()});$(".shop_cart_pop .colse").click(function(){$(".shop_cart_pop").hide()});$(".tips-right>.otherclose").click(function(){$(".shop_cart_pop").hide()});if(isActDiscount=typeof isActDiscount==
"undefined"?null:isActDiscount){var c=function(){actStartMinute-=1;actStartMinute<0&&(actStartMinute=59,actStartHour-=1);actStartHour>=0&&actStartMinute>=0?($("#sale_time").text("(\u5269 "+actStartHour+"\u5c0f\u65f6"+actStartMinute+"\u5206\u949f \u7ed3\u675f)"),setTimeout(c,6E4)):$("#sale_time").text("\u6d3b\u52a8\u5df2\u7ed3\u675f")};c()}if(isLimitBuyItem=typeof isLimitBuyItem=="undefined"?null:isLimitBuyItem)$(".stint_pop_close").click(function(){$(".stint_pop").hide()}),$("#limit_buy_submit").click(function(){isLimitBuyCode()});
$(".tabar a").click(function(a){$(".tabar li").removeClass("selected");$(this).parent().addClass("selected");var b=$(this).attr("href");$(".tab_container").hide();$(b).show();a.preventDefault()});$("#buy_record").click(function(){isClickBuyRecord||(initBuyListTable(0,$("#J_buyTable"),$("#Pagination"),$("#pd_tabar")),isClickBuyRecord=!0)});$("#buy_rate_view").click(function(a){a.preventDefault();isLoadRate||(rateInitTable(0,$("#review_list"),$("#ratePagination"),$("#pd_tabar")),isLoadRate=!0)});if($("#J_commentTitleBar").length>
0){var d=isLoadContentBuy=isLoadIndemnityNotice=isLoadPayType=isLoadRecommendItems=!1;$(window).scroll(function(){var c=$(window).scrollTop()+$(window).height();c>$("#J_commentTitleBar").offset().top&&!d&&(rateInitTable(0,$("#J_contentReviewList"),$("#J_contentRatePagination")),d=!0);c>$("#J_buyTitleBar").offset().top&&!isLoadContentBuy&&(initBuyListTable(0,$("#J_contentBuyTable"),$("#J_contentBuyPagination")),isLoadContentBuy=!0);c>$("#J_indemnityNotice").offset().top&&!isLoadIndemnityNotice&&($("#J_indemnityNoticeContent").show(),
isLoadIndemnityNotice=!0);c>$("#J_payType").offset().top&&!isLoadPayType&&($("#J_payTypeContent").show(),isLoadPayType=!0);c>$("#J_recommendItems").offset().top&&!isLoadRecommendItems&&(a(),isLoadRecommendItems=!0)})}getTradeCount();var e=(new PinjuCookie("/")).getAdvertise();e&&$("#ad_key").val(e);$("#pd_description img").lazyload({placeholder:"http://static.pinju.com/img/blank.gif"})});