module ApiAccessible
  extend ActiveSupport::Concern

  included do
    before_action :authorization_key!
  end

  def authorization_key!
    return head :unauthorized unless verify_signature
  end

  private

  def user_not_authorized
    render status: :forbidden, body: :nil
  end

  def verify_signature
    byebug
    Rack::Utils.secure_compare(signature, github_signature)
  end

  def payload_body
    request.body.read
  end

  def signature
    "sha1=#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), secret_token, payload_body)}"
  end

  def secret_token
    Rails.application.credentials.github[:secret_access_key]
  end

  def github_signature
    request.env['HTTP_X_HUB_SIGNATURE'] || ''
  end

end
