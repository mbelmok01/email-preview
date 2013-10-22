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

import javax.portlet.PortletRequest;

import org.jasig.portlet.emailpreview.MailStoreConfiguration;
import org.jasig.portlet.emailpreview.service.auth.IAuthenticationService;

public final class EmailAccountUtils {

  private final static Pattern DOMAIN_PATTERN = Pattern.compile("\\.([a-zA-Z0-9]+\\.[a-zA-Z0-9]+)\\z");
  private final static Pattern IP_ADDRESS_PATTERN = Pattern.compile("\\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\b");
  
  public static String determineUserEmailAddress(final PortletRequest req, final MailStoreConfiguration config, 
                                             final IAuthenticationService authService) {

    String emailAddress = null;
    final String mailAccount = authService.getMailAccountName(req, config);
    final String nameSuffix = config.getUsernameSuffix();
    final String serverName = config.getHost();
    if (mailAccount.contains("@")) {
      emailAddress = mailAccount;
    } else if (nameSuffix != null && nameSuffix.length() != 0)  {
      emailAddress = mailAccount + nameSuffix;
    } else if (IP_ADDRESS_PATTERN.matcher(serverName).find()) { 
        emailAddress = mailAccount;
    } else {
      emailAddress = mailAccount;
      final Matcher m = DOMAIN_PATTERN.matcher(serverName);
      if (m.find()) {
        emailAddress = emailAddress + "@" + m.group(1);
      }
    }
    return emailAddress;
  }

}