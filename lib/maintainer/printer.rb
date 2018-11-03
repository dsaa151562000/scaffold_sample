module Maintainer
  class Printer
    def self.members
      Member.where(Member.arel_table[:name].matches("%#{ARGV[0]}%")).each do |member|
        puts member.name
      end
    end
  end
end