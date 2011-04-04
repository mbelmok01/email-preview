/**
 * Licensed to Jasig under one or more contributor license
 * agreements. See the NOTICE file distributed with this work
 * for additional information regarding copyright ownership.
 * Jasig licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a
 * copy of the License at:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.jasig.portlet.emailpreview.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
*
* @author Drew Wills, drew@unicon.net
*/
public final class MessageUtils {
    
    private static final String CLICKABLE_URLS_REGEX =
        "\\b((?:(?:https?|ftp|file)://|www\\.|ftp\\.)" +
        "(?:\\([-A-Z0-9+&@#/%=~_|$?!:,.]*\\)|[-A-Z0-9+&@#/%=~_|$?!:,.])*" +
        "(?:\\([-A-Z0-9+&@#/%=~_|$?!:,.]*\\)|[A-Z0-9+&@#/%=~_|$]))";
    private static final Pattern CLICKABLE_URLS_PATTERN = Pattern.compile(CLICKABLE_URLS_REGEX, Pattern.CASE_INSENSITIVE);
    private static final String CLICKABLE_URLS_PART1 = "<a href=\"";
    private static final String CLICKABLE_URLS_PART2 = "\" target=\"_new\">";
    private static final String CLICKABLE_URLS_PART3 = "</a>";
    private static final Log LOG = LogFactory.getLog(MessageUtils.class);

    
    public static String addClickableUrlsToMessageBody(String msgBody) {
        
        // Assertions.
        if (msgBody == null) {
            String msg = "Argument 'msgBody' cannot be null";
            throw new IllegalArgumentException(msg);
        }

        StringBuffer rslt = new StringBuffer();

        Matcher m = CLICKABLE_URLS_PATTERN.matcher(msgBody);
        while (m.find()) {
            StringBuilder bldr = new StringBuilder();
            String text = m.group(1);
            // Handle special case where URL not prefixed with required protocol
            String url = text.startsWith("www.") 
                                ? "http://" + text 
                                : text;
            if (LOG.isDebugEnabled()) {
                LOG.debug("Making embedded URL '" + text + 
                        "' clickable at the following href:  " + url);
            }
            bldr.append(CLICKABLE_URLS_PART1).append(url)
                        .append(CLICKABLE_URLS_PART2).append(text)
                        .append(CLICKABLE_URLS_PART3);
            m.appendReplacement(rslt, bldr.toString());
        }
        m.appendTail(rslt);

        return rslt.toString();
        
    }

}
