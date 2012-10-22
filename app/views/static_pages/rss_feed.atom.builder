atom_feed :language => 'en-US' do |feed|
  feed.title "#{@user.name} Microposts"
  feed.updated Time.now

  @rss_feed.each do |item|
    next if item.created_at.blank?

    feed.entry( item ) do |entry|
      entry.title "Micropost #{item.id}"
      entry.content item.content 
      entry.author do |author|
        author.name User.find_by_id(item.user_id).name
      end
      # the strftime is needed to work with Google Reader.
      entry.updated(item.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
    end
  end
end

