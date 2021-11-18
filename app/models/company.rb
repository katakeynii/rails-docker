class Company < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    validates :name, presence: true
    validates :code, presence: true
    before_validation :generate_code

    private
    def generate_code
        formatted_code = SecureRandom
            .hex(3)
            .to_i(16)
            .to_s
            .reverse
            .scan(/\d{1,3}/)
            .join("-")
        self.code = "CPY--#{formatted_code}"
    end
end
