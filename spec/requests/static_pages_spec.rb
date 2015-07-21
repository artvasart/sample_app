# require 'spec_helper'
#
# describe "StaticPages" do
#   describe "GET /static_pages" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get static_pages_index_path
#       response.status.should be(200)
#     end
#   end
# end

# require 'spec_helper'
#
# describe "Static pages" do
#
#   let(:base_title) { "Ruby on Rails Tutorial Sample App" }
#
#   describe "Home page" do
#
#     it "should have the content 'Sample App'" do
#       visit '/static_pages/home'
#       expect(page).to have_content('Sample App')
#     end
#
#     it "should have the title" do
#       visit '/static_pages/home'
#       expect(page).to have_title("#{base_title}")
#     end
#
#     it "should not have a custom page title" do
#       visit '/static_pages/home'
#       expect(page).not_to have_title('| Home')
#     end
#
#   end
#
#   describe "Help page" do
#
#     it "should have the content 'Help'" do
#       visit '/static_pages/help'
#       expect(page).to have_content('Help')
#     end
#
#     it "should have the title 'Help'" do
#       visit '/static_pages/help'
#       expect(page).to have_title("#{base_title} | Help")
#     end
#   end
#
#   describe "About page" do
#
#     it "should have the content 'About Us'" do
#       visit '/static_pages/about'
#       expect(page).to have_content('About Us')
#     end
#
#     it "should have the title 'About Us'" do
#       visit '/static_pages/about'
#       expect(page).to have_title("#{base_title} | About Us")
#     end
#   end
#
#   describe "Contact page" do
#
#     it "should have the content 'Contact'" do
#       visit '/static_pages/contact'
#       expect(page).to have_content('Contact')
#     end
#
#     it "should have the title 'Contact'" do
#       visit '/static_pages/contact'
#       expect(page).to have_title("#{base_title} | Contact")
#     end
#   end
# end

# require 'spec_helper'
#
# describe "Static pages" do
#
#   subject { page }
#
#   describe "Home page" do
#     before { visit root_path }
#
#     it { should have_content('Sample App') }
#     it { should have_title(full_title('')) }
#     it { should_not have_title('| Home') }
#   end
#
#   describe "Help page" do
#     before { visit help_path }
#
#     it { should have_content('Help') }
#     it { should have_title(full_title('Help')) }
#   end
#
#   describe "About page" do
#     before { visit about_path }
#
#     it { should have_content('About') }
#     it { should have_title(full_title('About Us')) }
#   end
#
#   describe "Contact page" do
#     before { visit contact_path }
#
#     # it { should have_content('Contact') }
#     it {should have_selector('h1',text: 'Contact')}
#     it { should have_title(full_title('Contact')) }
#   end
# end

require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before {visit help_path}
    let(:heading) {'Help'}
    let(:page_title) {'Help'}

    it_should_behave_like "all static pages"
  end

    describe "About page" do
      before {visit about_path}
      let(:heading) {'About Us'}
      let(:page_title) {'About Us'}

      it_should_behave_like "all static pages"
  end

    describe "Contact page" do
        before {visit contact_path}
        let(:heading) {'Contact'}
        let(:page_title) {'Contact'}

        it_should_behave_like "all static pages"
    end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help')) # заполнить
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))# заполнить
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))# заполнить
    click_link "sample app"
    expect(page).to have_title(full_title(''))
  end
end
