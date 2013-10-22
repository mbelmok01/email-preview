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
 * 
 * @author James Wennmacher, jwennmacher@unicon.net
 */
public interface IMailAccountCacheKeyGenerator {

	/**
	 * Returns a cache key for the user and email system hostname for selected prefix
	 * 
	 *
     *
     * @param loginId username
     * @param hostSystem mail system fully-qualified hostname
     * @param prefix prefix
     * @return cache key for the user
	 */
	String getKey(String loginId, String hostSystem, String prefix);

}