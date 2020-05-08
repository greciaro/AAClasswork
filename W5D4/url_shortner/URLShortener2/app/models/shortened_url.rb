# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'byebug'

class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true , uniqueness: true
    validates :short_url, presence: true , uniqueness: true

    belongs_to :submitter,
        primary_key: :id, 
        foreign_key: :submitter_id,
        class_name: :User 


    def self.random_code
        loop do
            random_code = SecureRandom.urlsafe_base64(16)
            return random_code if !ShortenedUrl.exists?(short_url: random_code)
        end
    end

    #keep generating codes until we find one that isn't the same as one
    # already stored as the short_url of any record in our table.
    # Return the first unused random code.

    def self.factory_create(user,long_url)
        ShortenedUrl.create!(
            long_url: long_url,
            short_url: ShortenedUrl.random_code,
            submitter_id: user.id
        )
    end

end


