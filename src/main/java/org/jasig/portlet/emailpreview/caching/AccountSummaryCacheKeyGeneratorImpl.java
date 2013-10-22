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
package org.jasig.portlet.emailpreview.caching;

/**
 * Generates cache keys for user email accounts
 *
 * @author James Wennmacher, jwennmacher@unicon.net
 */

public class AccountSummaryCacheKeyGeneratorImpl implements IAccountSummaryCacheKeyGenerator {

    @Override
    public String getKey(String loginId, String hostSystem, String folder, String protocol) {
        final StringBuilder key = new StringBuilder();
        key.append(protocol).append(".").append(loginId).append(".").append(folder).append(".").append(hostSystem).toString();
        return key.toString();
    }
}
