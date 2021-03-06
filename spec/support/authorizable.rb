shared_examples 'a authorizable resource' do
  let(:resource) { create(described_class.to_s.underscore) }

  UserRoles.all.each do |role|
    context "#make_#{role}" do
      it "sets the resource's role to #{role}" do
        resource.send(:"make_#{role}")

        resource.should send("be_#{role}")
      end
    end
  end

  context 'on initialization' do
    it 'is registered by default' do
      resource.should be_registered
    end
  end
end
