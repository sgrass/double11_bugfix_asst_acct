(function(p){p.fn.countdown=function(y)
	{var a={},t=/(%\{d\}|%\{h\}|%\{m\}|%\{s\})/g,
	u=/%\{d\}/,v=/%\{h\}/,w=/%\{m\}/,x=/%\{s\}/,
	n=false,
	j,f=Math.floor;
	p.extend(a,{date:new Date,updateTime:1E3,
		htmlTemplate:'%{d}<span>天</span>%{h}<span>小时</span>%{m}<span>分</span>%{s}<span>秒</span>',
	minus:false,onChange:null,onComplete:null,leadingZero:false},y);j=a.htmlTemplate;return this.each(function(){var g=p(this),o,k=new Date,l=
new Date(a.date),q=864E5,r=l.getTime()-k.getTime(),m=r/q,c=f(m),h=(m-c)*24,b=f(h),d=f((h-b)*60),s=(h-b)*60,e=f((s-d)*60),i="";a.onChange&&g.bind("change",a.onChange);a.onComplete&&g.bind("complete",a.onComplete);if(a.leadingZero){if(c<10)c="0"+c;if(b<10)b="0"+b;if(d<10)d="0"+d;if(e<10)e="0"+e}if(k<=l||a.minus)i=j.replace(u,c).replace(v,b).replace(w,d).replace(x,e);else{i=j.replace(t,"00");n=true}o=window.setInterval(function(){k=new Date;l=new Date(a.date);q=864E5;r=l.getTime()-k.getTime();m=r/q;
c=f(m);h=(m-c)*24;b=f(h);d=f((h-b)*60);s=(h-b)*60;e=f((s-d)*60);i="";if(a.leadingZero){if(c<10)c="0"+c;if(b<10)b="0"+b;if(d<10)d="0"+d;if(e<10)e="0"+e}if(k<=l||a.minus)i=j.replace(u,c).replace(v,b).replace(w,d).replace(x,e);else{i=j.replace(t,"00");n=true}g.html(i);g.trigger("change",[o]);if(n){g.trigger("complete");clearInterval(o)}},a.updateTime);g.html(i);if(n){g.trigger("complete");clearInterval(o)}})}})(jQuery);
