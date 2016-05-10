cohort = Cohort.create(name: "web-0416")
lab = Lab.create(name: "Strong Params Basics", 
  repo: "https://github.com/learn-co-students/strong-params-basics-web-0416", 
  deploy_date: Date.today, 
  cohort: cohort)
cohort.roster_csv_file_name = "students.csv"
cohort.create_members
cohort.save
