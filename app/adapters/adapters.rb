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
      pull_requests = get_prs(prs)
      get_pr_files(pull_requests, repo_name)
    end


    private

      def configure_client
        @client = Octokit::Client.new(login: ENV["GITHUB_USERNAME"], password: ENV["GITHUB_PASSWORD"])
      end

      def set_lab(lab_id)
        @lab = Lab.find(lab_id)
      end

      def get_pr_files(prs, repo_name)
        prs.each do |pr|
          client.pull_files("learn-co-students/#{repo_name}", pr.pr_number).each do |pr_file|
            if pr_file.filename.split(".").last == "rb" || pr_file.filename.split(".").last == "js"
              content = get_and_decode_content(pr_file)
              build_pr_file(pr, pr_file, content)
            end
          end
        end
      end

      def get_prs(prs)
        prs = prs.collect do |pr| 
          student = Student.find_by(github_username: pr.user.login)
          pull_request = PullRequest.find_or_create_by(student: student, pr_number: pr.url.split("/").last, url: pr.url)
          lab.pull_requests << pull_request
          lab.save  
          pull_request      
        end
      end

      def build_pr_file(pr, pr_file, content)
        pull_request_file = PullRequestFile.find_or_create_by(pull_request: pr, name: pr_file.filename.downcase)
        pr.save
        pull_request_file.update(content: content)
      end

      def get_and_decode_content(pr_file)
        encoded_content = client.get(pr_file.contents_url, since: current_time).content 
        Base64.decode64(encoded_content).encode('UTF-8')
      end
  end
end
