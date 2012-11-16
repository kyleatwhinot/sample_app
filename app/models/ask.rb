class Ask < ActiveRecord::Base
  #include ActiveModel::Dirty

  attr_accessible :category, :description, :done, :followed_up, :helper, :public, :date_done, :date_followed_up, :user_id
  belongs_to :user
  default_scope order: 'asks.created_at ASC'

  #define_attribute_methods = [:description, :public, :helper, :category, :date_done, :done]


  
  def save 
    @previously_changed = changes 
    @changed_attributes.clear 
  end

  def description=(val)
    description_will_change! unless val == @description
    @description = val
  end

  def public=(val)
    public_will_change! unless val == @public
    @public = val
  end

  def helper=(val)
    helper_will_change! unless val == @helper
    @helper = val
  end

  def category=(val)
    category_will_change! unless val == @category
    @category = val
  end

  def date_done=(val)
    date_done_will_change! unless val == @date_done
    @date_done = val
  end

  def done=(val)
    done_will_change! unless val == @done
    @done = val
  end

  def check_change(attributes)
    self.assign_attributes(attributes)
    if self.changed.include? "description"
      description_will_change!
      self.update_attributes(attributes)
      return "ask2"
    elsif self.changed.include? ("public" || "helper")
      self.update_attributes(attributes)
      return "ask3"
    elsif self.changed.include? "category"
      self.update_attributes(attributes)
      return "ask4"
    elsif self.changed.include? "done" 
      self.update_attributes(attributes)
      return "ask4"
    end
  end
end
