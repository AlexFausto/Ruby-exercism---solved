# better use a module because we don't need .new
module Tournament
  # class variables
  @@teams = []
  @@matches = []
  @@score_table = []

  # methods are called in reverse order, from bottom to tops
  def self.construct_output
    # finally we need to construct the output 
    tally = "Team                           | MP |  W |  D |  L |  P\n"
    # and we do it as a string
    @@score_table.each do |hash|
      # just scary string formatting 
      tally += "%{Team}"%hash + " "*(31-hash[:Team].length) +"|  %{MP} |  %{W} |  %{D} |  %{L} |  %{P}\n"%hash
    end
    # because heredoc is basically a string 
    tally
  end

  def self.score_table
    # we take the teams one by one
    @@teams.each do |team|
      # the needed values for each team
      _mp, _w, _d, _l, _p = 0, 0, 0, 0, 0
      # we select the matches in which the current team has participated
      @@matches.select{|hash| hash.values.include?(team)}.each do |match| 
        # and we adjust the values based on the score
        _mp += 1
        if team == match[:team1]
          case match[:score] 
          when "win"
            _w += 1
            _p += 3
          when "loss"
            _l += 1
          when "draw"
            _d += 1
            _p += 1
          end
        else 
          case match[:score] 
          when "win"
            _l += 1
          when "loss"
            _w += 1
            _p += 3
          when "draw"
            _d += 1
            _p += 1
          end
        end
      end
      # after we calculate all the values for a team
      # we save everything as a hash, in an array  
      @@score_table << { :Team => team,
                         :MP => _mp,
                         :W => _w,
                         :D => _d,
                         :L => _l,
                         :P => _p }
    end
    # we need the table sorted first by the score descending
    # then by the team names ascending 
    @@score_table.sort_by!{|team| [-team[:P], team[:Team]]}
  end

  def self.extract_teams
    # from all the matches 
    @@matches.each do |m|
      # we test both teams from a match if they are included 
      @@teams << m[:team1] unless @@teams.include? m[:team1]
      @@teams << m[:team2] unless @@teams.include? m[:team2]
      # and we save them in an array if they aren't already 
    end
  end

  def self.matches(heredoc)
    # we split the initial heredoc into lines
    heredoc.lines.each do |line|
      # we selete the new line from the end 
      line.delete_suffix!("\n")
      # test for empty string
      return if line.empty? 
      # array of 2 teams and the score
      a = line.split(";")
      # we save the matches as an array of hashes 
      @@matches << { :team1 => a[0],
                     :team2 => a[1],
                     :score => a[2] }
    end
  end

  def self.parse_matches(input)
    # first we take the matches from the heredoc 
    Tournament.matches(input)
    # then we take the teams from the matches 
    Tournament.extract_teams
    # last we make the score table 
    Tournament.score_table
  end

  def self.first_things_first
    # we need to reinitialize the class variables each time
    @@teams = []
    @@matches = []
    @@score_table = []
  end

  def self.tally(input)
    # calling the methods in order
    Tournament.first_things_first 
    Tournament.parse_matches(input)
    Tournament.construct_output
  end
end