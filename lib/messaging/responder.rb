#- This Source Code Form is subject to the terms of the Mozilla Public
#- License, v. 2.0. If a copy of the MPL was not distributed with this
#- file, You can obtain one at http://mozilla.org/MPL/2.0/.

# -*- encoding : utf-8 -*-
module Messaging
	class Responder
		#
		def initialize(sender)
			@sender = sender
		end

		# respond to messages
		def respond_to_messages(messages, send_responses)
			messages.each do |message|
				Sms::Message.transaction do
					# respond to message
					response = create_response(message)

					# no response
					next if response.nil?

					# send responses?
					sender.send(response) if send_responses
				end
			end
		end

		# respond to message
		def respond_to_message(message, send_response)
			Sms::Message.transaction do
				# get responder and respond to message
				response = create_response(message)

				# no response
				return response if response.nil?

				# send response
				sender.send(response) if send_response

				response
			end
		end

	protected
		#
		attr_reader(:sender)

	private
		#
		def create_response(message)
			begin
				# thread message
				if message.subscriber
					message.parent = message.subscriber.messages.sent.last
				end

				# return reply
				body = respond(message)

				return nil if body.blank?

				message.send_reply(body)

			ensure
				# save message
				message.save
			end
		end
	end
end
