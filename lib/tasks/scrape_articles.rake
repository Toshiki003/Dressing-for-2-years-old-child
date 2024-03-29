namespace :scrape_articles do
  desc 'Scrape news articles and save them to the database'
  task fetch: :environment do
    require 'open-uri'
    require 'nokogiri'

    url = 'https://news.biglobe.ne.jp/list/018/258/%E5%B9%BC%E5%85%90.html'
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
    # # 記事リンクを取得する 一つずつの記事リンクからまだ取得できていないので、コメントアウト
    # doc.css('.news-list .bx .kw-news').take(6).each do |item|
    #   url = item.css('li a').attr('href')
    #   puts url
    #   sleep 1
    # end
    doc.css('.news-list .bx .kw-news li a .cap').take(6).each do |item|
      title = item.css('.kw-title').text
      content = item.css('.kw-sum').text
      date = item.css('.date').text
    # image_url = item.css('div.img.lazy').first.attr('style').match(/url\('(.*)'\)/)[1] 画像はまだ取得しない
      sleep 1
      Article.find_or_create_by(title: title, content: content, date: date)
    end
  end
  puts 'Scraping completed!'
end
