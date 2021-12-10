FactoryBot.define do
  factory :mentoree do
    github_username { "MyString" }
    avatar_url { "MyString" }
    name { "MyString" }
    location { "MyString" }
    email { "MyString" }
    hireable { false }
    public_repos { 1 }
  end
end
