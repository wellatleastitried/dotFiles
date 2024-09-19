#!/usr/bin/env ruby

require 'googleauth'
require 'google/apis/gmail_v1'
require 'fileutils'
require 'googleauth/stores/file_token_store'

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
APP_NAME = 'Ruby Gmail API'.freeze
script_dir = File.expand_path('..', __dir__)
creds_dir = File.join(script_dir, '.emailScript')
FileUtils.mkdir_p(creds_dir)
CREDS_PATH = File.join(creds_dir, 'credentials.json').freeze
TOKEN_PATH = File.join(creds_dir, 'token.yaml').freeze
SCOPE = Google::Apis::GmailV1::AUTH_GMAIL_READONLY
def authorize
    client_id = Google::Auth::ClientId.from_file(CREDS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
        url = authorizer.get_authorization_url(base_url: OOB_URI)
        puts "Open the following URL in your browser and authorize the application."
        puts url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(
            user_id: user_id, code: code, base_url: OOB_URI
        )
    end
    credentials
end
service = Google::Apis::GmailV1::GmailService.new
service.client_options.application_name = APP_NAME
service.authorization = authorize
user_id = 'me'
result = service.list_user_messages(user_id, q: 'is:unread')
messages = result.messages
puts "You have #{messages ? messages.size : 0} new emails."
#messages.each do |message|
#    puts "Message ID: #{message.id}"
#end