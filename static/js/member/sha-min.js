var Sha1={};Sha1.hash=function(h,z){z=(typeof z=="undefined")?true:z;if(z){h=Utf8.encode(h)}var n=[1518500249,1859775393,2400959708,3395469782];h+=String.fromCharCode(128);var x=h.length/4+2;var k=Math.ceil(x/16);var m=new Array(k);for(var A=0;A<k;A++){m[A]=new Array(16);for(var y=0;y<16;y++){m[A][y]=(h.charCodeAt(A*64+y*4)<<24)|(h.charCodeAt(A*64+y*4+1)<<16)|(h.charCodeAt(A*64+y*4+2)<<8)|(h.charCodeAt(A*64+y*4+3))}}m[k-1][14]=((h.length-1)*8)/Math.pow(2,32);m[k-1][14]=Math.floor(m[k-1][14]);m[k-1][15]=((h.length-1)*8)&4294967295;var u=1732584193;var r=4023233417;var q=2562383102;var p=271733878;var o=3285377520;var f=new Array(80);var F,E,D,C,B;for(var A=0;A<k;A++){for(var v=0;v<16;v++){f[v]=m[A][v]}for(var v=16;v<80;v++){f[v]=Sha1.ROTL(f[v-3]^f[v-8]^f[v-14]^f[v-16],1)}F=u;E=r;D=q;C=p;B=o;for(var v=0;v<80;v++){var w=Math.floor(v/20);var g=(Sha1.ROTL(F,5)+Sha1.f(w,E,D,C)+B+n[w]+f[v])&4294967295;B=C;C=D;D=Sha1.ROTL(E,30);E=F;F=g}u=(u+F)&4294967295;r=(r+E)&4294967295;q=(q+D)&4294967295;p=(p+C)&4294967295;o=(o+B)&4294967295}return Sha1.toHexStr(u)+Sha1.toHexStr(r)+Sha1.toHexStr(q)+Sha1.toHexStr(p)+Sha1.toHexStr(o)};Sha1.f=function(b,a,d,c){switch(b){case 0:return(a&d)^(~a&c);case 1:return a^d^c;case 2:return(a&d)^(a&c)^(d&c);case 3:return a^d^c}};Sha1.ROTL=function(a,b){return(a<<b)|(a>>>(32-b))};Sha1.toHexStr=function(d){var c="",a;for(var b=7;b>=0;b--){a=(d>>>(b*4))&15;c+=a.toString(16)}return c};var Utf8={};Utf8.encode=function(a){var b=a.replace(/[\u0080-\u07ff]/g,function(e){var d=e.charCodeAt(0);return String.fromCharCode(192|d>>6,128|d&63)});b=b.replace(/[\u0800-\uffff]/g,function(e){var d=e.charCodeAt(0);return String.fromCharCode(224|d>>12,128|d>>6&63,128|d&63)});return b};Utf8.decode=function(b){var a=b.replace(/[\u00e0-\u00ef][\u0080-\u00bf][\u0080-\u00bf]/g,function(e){var d=((e.charCodeAt(0)&15)<<12)|((e.charCodeAt(1)&63)<<6)|(e.charCodeAt(2)&63);return String.fromCharCode(d)});a=a.replace(/[\u00c0-\u00df][\u0080-\u00bf]/g,function(e){var d=(e.charCodeAt(0)&31)<<6|e.charCodeAt(1)&63;return String.fromCharCode(d)});return a};