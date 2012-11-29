# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Publications" do
    describe "Admin" do
      describe "publications" do
        login_refinery_user

        describe "publications list" do
          before do
            FactoryGirl.create(:publication, :authors => "UniqueTitleOne")
            FactoryGirl.create(:publication, :authors => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.publications_admin_publications_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.publications_admin_publications_path

            click_link "Add New Publication"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Authors", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Publications::Publication.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Authors can't be blank")
              Refinery::Publications::Publication.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:publication, :authors => "UniqueTitle") }

            it "should fail" do
              visit refinery.publications_admin_publications_path

              click_link "Add New Publication"

              fill_in "Authors", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Publications::Publication.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:publication, :authors => "A authors") }

          it "should succeed" do
            visit refinery.publications_admin_publications_path

            within ".actions" do
              click_link "Edit this publication"
            end

            fill_in "Authors", :with => "A different authors"
            click_button "Save"

            page.should have_content("'A different authors' was successfully updated.")
            page.should have_no_content("A authors")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:publication, :authors => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.publications_admin_publications_path

            click_link "Remove this publication forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Publications::Publication.count.should == 0
          end
        end

      end
    end
  end
end
