# -*- encoding : utf-8 -*-
module Messaging
	class Service
		#
		def initialize(sender)
			@sender = sender
		end

	protected
		#
		attr_reader(:sender)
	end
end
