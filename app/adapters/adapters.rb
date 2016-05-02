module Adapters
  class GitHubWrapper

    attr_accessor :client, :current_time, :repo_name, :lab

    def initialize
      configure_client
    end

    def get_repo_create_date(lab)
      repo_name = lab.repo.split("/").last
      repo_data = client.repository("learn-co-students/#{repo_name}")
      repo_data.created_at
    end

    def get_lab_prs(lab_id)
      set_lab(lab_id)
      repo_name = lab.repo.split("/").last
      prs = client.pull_requests("learn-co-students/#{repo_name}")
      prs = prs.collect do |pr| 
        student = Student.find_by(github_username: pr.user.login)
        pull_request = PullRequest.find_or_create_by(student: student, pr_number: pr.url.split("/").last, url: pr.url)
        lab.pull_requests << pull_request
        lab.save  
        pull_request      
      end
      prs.each do |pr|

        client.pull_files("learn-co-students/#{repo_name}", pr.pr_number).each do |pr_file|
          if pr_file.filename.split(".").last == "rb" || pr_file.filename.split(".").last == "js"
            encoded_content = client.get(pr_file.contents_url, since: current_time).content 
            content = Base64.decode64(encoded_content).encode('UTF-8')
            pull_request = PullRequestFile.find_or_create_by(pull_request: pr, name: pr_file.filename.downcase)
            pr.save
            pull_request.update(content: content)
          end
        end
      end
    end


    private

      def configure_client
        @client = Octokit::Client.new(login: ENV["GITHUB_USERNAME"], password: ENV["GITHUB_PASSWORD"])
      end

      def set_lab(lab_id)
        @lab = Lab.find(lab_id)
      end
  end
end
