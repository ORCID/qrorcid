package org.orcid.examples.jopmts.oauth;

import java.util.Arrays;
import java.util.List;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.client.resource.UserRedirectRequiredException;
import org.springframework.security.oauth2.client.token.AccessTokenProvider;
import org.springframework.security.oauth2.client.token.AccessTokenProviderChain;
import org.springframework.security.oauth2.client.token.AccessTokenRequest;
import org.springframework.security.oauth2.client.token.grant.code.AuthorizationCodeAccessTokenProvider;
import org.springframework.security.oauth2.common.OAuth2AccessToken;

/**
 * 
 * @author Will Simpson
 * 
 */
public class OrcidAccessTokenProviderChain extends AccessTokenProviderChain {

    public OrcidAccessTokenProviderChain() {
        this(Arrays.<AccessTokenProvider> asList(new AuthorizationCodeAccessTokenProvider()));
    }

    public OrcidAccessTokenProviderChain(List<? extends AccessTokenProvider> chain) {
        super(chain);
    }

    @Override
    public OAuth2AccessToken obtainAccessToken(OAuth2ProtectedResourceDetails resource, AccessTokenRequest request) throws UserRedirectRequiredException,
            AccessDeniedException {
        OAuth2AccessToken accessToken = null;
        if (accessToken == null) {
            // looks like we need to try to obtain a new token.
            accessToken = obtainNewAccessTokenInternal(resource, request);
            if (accessToken == null) {
                throw new IllegalStateException("An OAuth 2 access token must be obtained or an exception thrown.");
            }
        }
        return accessToken;
    }

}
