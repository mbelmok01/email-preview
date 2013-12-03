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
<%@ page contentType="text/html" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="rs" uri="http://www.jasig.org/resource-server" %>

<portlet:defineObjects/>


<script type="text/javascript" src="/../email-preview/rs/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<link type="text/css" href="/../email-preview/rs/bootstrap/3.0.2/css/bootstrap-modified.css" rel="stylesheet" />
<script type="text/javascript" src="/../email-preview/rs/bootstrap/3.0.2/js/bootstrap.min.js"></script>
<link type="text/css" href="/../email-preview/rs/bootstrap/3.0.2/css/bootstrap-theme.min.css" rel="stylesheet" />

<%-- Portlet container --%>
<div class="portlet-container sm">
 
 
<script type="text/javascript">
 
    var $portletContainers;
 
$(document).ready(function() {
    $portletContainers = $(".portlet-container");
    // Resize event isn't fired on DOM Content Loaded, we launch the function manually
    onWindowResize();
  $(window).resize(onWindowResize);
});
 
function onWindowResize() {
    $portletContainers.each(function(index) {
        
        var $that = $(this);
        var portletWidth = $that.width()
        
        $that.removeClass("xs sm md lg");
        
        if(portletWidth < 768)
            $that.addClass("xs");
        if(portletWidth >= 768 && portletWidth < 992)
            $that.addClass("sm");
        if(portletWidth >= 992 && portletWidth < 1200)
            $that.addClass("md");
        if(portletWidth >= 1200)
            $that.addClass("lg");
    
    });
}
 
</script>
 
<!-- Your code here -->
