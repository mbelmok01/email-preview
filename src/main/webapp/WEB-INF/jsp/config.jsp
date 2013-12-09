	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<c:set var="includeJQuery" value="${renderRequest.preferences.map['includeJQuery'][0]}"/>
<c:if test="${ includeJQuery }">
    <script src="<rs:resourceURL value="/rs/jquery/1.8.3/jquery-1.8.3.min.js"/>" type="text/javascript"></script>
</c:if>
<script src="${pageContext.request.contextPath}/js/email-admin-config.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/email.min.css"/>"/>

<c:set var="n"><portlet:namespace/></c:set>
<portlet:actionURL var="formUrl">
    <portlet:param name="action" value="updateConfiguration"/>
</portlet:actionURL>
<portlet:resourceURL id="parameters" var="parametersUrl" />
<style>
    .portlet-container label{
        width: auto;
        font-weight: lighter;
        text-align: justify;
    }
    .portlet-msg-alert{
        color:red;
    }

    .col-lg-5.col-md-5.col-sm-8.col-xs-12{
        /*overflow: auto;*/
        height: 20px;
    }
    /*#protocol, #exchange, #host, #port, #usernameSuffix, #timeout*/
    .btn-info.btn-xs {
        
        margin-bottom: 2px;
        float: right;
    }
    .portlet-container .btn {
        float: right;
        margin: 4px;
    }
    
</style>

<div id="${n}container" class="fl-widget portlet" role="section">

<!-- <div class="container">
    <div class="row">

        <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12" style="background-color:blue;">
            Protocole: Protocole à  utiliser pour contacter le serveur</div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="background-color:red;">input</div>    
    </div>
</div> -->

<!-- <a href="#" data-toggle="tooltip" title="first tooltip"> -->

    

    <!-- Portlet Body -->
    <div class="fl-widget-content portlet-body email-admin-config" role="main">
        <form:form action="${ formUrl }" method="POST" commandName="form" htmlEscape="false">

            <!-- General Configuration Section -->
            <div class="container" role="region">
                <legend>
                	<spring:message code="config.preferences.basic"/>
                </legend>
                
                <div class="portlet-section">

                    <div class="row">
                       	<div class="col-lg-5 col-md-5 col-sm-8 col-xs-12" lign="justified">
                            <form:label path="protocol">
                                <b>
                                    <spring:message code="config.preferences.protocol"/>
                                </b>
                            </form:label>   
                             <a href="#" id="protocol" class="btn btn-info btn-xs " data-placement="left" rel="popover" data-content="<spring:message code="config.preferences.protocol.tooltip"/>" data-original-title="<spring:message code="config.preferences.protocol"/>">infos
                                </a>
                                <script type="text/javascript">
                                    $(function (){
                                    $("#protocol").popover();
                                    });
                                </script>         
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <select name="protocol" class="value plt-email-input-protocol form-control">
                                <c:forEach items="${protocols}" var="protocol">
                                    <option<c:if test="${form.protocol eq protocol}"> selected="selected"</c:if> value="<c:out value="${protocol}"/>"><c:out value="${protocol}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <br>

                    <!-- domain name -->
                    <div class="row">
                	   <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12">
                            <form:label path="exchangeDomain">
                                <b><spring:message code="config.preferences.exchange.domain"/></b>
                            </form:label>
                            <a href="#" id="exchange" class="btn btn-info btn-xs" data-placement="left" rel="popover" data-content="<spring:message code="config.preferences.exchange.domain.tooltip"/>" data-original-title="<spring:message code="config.preferences.exchange.domain"/>">infos
                                </a>
                                <script type="text/javascript">
                                    $(function (){
                                    $("#exchange").popover();
                                    });
                                </script>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <form:input class="form-control" path="exchangeDomain"/>    
                        </div>
                    </div>

                    <br>

                    <!-- Hote -->
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12">
                            <form:label path="host">
                                <b><spring:message code="config.preferences.host"/></b>                                
                            </form:label>
                            <a href="#" id="host" class="btn btn-info btn-xs" data-placement="left" rel="popover" data-content="<spring:message code="config.preferences.host.tooltip"/>" data-original-title="<spring:message code="config.preferences.host"/>">infos
                                </a>
                                <script type="text/javascript">
                                    $(function (){
                                    $("#host").popover();
                                    });
                                </script>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <form:input path="host" class="form-control" placeholder="www.outlook.fr"/>
                        </div>
                    </div>

                    <br>

                    <!-- Port -->
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12" >
                            <form:label path="port">
                                <b><spring:message code="config.preferences.port"/></b>                             
                            </form:label>
                            <a href="#" id="port" class="btn btn-info btn-xs" data-placement="left" rel="popover" data-content="<spring:message code="config.preferences.port.tooltip"/>" data-original-title="<spring:message code="config.preferences.port"/>">infos
                                </a>
                                <script type="text/javascript">
                                    $(function (){
                                    $("#port").popover();
                                    });
                                </script>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <form:input path="port" class="form-control"/>
                        </div>
                    </div>

                    <br>

                    <!-- username sufix -->
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12" >
                            <form:label path="usernameSuffix">
                                <b><spring:message code="config.preferences.username.suffix"/></b>                         
                            </form:label>
                            <a href="#" id="usernameSuffix" class="btn btn-info btn-xs" data-placement="left" rel="popover" data-content="<spring:message code="config.preferences.username.suffix.tooltip"/>" data-original-title="<spring:message code="config.preferences.username.suffix"/>">infos
                                </a>
                                <script type="text/javascript">
                                    $(function (){
                                    $("#usernameSuffix").popover();
                                    });
                                </script>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <form:input path="usernameSuffix" class="form-control"/>
                        </div>
                    </div>

                    <br>

                    <!-- timeout -->
                <!-- <div class="row">
                    <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12" >
                        <form:label path="timeout">
                            <b><spring:message code="config.preferences.timeout"/></b>
                            <spring:message code="config.preferences.timeout.tooltip"/>
                        </form:label>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <form:input path="timeout" class="form-control"/>
                    </div>
                </div> -->
                <div class="row">
                    <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12" >
                        <form:label path="timeout">
                            <b><spring:message code="config.preferences.timeout"/></b>
                        </form:label>
                        <a href="#" id="timeout" class="btn btn-info btn-xs" data-placement="left" rel="popover" data-content="<spring:message code="config.preferences.timeout.tooltip"/>" data-original-title="<spring:message code="config.preferences.timeout"/>">infos
                                </a>
                                <script type="text/javascript">
                                    $(function (){
                                    $("#timeout").popover();
                                    });
                                </script>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <form:input path="timeout" class="form-control"/>
                    </div>
                </div>

                    <!--  autodiscover -->
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12" >
                            <form:label path="exchangeAutodiscover">
                                <spring:message code="config.preferences.exchange.autodiscover"/>
                            </form:label>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <form:checkbox path="exchangeAutodiscover"/>
                        </div>
                    </div>
                
                <br>

                
            </div> <!-- Configuration en compte de base -->
            
            <br>

            <div class="portlet-section" role="region">
                <legend>
                    <spring:message code="config.preferences.linking"/>
                </legend>

                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12" >
                            <form:label path="linkServiceKey">
                                <spring:message code="config.preferences.service"/>
                            </form:label>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <form:select path="linkServiceKey" cssClass="link-service-input form-control">
                                <c:forEach items="${ linkServices }" var="service">
                                    <form:option value="${ service.key }"/>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>

                    <br>

                    <table class="table link-service-parameters">
                        <thead>
                            <tr>
                                <th><spring:message code="config.preferences.prefName"/></th>
                                <th><spring:message code="config.preferences.value"/></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${ serviceParameters.linkParameters }" var="parameter">
                                <c:set var="path" value="additionalProperties['${ parameter.key }'].value"/>
                                <tr class="parameter-row">
                                    <td class="preference-name">
                                        <form:label path="${ path }">
                                            ${ parameter.label }
                                        </form:label>
                                    </td>
                                    <td class="value">
                                        <form:input class="form-control" path="${ path }"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div><!-- Configuration de liens -->


    
            <div class="portlet-section" role="region">
                <legend class="portlet-section-header" role="heading">
                    <spring:message code="config.preferences.authentication"/>
                </legend>

                

                <div class="container">
                <p>
                    <spring:message code="config.preferences.comment"/>
                </p>
                    <c:forEach items="${authServices}" var="auth" varStatus="authIndex">
                        <div>
                            <label for="allowableAuthenticationServiceKeys${authIndex.count}">
                                <form:checkbox path="allowableAuthenticationServiceKeys" value="${auth.key}"/>
                                <c:out value="${auth.key} "/>
                                <span class="auth-type-description">
                                    <spring:message code="config.preferences.auth.description.${auth.key}" text=""/>
                                </span>
                            </label>
                            <c:if test="${!empty auth.adminConfigurationParameters}">
                            <!--  Used for warning that the encryption key hasn't been changed from the default -->
                                <c:if test="${auth.key eq 'portletPreferences' && usingDefaultEncryptionKey eq true}">
                                    <div class="portlet-msg-alert portlet-msg alert" role="alert">
                                        <spring:message code="editPreferences.warning.message.default.password.set"/>
                                    </div>
                                </c:if>

                                <table class="table auth-service-parameters">
                                    <thead>
                                        <tr>
                                            <th>
                                                <c:out value="${auth.key}"/>
                                                    <spring:message code="config.preferences.parameter"/>
                                            </th>
                                            <th>
                                                <spring:message code="config.preferences.value"/>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${auth.adminConfigurationParameters}" var="parameter">
                                            <c:set var="path" value="additionalProperties['${ parameter.key }'].value"/>
                                            <tr class="parameter-row">
                                                <td class="preference-name" style="width:50%;">
                                                    <form:label path="${ path }">
                                                        ${ parameter.label }
                                                    </form:label>
                                                </td>
                                                <td class="value" style="width:50%;">
                                                    <form:input path="${ path }" class="form-control"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div >
                <input type="submit" class="btn btn-primary" name="save" value="<spring:message code="config.preferences.save"/>"/>
                <input type="submit" class="btn btn-primary" name="cancel" value="<spring:message code="config.preferences.cancel"/>"/>
            </div>
            
        </form:form>
        
    </div>
</div>

<script type="text/javascript">

    var ${n} = {};
    ${n}.jQuery = jQuery<c:if test="${ includeJQuery }">.noConflict(true)</c:if>;
    (function(context) {
        var $ = context.jQuery;
        emailPortlet.init(context, $('#${n}container'));
    })(${n});

</script>
