class Address < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :address1
  validates_presence_of :city
  validates_presence_of :state, :if => Proc.new { |address| address.state_name.blank? }
  validates_presence_of :state_name, :if => Proc.new { |address| address.state.blank? }
  validates_presence_of :zipcode
  validates_presence_of :country
  validates_presence_of :phone

  def full_name
    self.firstname + " " + self.lastname
  end

  def state_text
    state.nil? ? state_name : (state.abbr.blank? ? state.name : state.abbr)
  end

  def zone
    (state && state.zone) ||
    (country && country.zone)
  end

  def zones

  end
end
