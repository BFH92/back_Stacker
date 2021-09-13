# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
size = ["0..9", "10..49", "50..249", "250..+"]

backend_stacks = [
  "Node.js", 
  "Python",
  "Php",
  "PostgreSQL", 
  "Java", 
  "Elasticsearch",
  "MySQL",
  "Symphony",
  "MongoDB",
  "Redis",
  "Django",
  "Ruby",
  "Ruby on Rails"
]

frontend_stacks = [
  "React.js",
  "JavaScript", 
  "Vue.js",
  "TypeScript", 
  "HTML5", 
  "Angular", 
  "CSS3", 
  "SASS", 
  "Redux.js",
  "Angular.js"
]

devops_stacks = [
  "Docker", 
  "AWS",
  "Kubernetes",
  "GitLab", 
  "Ansible", 
  "GitHub", 
  "Git", 
  "Google Cloud Platform",
  "Terraform", 
  "Azur"
]

data_stacks = [
  "Python(dataScience)",
  "Graphana", 
  "Apache Spark", 
  "Google Analytics", 
  "Kibana", 
  "Hadoop",
  "Tableau", 
  "TensorFlow", 
  "Google BigQuery", 
  "R", 
]

mobile_stacks = [
  "React Native", 
  "Kotelin (Android)", 
  "Java (Android)",
  "Objective-C(IOS)", 
  "Ionic", 
  "Apache Cordova",
  "Flutter", 
  "Android SDK", 
  "PWA", 
  "Swift(IOS)" 
]

project_management_stacks = [
  "Slack", 
  "Trello", 
  "Confluence", 
  "Notion.so",
  "Asana", 
  "InVision",
  "Microsoft Teams",
  "Google Drive",
  "RedMine", 
  "GitHub Issues",
  "Jira", 
]

ide_stacks = [
  "Visual Studio Code",
  "Intelligy", 
  "Sublime Text", 
  "Atom",
  "Vim",
  "Eclipse", 
  "Android Studio",
  "Xcode", 
  "PHP Storm"
]

nocode_stacks = [
  "WebFlow",
  "Joomla",
  "Wix", 
  "SquareSpace",
  "Drupal", 
  "Bitrix", 
  "Blogger",
  "Strapi",
  "Zapier", 
  "Bubble",
  "Magento",
  "Integromat",
  "AirTable",
  "Umso",
  "Adalo",
  "Glide",
  "Clickup", 
  "WordPress"
]

10.times do 
  company = Company.create!(
    name: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    # email: "",
    github_link: "https://github.com/",
    website_link: Faker::Internet.domain_name(domain: "supercompany"),
    staff_size: size.sample,
    is_it_recruiting: Faker::Boolean.boolean,
    company_category_id: Faker::Number.between(from: 1, to: 5)
  )
end

10.times do 
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    github_link: "https://github.com/"
  )
end

1.times do 
  back_end = StackCategory.create!(
    name: "Backend Frameworks & Languages"
  )
end

1.times do 
  back_end = StackCategory.create!(
    name: "FrontEnd Frameworks & Languages"
  )
end

1.times do 
  back_end = StackCategory.create!(
    name: "DevOps"
  )
end

1.times do 
  back_end = StackCategory.create!(
    name: "Data")
end

1.times do 
  back_end = StackCategory.create!(
    name: "Mobile"
  )
end

1.times do 
  back_end = StackCategory.create!(
    name: "Project Management"
  )
end

1.times do 
  back_end = StackCategory.create!(
    name: "IDE"
  )
end

1.times do 
  back_end = StackCategory.create!(
    name: "NoCode"
  )
end

10.times do |i|
  stack = Stack.create!(
    name: backend_stacks[i],
    stack_category_id: 1
  )
end

10.times do |i|
  stack = Stack.create!(
    name: frontend_stacks[i],
    stack_category_id: 2
  )
end

10.times do |i|
  stack = Stack.create!(
    name: devops_stacks[i],
    stack_category_id: 3
  )
end

10.times do |i|
  stack = Stack.create!(
    name: data_stacks[i],
    stack_category_id: 4
  )
end

10.times do |i|
  stack = Stack.create!(
    name: mobile_stacks[i],
    stack_category_id: 5
  )
end

10.times do |i|
  stack = Stack.create!(
    name: project_management_stacks[i],
    stack_category_id: 6
  )
end

10.times do |i|
  stack = Stack.create!(
    name: ide_stacks[i],
    stack_category_id: 7
  )
end

10.times do |i|
  stack = Stack.create!(
    name: nocode_stacks[i],
    stack_category_id: 8
  )
end

10.times do
  user_stack = UsersStack.create!(
    user_id: Faker::Number.between(from: 1, to: 10),
    stack_id: Faker::Number.between(from: 1, to: 10)
  )
end

10.times do
  company_stack = CompaniesStack.create!(
    company_id: Faker::Number.between(from: 1, to: 10),
    stack_id: Faker::Number.between(from: 1, to: 10)
  )
end