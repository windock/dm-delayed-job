Gem::Specification.new do |s|
  s.name = %q{dm-delayed-job}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors  = ["Tobias Lütke"]
  s.email    = "tobi@leetsoft.com"
  s.date = %q{2010-02-22}
  s.summary = %q{Database-backed asynchronous priority queue system -- Extracted from Shopify}
  s.description = %q{Delated_job (or DJ) encapsulates the common pattern of asynchronously executing longer tasks in the background. It is port to DataMapper of direct extraction from Shopify where the job table is responsible for a multitude of core tasks.}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    ".gitignore",
     "MIT-LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION",
     "init.rb",
     "lib/dm-delayed-job.rb",
     "lib/dm-delayed-job/job.rb",
     "lib/dm-delayed-job/message_sending.rb",
     "lib/dm-delayed-job/performable_method.rb",
     "lib/dm-delayed-job/worker.rb",
     "spec/database.rb",
     "spec/delayed_method_spec.rb",
     "spec/job_spec.rb",
     "spec/story_spec.rb",
     "tasks/jobs.rake",
     "tasks/tasks.rb"
  ]
  s.homepage = %q{http://github.com/windock/delayed_job}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.test_files = [
    "spec/database.rb",
     "spec/delayed_method_spec.rb",
     "spec/job_spec.rb",
     "spec/story_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

