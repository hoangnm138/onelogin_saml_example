# frozen_string_literal: true

class SamlService
  def get_saml_settings(url_base)
    # this is just for testing purposes.
    # should retrieve SAML-settings based on subdomain, IP-address, NameID or similar
    settings = OneLogin::RubySaml::Settings.new

    url_base ||= ENV['URL_BASE']

    # When disabled, saml validation errors will raise an exception.
    settings.soft = true

    # SP section
    settings.issuer                         = url_base + '/saml/metadata'
    settings.assertion_consumer_service_url = url_base + '/saml/acs'
    settings.assertion_consumer_logout_service_url = url_base + '/saml/logout'

    onelogin_app_id = ENV['ONELOGIN_APP_ID']

    # IdP section
    settings.idp_entity_id                  = "https://app.onelogin.com/saml/metadata/#{onelogin_app_id}"
    settings.idp_sso_target_url             = "https://app.onelogin.com/trust/saml2/http-redirect/sso/#{onelogin_app_id}"
    settings.idp_slo_target_url             = "https://app.onelogin.com/trust/saml2/http-redirect/slo/#{onelogin_app_id}"
    settings.idp_cert                       = ''

    # or settings.idp_cert_fingerprint
    settings.idp_cert_fingerprint_algorithm = XMLSecurity::Document::SHA1
    settings.idp_cert_fingerprint = ENV['IDP_CERT_FINGERPRINT']
    settings.name_identifier_format = 'urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress'

    # Security section
    settings.security[:authn_requests_signed] = false
    settings.security[:logout_requests_signed] = false
    settings.security[:logout_responses_signed] = false
    settings.security[:A] = false
    settings.security[:digest_method] = XMLSecurity::Document::SHA1
    settings.security[:signature_method] = XMLSecurity::Document::RSA_SHA1

    settings
  end
end
