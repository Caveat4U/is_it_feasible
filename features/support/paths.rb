# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (RottenPotatoes )?home\s?page$/ then '/movies'
    when /^the movies page$/ then '/movies'
    #when /^\proposals\/(.+)$/ do |page_name| then '/proposals/' + page_name
    when /^proposals$/ then '/proposals'
    when /^proposals\/1$/ then '/proposals/1'
    when /^proposals\/2$/ then '/proposals/2'
    when /^proposals\/1\/edit$/ then '/proposals/1/edit'
    when /^proposals\/new$/ then '/proposals/new'
    when /^auth\/login$/ then '/auth/login'
    when /^auth\/register\/cmon_let_me_in$/ then '/auth/register/cmon_let_me_in'
    when /^reviews\/new\?proposal_id\=1$/ then '/reviews/new?proposal_id=1'


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
