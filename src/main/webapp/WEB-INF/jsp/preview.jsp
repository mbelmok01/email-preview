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
    <jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>

    <c:set var="includeJQuery" value="${renderRequest.preferences.map['includeJQuery'][0]}"/>
    <c:if test="${includeJQuery}">
    <script src="<rs:resourceURL value="/rs/jquery/1.8.3/jquery-1.8.3.js"/>" type="text/javascript"></script>
    <script src="<rs:resourceURL value="/rs/jqueryui/1.7.2/jquery-ui-1.7.2-v2.min.js"/>" type="text/javascript"></script>
</c:if>
<script src="<rs:resourceURL value="/rs/fluid/1.1.3/js/fluid-all-1.1.3.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/batched-pager.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/email-browser.js"/>" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/email.css"/>"/>

<c:set var="n"><portlet:namespace/></c:set>
<portlet:resourceURL id="accountSummary" var="accountSummaryUrl" />
<portlet:actionURL var="showRollupUrl" windowState="normal">
<portlet:param name="action" value="showRollup"/>
</portlet:actionURL>
<portlet:resourceURL id="emailMessage" var="messageUrl" />
<portlet:resourceURL id="deleteMessages" var="deleteUrl" />
<portlet:resourceURL id="toggleSeen" var="toggleSeenUrl" />
<portlet:resourceURL id="updatePageSize" var="updatePageSizeUrl" />
<portlet:resourceURL id="inboxFolder" var="inboxFolderUrl" />

<c:if test="${showConfigLink}">
<portlet:renderURL var="configUrl" portletMode="CONFIG"/>
<p style="text-align: right;"><a href="${ configUrl }">Configure portlet</a></p>
</c:if>
<style type="text/css">
    label {
        clear: both;
        width: auto;
        float: none;
        text-align: right;
        margin: 0px 5px 10px 0px;
    }
    .portlet-container .col-md-2,
    .portlet-container .col-lg-2,
    .portlet-container .col-sm-12
    {
        padding-bottom: 15px;
    }
</style>
<div id="${n}container" class="email-container portlet" xmlns:rsf="http://ponder.org.uk">
    <div class="loading-message">
    </div>

    <div class="error-message portlet-msg-error portlet-msg error" role="alert" style="display:none">
        <p id="error-text"></p>
        <c:if test="${supportsEdit}">
        <p><spring:message code="preview.errorMessage.changePreferences.preLink"/> <a href="<portlet:renderURL portletMode="EDIT"/>"><spring:message code="preview.errorMessage.changePreferences.linkText"/></a> <spring:message code="preview.errorMessage.changePreferences.postLink"/></p>
    </c:if>
</div>

<div class="email-list" style="display: block;">



    <form name="inboxForm">
        <!--  -->




        <nav class="navbar navbar-default" role="navigation">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
          </button>

      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" style="height: 1px;">


        <ul class="nav navbar-nav ">
            <li>
                <a class="inbox-link email-action-link" href="" target="_blank">
                    <img alt="Refresh" src="/email-preview/rs/famfamfam/silk/1.3/email.png">
                    &nbsp;
                    <spring:message code="preview.toolbar.inbox"/>
                    (
                    <span class="unread-message-count"></span>
                    <spring:message code="preview.toolbar.unreadMessages"/>
                    )

                </a>
            </li>
            <li>
                <a class="refresh-link email-action-link" href="javascript:;">
                    <img alt="Refresh" src="<rs:resourceURL value="/rs/famfamfam/silk/1.3/arrow_refresh_small.png"/>"/>&nbsp;
                    <spring:message code="preview.toolbar.refresh"/>
                </a>
            </li>
            <li>
                <c:if test="${allowDelete}">
                <a class="delete-link email-action-link" href="javascript:;">
                    <img alt="Delete Selected" src="<rs:resourceURL value="/rs/famfamfam/silk/1.3/delete.png"/>"/>
                    &nbsp;
                    <span>
                        <spring:message code="preview.toolbar.deleteSelected"/>
                    </span>
                </a>
            </c:if>
        </li>
        <li>

            <a class="email-action-link" href="${showRollupUrl}"><img alt="Close" src="<rs:resourceURL value="/rs/famfamfam/silk/1.3/door_out.png"/>"/>&nbsp;<spring:message code="preview.toolbar.closePreview"/></a>
        </li>
        <li>
            <c:if test="${supportsEdit}">
            <a class="email-action-link" href="<portlet:renderURL portletMode="EDIT"/>"><img alt="Preferences" src="<rs:resourceURL value="/rs/famfamfam/silk/1.3/cog_edit.png"/>"/>&nbsp;<spring:message code="preview.toolbar.preferences"/></a>
        </c:if>
    </li>
    <li>
        <c:if test="${supportsHelp}">
        <a class="email-action-link" href="<portlet:renderURL portletMode="HELP"/>"><img alt="Preferences" src="<rs:resourceURL value="/rs/famfamfam/silk/1.3/help.png"/>"/> <spring:message code="preview.toolbar.help"/></a>
    </c:if>
</li>
<li>
  <a class="stats">| <img alt="Close" src="/email-preview/rs/famfamfam/silk/1.3/chart_bar.png"> <strong><spring:message code="common.quota"/>: </strong><span class="email-quota-usage"></span> / <span class="email-quota-limit"></span></a>
</li>
</ul>
</div><!-- /.navbar-collapse -->
</nav>
<!--  -->


<div class="fl-pager">

    <div class="flc-pager-top container">
        <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-12">
                <span class="flc-pager-previous">
                    <a href="javascript:;">
                        &lt; <spring:message code="preview.pager.previous"/>
                    </a>
                </span>
                <a href="javascript:;">1</a>
                <a href="javascript:;">2</a>
                <a class="flc-pager-pageLink-skip">...</a>
                <a href="javascript:;">3</a>
                <span class="flc-pager-next">
                    <a href="javascript:;">
                        <spring:message code="preview.pager.next"/>
                        &gt;
                    </a>
                </span>

            </div>
            <div class="col-lg-5 col-md-5 col-sm-12" >
                <label for="allFolders">
                    <spring:message code="preview.inboxFolder.choose"/>
                </label>
                <select class="form-control" id="allFolders" name="allFolders" style="width:60%; display: inline">
                    <option<            
                </option>
            </select>
        </div>

        <div class="col-lg-3 col-md-3 col-sm-12">

            <span>
                <!-- <spring:message code="preview.pager.perPage"/> -->
                <b>Par page</b>
                <select class="pager-page-size flc-pager-page-size form-control" style="width:50%; display: inline">
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <%-- James W - Removed option for 50 because it has some issues with behavior needing
                                     addressing.  See EMAILPLT-119
                                     <option value="50">50</option> --%>
                                 </select>

                             </span>


                         </div>
                     </div>
                 </div>
                 <!-- flc pager top -->

                 <br>
                 <table cellpadding="3" cellspacing="0" class="table table-responsive table-hover">

                     <thead>
                         <tr>
                            <th class="select"><input type="checkbox" class="select-all"></th>
                            <th class="flags-header">
                                <span class="flags-span"></span>
                            </th>
                            <th class="flags-header">
                                <span class="attached-span"></span>
                            </th>
                            <th><spring:message code="preview.column.subject"/></th>
                            <th><spring:message code="preview.column.sender"/></th>
                            <th><spring:message code="preview.column.dateSent"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr rsf:id="row:" class="email-row">
                            <td rsf:id="select" class="select"></td>
                            <td rsf:id="flags">
                                <span class="answered-span"></span>
                            </td>
                            <td rsf:id="attachments">
                                <span class="attached-span"></span>
                            </td>
                            <td rsf:id="subject" class="subject"></td>
                            <td rsf:id="sender" class="sender"></td>
                            <td rsf:id="sentDate" class="sentDate"></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </form>

    </div>

    <c:if test="${allowRenderingEmailContent}">
    <div class="email-message" style="display:none">
      <table cellpadding="0" cellspacing="0" class="message-headers">
          <tr><td class="message-header-name"><spring:message code="preview.message.from"/></td><td class="from"></td></tr>
          <tr><td class="message-header-name"><spring:message code="preview.message.subject"/></td><td class="subject"></td></tr>
          <tr><td class="message-header-name"><spring:message code="preview.message.date"/></td><td class="sentDate"></td></tr>
          <tr><td class="message-header-name"><spring:message code="preview.message.to"/></td><td class="toRecipients"></td></tr>
          <tr class="ccInfo"><td class="message-header-name"><spring:message code="preview.message.cc"/></td><td class="ccRecipients"></td></tr>
          <tr class="bccInfo"><td class="message-header-name"><spring:message code="preview.message.bcc"/></td><td class="bccRecipients"></td></tr>
      </table>
      <hr/>
      <span class="previous-msg"><a href="javascript:;">&lt; <spring:message code="preview.pager.previous"/></a></span>
      <span class="next-msg"><a href="javascript:;"><spring:message code="preview.pager.next"/> &gt;</a></span>                  
      <div class="message-content">
      </div>
      <form name="messageForm">
          <input class="message-uid" type="hidden" name="selectMessage" value=""/>
          <a class="return-link" style="margin-right: 1.5em;" href="javascript:;"><spring:message code="preview.message.returnToMessages"/></a>
          <c:if test="${allowDelete}">
          <input class="delete-message-button" type="button" value=" <spring:message code="preview.message.delete"/> "/>
      </c:if>
      <c:if test="${supportsToggleSeen}">
      <input class="mark-read-button" type="button" value=" <spring:message code="preview.message.markRead"/> " style="display: none;"/>
      <input class="mark-unread-button" type="button" value=" <spring:message code="preview.message.markUnread"/> " style="display: none;"/>
  </c:if>
</form>
</div>
</c:if>
</div>

<script type="text/javascript">

    var ${n} = {};
    ${n}.jQuery = jQuery<c:if test="${ includeJQuery }">.noConflict(true)</c:if>;
    ${n}.fluid = fluid;
    fluid = null;
    fluid_1_1 = null;

    ${n}.jQuery(function() {
        var $ = ${n}.jQuery;
        var fluid = ${n}.fluid;

        // Notify the server of changes to pageSize so they can be remembered
        var updatePageSize = function(newPageSize) {
            $.post("${updatePageSizeUrl}", {newPageSize: newPageSize});
        };

        var jsErrorMessages = {
            <c:forEach items="${jsErrorMessages}" var="entry" varStatus="status">
            '${entry.key}': '<spring:message code="${entry.value}"/>'<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    };

    var jsMessages = {
        <c:forEach items="${jsMessages}" var="entry" varStatus="status">
        '${entry.key}': '<spring:message code="${entry.value}"/>'<c:if test="${!status.last}">,</c:if>
    </c:forEach>
};

var options = {
 inboxFolderUrl: "${inboxFolderUrl}",
 accountSummaryUrl: "${accountSummaryUrl}",
 messageUrl: "${messageUrl}",
 messagesInfoContainer: "${messagesInfoContainer}",
 deleteUrl: "${deleteUrl}",
 toggleSeenUrl: "${toggleSeenUrl}",
 pageSize: <c:out value="${pageSize}"/>,
 listeners: {
    initiatePageSizeChange: updatePageSize
},
jsErrorMessages: jsErrorMessages,
jsMessages: jsMessages,
allowRenderingEmailContent: <c:out value="${allowRenderingEmailContent ? 'true' : 'false'}"/>,
markMessagesAsRead: <c:out value="${markMessagesAsRead ? 'true' : 'false'}"/>
};
        // Initialize the display asynchronously
        setTimeout(function() {
            jasig.EmailBrowser("#${n}container", options);
        }, 1);

    });

</script>
