class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands

  before_save(:capitalize_description)
  validates(:description, :presence => true)

private
  define_method(:capitalize_description) do
    description.capitalize!()
  end
end
