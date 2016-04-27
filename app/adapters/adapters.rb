module Adapters
  class GitHubWrapper

    attr_accessor :client, :repo_name

    def initialize
      configure_client
    end

    def get_repo_create_date(lab)
      repo_name = lab.repo.split("/").last
      repo_data = client.repository("learn-co-students/#{repo_name}")
      repo_data.created_at
    end

    def get_lab_prs(lab)
      repo_name = lab.repo.split("/").last
      prs = client.pull_requests("learn-co-students/#{repo_name}")
      prs = prs.collect do |pr| 
        student = Student.find_by(github_username: pr.user.login)
        PullRequest.find_or_create_by(student: student, lab: lab, pr_number: pr.url.split("/").last)         
      end

      prs.each do |pr|
        client.pull_files("learn-co-students/#{repo_name}", pr.pr_number).each do |pr_file|
          if pr_file.filename.split(".").last == "rb" || pr_file.filename.split(".").last == "js"
            encoded_content = client.get(pr_file.contents_url).content 
            content = Base64.decode64(encoded_content).encode('UTF-8')
            pull_request = PullRequestFile.find_or_create_by(pull_request: pr, name: pr_file.filename)
            pr.save
            pull_request.update(content: content)
          end
        end
      end
      # pr_files = pr_numbers.collect { |num| client.pull_files("learn-co-students/#{repo_name}", num) }
      # #[[{file one content}, {file two content}], [{second students file one}, {second students second file}]]
      # contents = pr_files.collect do |files_by_student| 
      #   files_by_student.collect do |file|
      #     content = client.get(file.contents_url).content
      #     Base64.decode64(content)
      #   end
      # end.flatten
    end


    private

      def configure_client
        @client ||= Octokit::Client.new(:access_token => ENV['OCTO_TOKEN'])
      end
  end
end
