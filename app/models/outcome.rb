class Outcome < ActiveRecord::Base
	require 'lymbix'
	
	before_save :analyze_semantics

	attr_accessible :description
	belongs_to :ask
	belongs_to :contact
	belongs_to :user

	serialize :ignored_terms

	def analyze_semantics
		lymbix = Lymbix::Base.new('a1393fdbe8e4b0a2f547b287d60410563ef6d043')
		tone = lymbix.tonalize(self.description)
		self.ignored_terms = tone["ignored_terms"]
		self.affection_friendliness = tone["affection_friendliness"]
		self.enjoyment_elation = tone["enjoyment_elation"]
		self.amusement_excitement = tone["amusement_excitement"]
		self.contentment_gratitude = tone["sadness_grief"]
		self.sadness_grief = tone["sadness_grief"]
		self.anger_loathing = tone["anger_loathing"]
		self.fear_uneasiness = tone["fear_uneasiness"]
		self.humiliation_shame = tone["humiliation_shame"]
		self.dominant_emotion = tone["dominant_emotion"]
		self.sentiment = tone["article_sentiment"]["sentiment"]
		self.sentiment_score = tone["article_sentiment"]["score"]
		self.coverage = tone["coverage"]
		self.intense_sentence = tone["intense_sentence"]["sentence"]
		self.i_sentence_emotion = tone["intense_sentence"]["dominant_emotion"]
		self.i_sentence_intensity = tone["intense_sentence"]["intensity"]
		self.clarity = tone["clarity"]
	end

end