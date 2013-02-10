require 'spec_helper'

module Railswizard
describe Web do
  let(:web) {described_class.new}
  describe '#recipes' do
    let(:body) do <<-EOS
<ul class='recipes' id='unused_recipes'>
<li class='persistence x_orm' data-name="activerecord" data-category='persistence' data-exclusive=&#x27;orm&#x27;>
  <input id="rails_template_recipes_" name="rails_template[recipes][]" type="hidden" value="activerecord" />
  <b>ActiveRecord</b>
</li>
<li class='testing x_acceptance_testing' data-name="capybara" data-category='testing' data-exclusive=&#x27;acceptance_testing&#x27;>
  <input id="rails_template_recipes_" name="rails_template[recipes][]" type="hidden" value="capybara" />
  <b>Capybara</b>
</li>
</ul>
    EOS
    end
    before do
      Faraday.should_receive(:get).with(Web::INDEX_URL).and_return(double(body: body))
    end
    it "returns recipes" do
      recipes = Recipes.new [
        Recipe.new(category: "persistence", name: "ActiveRecord", key: "activerecord", exclusive: "orm"),
        Recipe.new(category: "testing", name: "Capybara", key: "capybara", exclusive: "acceptance_testing"),
      ]
      web.recipes.should == recipes
    end
  end
end
end
