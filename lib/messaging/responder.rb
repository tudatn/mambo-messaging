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
					response = respond(message)

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
				response = respond(message)

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
		def respond(message)
			begin
				# thread message
				if !message.subscriber.nil?
					message.parent = message.subscriber.messages.sent.last
				end

				# return reply
				return reply_to(message, reply(message))

			ensure
				# save message
				message.save
			end
		end

		#
		def reply_to(message, body)
			return nil if body.nil?
			return nil if body.empty?
			return Sms::Message.create_reply(message, body)
		end
	end
end
