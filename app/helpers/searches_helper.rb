module SearchesHelper
    def scrubbed(string)
        string.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '').split(" ").join(" ").downcase
    end
end
