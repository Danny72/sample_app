atom_feed :language => 'en-US' do |feed|
  feed.title "#{@user.name} Microposts"
  feed.updated Time.now

  @microposts.each do |item|
    next if item.created_at.blank?

    feed.entry( item ) do |entry|
      entry.title "Micropost #{item.id}"
      entry.content item.content

      # the strftime is needed to work with Google Reader.
      entry.updated(item.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
      entry.author @user.name
    end
  end
end

