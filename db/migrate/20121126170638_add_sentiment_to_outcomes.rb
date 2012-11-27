class AddSentimentToOutcomes < ActiveRecord::Migration
  def change
  	add_column :outcomes, :ignored_terms, :string
  	add_column :outcomes, :affection_friendliness, :float
  	add_column :outcomes, :enjoyment_elation, :float
  	add_column :outcomes, :amusement_excitement, :float
  	add_column :outcomes, :contentment_gratitude, :float
  	add_column :outcomes, :sadness_grief, :float
  	add_column :outcomes, :anger_loathing, :float
  	add_column :outcomes, :fear_uneasiness, :float
  	add_column :outcomes, :humiliation_shame, :float
  	add_column :outcomes, :sentiment, :string
  	add_column :outcomes, :sentiment_score, :float
  	add_column :outcomes, :coverage, :float
  	add_column :outcomes, :intense_sentence, :string
  	add_column :outcomes, :i_sentence_emotion, :string
  	add_column :outcomes, :i_sentence_intensity, :float
  	add_column :outcomes, :clarity, :float
  	remove_column :outcomes, :intensity
  end
end
