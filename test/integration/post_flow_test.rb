require 'test_helper'
class JobFlowTest < ActionDispatch::IntegrationTest
    def setup
        @one = jobs(:first_job)
        @two = jobs(:second_job)
        @three = jobs(:third_job)
    end
    
    test "job index" do
        visit jobs_path
        assert_content page, "Jobs"
        assert_content page, @one.name
        assert_content page, @two.name
        assert_content page, @three.name
    end

    test "job show" do
        visit jobs_path
        click_link "Show #{@one.name}"
        assert_content page, @one.name
        assert_content page, @one.description
    end

    test "custom user flow" do
        # get to root
        visit jobs_path
        #enter to three
        click_link "Show #{@three.name}"
        assert_content page, @three.name
        assert_content page, @three.description
        assert_content page, "Destroy this job"
        assert_content page, "Edit this job"
        assert_content page, "Back to jobs"
        #delete Three
        click_button "Destroy this job"
        #return to root
        assert_content page, "Jobs"
        assert_content page, @one.name
        assert_content page, @two.name
        #enter to two
        click_link "Show #{@two.name}"
        assert_content page, @two.name
        assert_content page, @two.description
        assert_content page, "Destroy this job"
        assert_content page, "Edit this job"
        assert_content page, "Back to jobs"
        #return to root
        click_link "Back to jobs"
        #enter to one
        click_link "Show #{@one.name}"
       end
end

