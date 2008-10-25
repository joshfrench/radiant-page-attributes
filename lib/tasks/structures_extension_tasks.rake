namespace :radiant do
  namespace :extensions do
    namespace :structures do
      
      desc "Runs the migration of the Structures extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          StructuresExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          StructuresExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Structures to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[StructuresExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(StructuresExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
