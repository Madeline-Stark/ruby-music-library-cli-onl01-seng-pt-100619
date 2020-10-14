class MusicImporter
    
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def files
        filename_array = Dir.glob("#{path}/*.mp3")
        filename_array.collect do |filename|
            filename.gsub("#{path}/", "")
        end

        # memoization
        # uses less memory
        # @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import
        files.each{ |f| Song.create_from_filename(f) }
    end

end 