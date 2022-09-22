require_relative 'item'
require 'date'

class Movie < Item
  attr_accessor :silet, :name

  def initialize(name, date, silet)
    super(date)
    @name = name
    @silet = silet
  end

  def can_be_archived?
    (Date.today - Date.parse(@publish_date)) > 3650 || silet
  end
end
