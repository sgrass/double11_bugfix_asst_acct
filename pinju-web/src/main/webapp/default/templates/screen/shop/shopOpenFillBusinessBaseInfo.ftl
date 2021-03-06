<title>店铺--开店</title>
<link href="http://static.pinju.com/css/smoothness/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
<link href="http://static.pinju.com/css/open.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="http://static.pinju.com/js/jquery-ui-1.8.13.datepicker.min.js"></script>
<script type="text/javascript" src="http://static.pinju.com/js/jquery.ui.datepicker-zh-CN.js"></script>
<SCRIPT src="http://static.pinju.com/js/util.js"></SCRIPT>
<SCRIPT src="http://static.pinju.com/js/shop/shop.js?t=20111207.js"></SCRIPT>
<!--<SCRIPT src="${base}/default/js/shop.js"></SCRIPT>-->
<script src="http://static.pinju.com/js/shop/preshop.js?t=20111205.js"></script>

<#setting classic_compatible=true>

<iframe id="uploadIframe" name="uploadIframe" style="display:none;"></iframe>
<form id="shopInfoForm" action="${base}/shop/saveBusinessBaseInfoAction.htm" onsubmit="return checkShopBaseInfo('shopBSubmit', 1)" method="post" enctype ="multipart/form-data">
<input type="hidden" name="pj0" value="${pj0}" />
<input type="hidden" value="red_shopOpen" id="my-page" />
<input type="hidden" id="sellerType" name="sellerType" value="${sellerType}"/>
<input type="hidden" value="red_shopOpen" id="my-page" />
<#if shopBusinessInfoDO?exists>
<input type="hidden" id="myProvB" name="myProvC" value="${shopBusinessInfoDO.province}"/>
<input type="hidden" id="myCityB" name="myCityC" value="${shopBusinessInfoDO.city}"/>

<!-- START <普通店资料提交> -->
		<div class="openshop">
			<div class="ptitle">
				<h1>填写基本开店信息 <em>( <span class="required">*</span> 为必填项 )</em></h1>
				<span class="eye"><a href="/shop/choiceFillIndexAction.htm">返回</a></span>
			</div>
			<p class="exinfo">以下信息会影响审核结果，请务必仔细填写。<a href="http://service.pinju.com/cms/html/help/selleropen/" target="_blank">开店帮助</a></p>
			<div class="stepwrap accordion">
			
			<#if errorMessage?? && errorMessage!="">
				<div class="shop_pointer_style">
					<p class="red">${errorMessage}</p>
				</div>
			</#if>
			
				<ul class="tabs cf">
					<li class="current"><a title="店铺信息" href="javascript:;">店铺信息</a></li>
					<li><a title="企业信息" href="javascript:;" class="">企业信息</a></li>

					<li><a title="联系方式" href="javascript:;" class="">联系方式</a></li>
				</ul>
				
				
				<div class="title topen">
					<h2>填写店铺信息</h2>
					<span class="showhide"></span>
				</div>
				<div class="container info" style="display:block;">
					<fieldset>

						<table>
							<tr>
								<th><span class="required">*</span> 店铺名称</th>
								<td>
									<input type="text" maxlength="20" id="shopName" name="shopBusinessInfoDO.name" value="${shopBusinessInfoDO.name?html}" onblur="checkRename('#shopName','#shopNametip')" class="text">
									<span id="shopNametip" class="tip"></span>
									<p>0-20位字符(由中文、英文、数字及“_”组成) 
										<a  href="http://service.pinju.com/cms/html/2011/bis_mng_0823/47.html" target="_blank">店铺命名须知</a>
									</p>
								</td>
							</tr>
							<tr>
								<th><span class="required">*</span> 店铺类目</th>
								<td>
									<select id="shopCategory" name="shopBusinessInfoDO.shopCategory" onblur="spCheck('shopCategory','#shopCategorytip')">
							         <option value="">选择店铺类目</option>
							         	<#if shopCategoryList??>
							      		<#list shopCategoryList.keySet() as shopCategory>${shopCategory},
							      			<#if shopCategory?? && shopCategory != "">
								      			<#if shopBusinessInfoDO.shopCategory ==shopCategory>
													<option value="${shopCategory}" selected>${shopCategoryList.get(shopCategory)}</option>
												<#else>
													<option value="${shopCategory}" >${shopCategoryList.get(shopCategory)}</option>
												</#if>
											</#if>
							      		</#list>
							      		</#if>
							      </select>
							      <span id="shopCategorytip" class="tip"></span>
								</td>
							</tr>
							<tr>
								<th><span class="required">*</span> 卖家类型</th>
								<td>
									<select id="shopNature" name="shopBusinessInfoDO.shopNature">
							       <#list shopNatureListC as shopNatureC>
							      			<#if shopBusinessInfoDO.shopNature == shopNatureC_index>
												<option value="${shopNatureC_index}" selected>${shopNatureC}</option>
											<#else>
												<option value="${shopNatureC_index}" >${shopNatureC}</option>
											</#if>
							      		</#list>
							      </select>
                                 <span id="shopNaturetip" class="tip"></span>
								</td>
							</tr>
							<tr>
								<th>店铺简介</th>
								<td>
								<textarea id="descriptionC"  name="shopBusinessInfoDO.description" onblur="checkOnblur('#descriptionC','#descriptionCtip');">${shopBusinessInfoDO.description?html}</textarea>
								<p>(500字以内)</p>

								</td>
							</tr>
							
							<tr>
								<th>主要货源</th>
								<td>
									<#list goodsSourceList as goodsSource>
									<#if shopBusinessInfoDO.goodsSource == goodsSource_index>
										<label>
											<input id="goodsSource" name="shopBusinessInfoDO.goodsSource" type="radio" value="${goodsSource_index}" checked="checked" />${goodsSource}
										</label>
									<#else>
										<label>
											<input id="goodsSource" <#if goodsSource_index == 7>checked="checked"</#if> name="shopBusinessInfoDO.goodsSource" type="radio" value="${goodsSource_index}" />${goodsSource}
										</label>
									</#if>
								</#list>
								<span id="goodsSourcetip" class="tip"></span>
								</td>
							</tr>
							<tr>
								<th>&nbsp;</th>
								<td>

									<a class="btn-tonext"><span>填写下一项</span></a>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>
				
				<div class="title">
					<h2>填写企业信息</h2>

					<span class="showhide"></span>
				</div>
				<div class="container info">
					<fieldset>
						<legend>基本企业信息</legend>
						<table>
							<tr>
								<th><span class="required">*</span> 企业所在地:</th>

								<td>
									<span id="shopCityB"></span><span id="shopBusinessInfoDOprovincetip" class="tip"></span>
								</td>
							</tr>
							<tr>
								<th><span class="required">*</span> 企业名称</th>
								<td>
									<input type="text" id="enterpriseName" name="shopBusinessInfoDO.enterpriseName" 
									maxlength="30" value="${shopBusinessInfoDO.enterpriseName?html}" 
									onblur="checkOnblur('#enterpriseName','#enterpriseNametip')" class="text">
									<span id="enterpriseNametip" class="tip"></span>

								</td>
							</tr>
							<tr>
								<th><span class="required">*</span> 工商营业执照注册号</th>
								<td>
									<input type="text" id="businessLicenseNumber"  
									name="shopBusinessInfoDO.businessLicenseNumber" maxlength="18" 
									value="${shopBusinessInfoDO.businessLicenseNumber?html}" 
									onblur="spCheck('businessLicenseNumber','#businessLicenseNumbertip')" class="text" >
									<span id="businessLicenseNumbertip" class="tip"></span>
								</td>

							</tr>
							<tr>
								<th><span class="required">*</span> 组织机构代码证号</th>
								<td>
									<input type="text" id="organizationCodeNumber"  
									name="shopBusinessInfoDO.organizationCodeNumber" maxlength="10" 
									value="${shopBusinessInfoDO.organizationCodeNumber?html}" 
									onblur="spCheck('organizationCodeNumber','#organizationCodeNumber')" class="text" >
									<p><span id="organizationCodeNumbertip" class="tip"></span></p>
								</td>
							</tr>

							<tr>
								<th><span class="required">*</span> 经营范围</th>
								<td>
									<input type="text" id="business" 
									name="shopBusinessInfoDO.business" 
									value="${shopBusinessInfoDO.business?html}" maxlength="50" class="text" 
									onblur="checkOnblur('#business','#businesstip')">
									<span id="businesstip" class="tip"></span>
								</td>
							</tr>
							<tr>

								<th><span class="required">*</span> 营业执照有效期限</th>
								<td>
									<#if shopBusinessInfoDO.businessLicenseEndDate??>
								      	<input type="text" readonly id="businessLicenseEndDate" name="shopBusinessInfoDO.businessLicenseEndDate"  
								      	value="${shopBusinessInfoDO.businessLicenseEndDate?string("yyyy-MM-dd")}"  
								      	onchange="spCheck('businessLicenseEndDate','#businessLicenseEndDatetip')" class="text"/>
								    <#else>
								      	<input type="text" readonly id="businessLicenseEndDate" name="shopBusinessInfoDO.businessLicenseEndDate"  
								      	value="${shopBusinessInfoDO.businessLicenseEndDate}" 
								      	onchange="spCheck('businessLicenseEndDate','#businessLicenseEndDatetip')" class="text"/>
								    </#if>
								    <span id="businessLicenseEndDatetip" class="tip"></span>
								</td>
							</tr>
							<tr>
								<th><span class="required">*</span> 法人代表姓名</th>
								<td>
									<input type="text" id="legalName"  name="shopBusinessInfoDO.legalName" 
									value="${shopBusinessInfoDO.legalName?html}" maxlength="20" class="text" 
									onblur="checkOnblur('#legalName','#legalNametip');spCheck('legalName','#legalNametip');">
									<p><span id="legalNametip"  class="tip"></span></p>
								</td>
							</tr>
							<tr>
								<th><span class="required">*</span> 企业注册地址</th>
								<td>
									<input type="text" id="registAddress"  name="shopBusinessInfoDO.registAddress" 
									value="${shopBusinessInfoDO.registAddress?html}" maxlength="50" class="text" 
									onblur="checkOnblur('#registAddress','#registAddresstip')">
									<span id="registAddresstip"  class="tip"></span>
								</td>
							</tr>
						</table>
					</fieldset>
					
					<fieldset>
						<legend>商户信息</legend>
						<table>
							<tr>
								<th><span class="required">*</span> 是否有其他网店:</th>
								<td>
									<#list isOpenOuterShopList as isOpenOuterShop>
		                            	<#if isOpenOuterShop_index==0>
											<label  for="elseshopYes">
												<input id="isHaveOuterShop" name="isHaveOuterShop" type="radio" 
												value="${isOpenOuterShop_index}"  
												onclick="spCheck('isHaveOuterShop','.shopCustInfo')" 
												 checked/>${isOpenOuterShop}
											</label>
										<#else>
										      <label for="elseshopNo">
			                                     <input id="isHaveOuterShop" name="isHaveOuterShop" type="radio" 
			                                     value="${isOpenOuterShop_index}" 
			                                     onclick="spCheck('isHaveOuterShop','.shopCustInfo')" />${isOpenOuterShop}
									          </label>
										</#if>
									</#list>
								</td>
							</tr>
						</table>
						<div id="hasOtherShop">
							<table id="othershop">
								<tr>
									<th><span class="required">*</span> 网上店铺地址:</th>
									<td>
										<input id="shopAddressUrl" name="shopBusinessInfoDO.outerShopAddressUrl" 
										type="text" class="text" value="${shopBusinessInfoDO.outerShopAddressUrl?html}" 
										onblur="spCheck('shopAddressUrl','#shopAddressUrltip')"/>
										<span id="shopAddressUrltip" class="tip"></span>
									</td>
								</tr>
								<tr>
									<th>店铺等级:</th>
									<td>
									  <#list shopLevelList as shopLevel>
		                                 <#if shopBusinessInfoDO.outerShopLevel == shopLevel_index>
											<label>
												<input id="shopLevel" name="shopBusinessInfoDO.outerShopLevel" type="radio" 
												value="${shopLevel_index}"  checked="checked" />${shopLevel}
											</label>
										 <#else>
										      <label>
			                                     <input id="shopLevel" name="shopBusinessInfoDO.outerShopLevel" type="radio" 
			                                     value="${shopLevel_index}" />${shopLevel}
									          </label>
										</#if>
									  </#list>
								  <span id="shopLeveltip" class="tip"></span>
									</td>
								</tr>
								<tr>
	
									<th>年销售规模:</th>
									<td>
										<#list saleScopeList as saleScope>
		                                 <#if shopBusinessInfoDO.outerShopSaleScope == saleScope_index>
											<label>
												<input id="saleScope" name="shopBusinessInfoDO.outerShopSaleScope" type="radio" 
												value="${saleScope_index}" checked="checked" />${saleScope}
											</label>
										 <#else>
										      <label>
			                                     <input id="saleScope" name="shopBusinessInfoDO.outerShopSaleScope" type="radio" 
			                                     value="${saleScope_index}" />${saleScope}
									          </label>
										</#if>
									  </#list>
									   <span id="saleScopetip" class="tip"></span>
									</td>
								</tr>
								<tr>
									<th>是否入驻过B2C:</th>
									<td>
										<#list isEnterB2cList as isEnterB2c>
		                                 <#if shopBusinessInfoDO.isEnterB2c == isEnterB2c_index>
											<label>
												<input id="isEnterB2c" name="shopBusinessInfoDO.isEnterB2c" type="radio" value="${isEnterB2c_index}" checked="checked" />${isEnterB2c}
											</label>
										 <#else>
										      <label>
			                                     <input id="isEnterB2c" name="shopBusinessInfoDO.isEnterB2c" type="radio" value="${isEnterB2c_index}" />${isEnterB2c}
									          </label>
										</#if>
									  </#list>
								   		<span id="isEnterB2ctip" class="tip"></span>
										<p>例如京东、当当、麦考林、易迅等大型B2C平台</p>
									</td>
								</tr>
								</table>
							</div>
							<table>
								<tr>
									<th>&nbsp;</th>
	
									<td>
										<a class="btn-tonext"><span>填写下一项</span></a>
									</td>
								</tr>
							</table>
						
					</fieldset>
				</div>
				
				<div class="title">

					<h2>填写联系方式</h2>
					<span class="showhide"></span>
				</div>
				<div class="container info">
					<fieldset>
						<table>
							<tr>
								<th><span class="required">*</span> 姓名:</th>
								<td>
									<input type="text" maxlength="20" id="shopManagerName" 
									name="shopBusinessInfoDO.shopManagerName" value="${shopBusinessInfoDO.shopManagerName?html}" 
									onblur="checkOnblur('#shopManagerName','#shopManagerNametip');spCheck('shopManagerName','#shopManagerNametip');" 
									class="text">
									<p><span id="shopManagerNametip" class="tip"></span></p>
								</td>
							</tr>
							<tr>
								<th><span class="required">*</span> 电话:</th>
								<td>
									<input type="text" id="shopManagerTelephone" name="shopBusinessInfoDO.shopManagerTelephone" 
									value="${shopBusinessInfoDO.shopManagerTelephone?html}" maxlength="20" 
									onblur="spCheck('shopManagerTelephone','#shopManagerTelephonetip')" class="text">
									<span id="shopManagerTelephonetip"  class="tip"></span>
									<p>如：021-12345678</p>
								</td>
							</tr>
							<tr>
								<th><span class="required">*</span> 手机:</th>
								<td>
									<input type="text" id="shopManagerMobile" name="shopBusinessInfoDO.shopManagerMobile" 
									value="${shopBusinessInfoDO.shopManagerMobile?html}"  maxlength="20" 
									onblur="spCheck('shopManagerMobile','#shopManagerMobiletip')" class="text">
									<span id="shopManagerMobiletip"  class="tip"></span>
								</td>
							</tr>
							<tr>
								<th><span class="required">*</span> 邮箱:</th>
								<td>
									<input type="text" id="shopManagerEmail" name="shopBusinessInfoDO.shopManagerEmail" 
									value="${shopBusinessInfoDO.shopManagerEmail?html}" 
									onblur="spCheck('shopManagerEmail','#shopManagerEmailtip')" class="text">
									<span id="shopManagerEmailtip"  class="tip"></span>
								</td>
							</tr>
							<tr>
								<th><span class="required">*</span> 联系地址:</th>
								<td>
									<input type="text" id="contactAddress" name="shopBusinessInfoDO.contactAddress" 
									value="${shopBusinessInfoDO.contactAddress}" 
									onblur="checkOnblur('#contactAddress','#contactAddresstip')" class="text">
									<span id="contactAddresstip" class="tip"></span>
								</td>

							</tr>
							<tr>
								<th>传真:</th>
								<td>
									<input type="text" id="shopManagerFax" name="shopBusinessInfoDO.shopManagerFax" 
									value="${shopBusinessInfoDO.shopManagerFax?html}" maxlength="20"  class="text">
									<span id="shopManagerFaxtip"  class="tip"></span>
								</td>
							</tr>
							<tr>

								<th>QQ:</th>
								<td>
									<input type="text" id="qq" name="shopBusinessInfoDO.qq" value="${shopBusinessInfoDO.qq?html}" 
									maxlength="20"  class="text">
									<span id="qqtip"  class="tip"></span>
								</td>
							</tr>
							<tr>
								<th>MSN:</th>
								<td>
									<input type="text" id="msn" name="shopBusinessInfoDO.msn" 
									value="${shopBusinessInfoDO.msn?html}" maxlength="50"  class="text">
									<span id="msntip"  class="tip"></span>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>
			
				<div class="btnrow btn-imgtext">
					<p id="submitError" style="color:red"></p>

					<button title="信息完整，可以提交！" id="shopBSubmit" type="submit" class="btn-ossactive">
						<span>我已填完以上信息,确认保存</span>
					</button>
					
				</div>
				<input type="hidden" name="_token_" value="${_token_}" />
			</form>
			</div>

		</div>

</#if>	

<script>


function addShopInfoToCookieStepB(form, callback){
     $('input,textarea', form).each(function() {
        var input = this;
		if ("onpropertychange" in input){ //IE6/IE7/IE8
			input.onpropertychange = function(){
				if (window.event.propertyName == "value"){
					callback.call(this, window.event);
				}
			}
		} else {
			// Fix Firefox Bug: https://bugzilla.mozilla.org/show_bug.cgi?id=195696
			input.addEventListener("input", callback, false);
		}
	});
	$('select', form).change(function() {
		callback.call(this, window.event);
	});
}	
addShopInfoToCookieStepB($('#shopInfoForm'), function(){
	//基本信息
	var name = $("#shopName").val();
	var shopCategory = $("#shopCategory").val();
	var shopNature = $("#shopNature").val();
	var province = $("#shopBusinessInfoDOprovince").val();
	var city = $("#shopBusinessInfoDOcity").val();
	//企业信息
	var enterpriseName = $("#enterpriseName").val();
	var businessLicenseNumber = $("#businessLicenseNumber").val();
	var organizationCodeNumber = $("#organizationCodeNumber").val();
	var business = $("#business").val();
	var businessLicenseEndDate = $("#businessLicenseEndDate").val();
	var legalName = $("#legalName").val();
	var registAddress = $("#registAddress").val();
	var shopAddressUrl = $("#shopAddressUrl").val();
	//联系人信息
	var shopManagerName = $("#shopManagerName").val();
	var shopManagerTelephone = $("#shopManagerTelephone").val();
	var shopManagerMobile = $("#shopManagerMobile").val();
	var shopManagerEmail = $("#shopManagerEmail").val();
	var shopManagerFax = $("#shopManagerFax").val();
	var contactAddress = $("#contactAddress").val();
	
	
	//基本信息
	name = "name="+encodeURIComponent(name);
	shopCategory = "shopCategory="+shopCategory;
	shopNature = "shopNature="+shopNature;
	province = "province="+encodeURIComponent(province);
	city = "city="+encodeURIComponent(city);
	
	//企业信息
	enterpriseName = "enterpriseName="+encodeURIComponent(enterpriseName);
	businessLicenseNumber = "businessLicenseNumber="+businessLicenseNumber;
	organizationCodeNumber = "organizationCodeNumber="+organizationCodeNumber;
	business = "business="+encodeURIComponent(business);
	businessLicenseEndDate = "businessLicenseEndDate="+businessLicenseEndDate;
	legalName = "legalName="+encodeURIComponent(legalName);
	registAddress = "registAddress="+encodeURIComponent(registAddress);
	shopAddressUrl = "shopAddressUrl="+encodeURIComponent(shopAddressUrl);
	
	//联系人信息
	shopManagerName = "shopManagerName="+encodeURIComponent(shopManagerName);
	shopManagerTelephone = "shopManagerTelephone="+shopManagerTelephone;
	shopManagerMobile = "shopManagerMobile="+shopManagerMobile;
	shopManagerEmail = "shopManagerEmail="+shopManagerEmail;
	shopManagerFax = "shopManagerFax="+shopManagerFax;
	contactAddress = "contactAddress="+encodeURIComponent(contactAddress);
	
	var strCookie = name + "," + shopCategory + "," +shopNature + "," + province + "," + city + "," + shopAddressUrl + ","
					+ enterpriseName + "," +businessLicenseNumber + "," + organizationCodeNumber + "," 
					+ business + "," + businessLicenseEndDate + "," + legalName + "," + registAddress + "," +shopAddressUrl + "," 
					+ shopManagerName + "," + shopManagerTelephone + "," +shopManagerMobile + ","
					+ shopManagerEmail + "," + shopManagerFax + "," + contactAddress;
	PinjuCookie.writeCookie('PJ1', strCookie, 'www.pinju.com', '/shop', 3);
});

function showAccordion2(index) {
	var titleList = $('.accordion .title');
	var titleDiv = titleList.eq(index);
	titleDiv.addClass("topen");
	titleDiv.next().show();
	titleList.each(function() {
		if (this != titleDiv[0]) {
			$(this).removeClass('topen');
			$(this).next().hide();
		}
	});
} 

</script>
