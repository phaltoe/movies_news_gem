describe 'Findable Articles' do
  describe ".find_by_title" do
    it 'finds an article instance in @@all by the name property of the article' do
      article = MoviesNews::Article.create("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
      article.save

      expect(MoviesNews::Article.find_by_title("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")).to eq(article)
    end
  end

  describe ".find_or_create_by_title" do
    it 'finds or creates an article by name maintaining uniqueness of objects by their name property' do
      article_1 = MoviesNews::Article.find_or_create_by_title("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
      article_2 = MoviesNews::Article.find_or_create_by_title("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")

      expect(article_1).to eq(article_2)
    end
  end

  describe ".create_from_array" do
    it 'creates a new Article instance from the array of hashes' do
      array = [{:title=>"Quicksilver Makes a Move in X-Men Themed Sky Fibre Ad",
      :author=>"Spencer Perry",
      :story=>
       "20th Century Fox and Sky Fibre have teamed up to bring an X-Men themed ad for the UK based broadband service featuring Evan Peters’ Quicksilver doing what he does best. Check it out in the player below!RELATED: X-Men: Apocalypse Character GuideSince the dawn of civilization, he was worshiped as a god. Apocalypse, the first and most powerful mutant from Marvel’s X-Men universe, amassed the powers of many other mutants, becoming immortal and invincible. Upon awakening after thousands of years, he is disillusioned with the world as he finds it and recruits a team of powerful mutants, including a disheartened Magneto (Michael Fassbender), to cleanse mankind and create a new world order, over which he will reign. As the fate of the Earth hangs in the balance, Raven (Jennifer Lawrence) with the help of Professor X (James McAvoy) must lead a team of young X-Men to stop their greatest nemesis and save mankind from complete destruction.X-Men: Apocalypse also stars James McAvoy as Charles Xaver, Jennifer Lawrence as Mystique, Nicholas Hoult as Beast, Rose Byrne as Moira MacTaggert, Lucas Till as Havok and newcomers Alexandra Shipp as Storm, Sophie Turner as Jean Grey, Ben Hardy as Angel, Tye Sheridan as Cyclops, Olivia Munn as Psylocke and Lana Condor as Jubilee. Oscar Isaac is starring as the film’s title antagonist.RELATED: From the X-Men: Apocalypse Set!Said to be the conclusion of a trilogy started with X-Men: First Class and continued with X-Men: Days of Future Past, the Bryan Singer directed X-Men: Apocalypse is set for release on May 27, 2016."}]

       article = MoviesNews::Article.create_from_array(array)
       expect(article.title).to eq("Quicksilver Makes a Move in X-Men Themed Sky Fibre Ad")
       expect(article.author).to eq("Spencer Perry")
       expect(article.story).to eq("20th Century Fox and Sky Fibre have teamed up to bring an X-Men themed ad for the UK based broadband service featuring Evan Peters’ Quicksilver doing what he does best. Check it out in the player below!RELATED: X-Men: Apocalypse Character GuideSince the dawn of civilization, he was worshiped as a god. Apocalypse, the first and most powerful mutant from Marvel’s X-Men universe, amassed the powers of many other mutants, becoming immortal and invincible. Upon awakening after thousands of years, he is disillusioned with the world as he finds it and recruits a team of powerful mutants, including a disheartened Magneto (Michael Fassbender), to cleanse mankind and create a new world order, over which he will reign. As the fate of the Earth hangs in the balance, Raven (Jennifer Lawrence) with the help of Professor X (James McAvoy) must lead a team of young X-Men to stop their greatest nemesis and save mankind from complete destruction.X-Men: Apocalypse also stars James McAvoy as Charles Xaver, Jennifer Lawrence as Mystique, Nicholas Hoult as Beast, Rose Byrne as Moira MacTaggert, Lucas Till as Havok and newcomers Alexandra Shipp as Storm, Sophie Turner as Jean Grey, Ben Hardy as Angel, Tye Sheridan as Cyclops, Olivia Munn as Psylocke and Lana Condor as Jubilee. Oscar Isaac is starring as the film’s title antagonist.RELATED: From the X-Men: Apocalypse Set!Said to be the conclusion of a trilogy started with X-Men: First Class and continued with X-Men: Days of Future Past, the Bryan Singer directed X-Men: Apocalypse is set for release on May 27, 2016.")
    end
  end
end
