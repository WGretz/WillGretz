desc 'clean site'
task :compile =>["compass:compile","jekyll:compile"]do
end

desc 'Deploy jekyll site'
task :deploy =>["env:prod",:compile] do
  system "cap deploy"
end

namespace :compass do  
  
  desc 'Delete temporary compass files'
  task :clean do
    system "rm -rf stylesheets"
  end

  desc 'Run the compass watch script'
  task :watch=>["env:dev"] do
    system "compass watch"
  end

  desc 'Compile sass scripts'
  task :compile do
    system "compass compile -s compressed"
  end
  
  desc 'Update dev site\'s'
  task :update => [:clean,:compile] do
    system "rm -rf _site/stylesheets"
    system "cp -R stylesheets _site/stylesheets"
  end
  
end

namespace :jekyll do
  
  desc 'Delete site directory'
  task :clean do
    system "rm -fR _site"
  end
  
  desc 'Compile website'
  task :compile => [:clean] do
    system "jekyll"
  end
  
end

desc "change environment"
namespace :env do
  desc "change to development environment"
  task :dev do
    puts "change to dev environment"
    updateConfig "env: dev"
  end

  desc "change to production environment"
  task :prod do
    puts "change to pro environment"
    updateConfig "env: prod"
  end
end
  
private 

def updateConfig(rep)
  lines = IO.readlines("_config.yml");
  lines[-1] = rep
  File.open("_config.yml","w") do |file|
    lines.each do |line|
      file.write(line)
    end
  end
end
  