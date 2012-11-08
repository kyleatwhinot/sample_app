module AsksHelper


	def helpmailer
		HelpOthersMailer.i_can_help2.deliver
	end
end
