class Movie < ActiveRecord::Base
	has_many :reviews
  before_save :capitalize_title
  attr_accessible :title, :rating, :description, :release_date
  def self.all_ratings ; %w[G PG PG-13 R NC-17] ; end #  shortcut: array of strings
  validates :title, :presence => true
  validates :release_date, :presence => true
  validate :released_1930_or_later # uses custom validator below
  validates :rating, :inclusion => {:in => Movie.all_ratings},
    :unless => :grandfathered?
  class Movie::InvalidKeyError < StandardError ; end
 
  def self.find_in_tmdb(string)
    begin
      Tmdb::Api.key("833c99fbde3aef0813a5ae61e427c0e8")
      Tmdb::Movie.find(string)
    rescue NoMethodError => tmdb_gem_exception
      if Tmdb::Api.response['code'] == 401
        raise Movie::InvalidKeyError, 'Invalid API key'
      else
        raise tmdb_gem_exception
      end
    end
  end
  def released_1930_or_later
    errors.add(:release_date, 'must be 1930 or later') if
      release_date && release_date < Date.parse('1 Jan 1930')
  end
  @@grandfathered_date = Date.parse('1 Nov 1968')
  def grandfathered?
    release_date && release_date >= @@grandfathered_date
  end
  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).
      map(&:capitalize).join(' ')
  end
  scope :with_good_reviews, lambda { |threshold|
    Movie.joins(:reviews).group(:movie_id).
      having(['AVG(reviews.potatoes) > ?', threshold.to_i])
  }
  scope :for_kids, lambda {
    Movie.where('rating in (?)', %w(G PG))
  }
end
