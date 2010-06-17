module Test
  module MongoMapperMacros
    def should_validate_presence_of(*attributes)
      attributes.each do |attr|
        should "validate presence of #{attr}" do
          obj = self.subject.class.new
          obj.send("#{attr}=", nil)
          assert !obj.valid?
          assert_not_nil obj.errors.on(attr)
        end
      end
    end
  end
end
