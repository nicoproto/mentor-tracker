require 'json'
require 'open-uri'

class Mentoree < ApplicationRecord
  has_many :user_mentorees, dependent: :destroy
  before_create :fetch_github_data

  # TODO: Move this logic to a service
  def fetch_github_data
    github_url = "https://api.github.com/users/#{self.github_username}"
    github_serialized_data = URI.open(github_url).read
    user_data = JSON.parse(github_serialized_data)

    self.avatar_url = user_data['avatar_url']
    self.name = user_data['name']
    self.location = user_data['location']
    self.email = user_data['email']
    self.hireable = user_data['hireable']
    self.public_repos = user_data['public_repos']
  end

  def fetch_github_events
    # TODO: Move this logic to a service
    github_url = "https://api.github.com/users/#{self.github_username}/events?per_page=100"
    github_serialized_data = URI.open(github_url).read
    user_data = JSON.parse(github_serialized_data)

    user_data.map do |data|
      commits = if data['payload']['commits']
        data['payload']['commits'].map do |commit|
          {
            message: commit['message'],
            url: commit['url'].gsub("commits", "commit").gsub("api", "www").gsub("repos/", "").gsub("git/", "")
          }
        end
      else
        nil
      end

      {
        type: data['type'],
        repo_name: data['repo']['name'],
        commits_count: data['payload']['size'],
        commits: commits,
        date: data['created_at'].to_datetime
      }
    end
  end
end
