module ApplicationHelper
  def default_meta_tags
    {
      site: 'D2C Dressing 2 years old children',
      title: '2歳児の身支度の工夫を共有できる投稿サービス',
      reverse: true,
      charset: 'utf-8',
      description: 'イヤイヤ期のお子さんの身支度を楽しくする工夫を共有できます。',
      keywords: '2歳児,身支度,イヤイヤ期,投稿サービス',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.png'), size: '32x32' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image',
        site: '@',
        image: image_url('ogp.png')
      }
    }
  end

  def turbo_stream_flash
    turbo_stream.update 'flash', partial: 'shared/flash_message'
  end

  # アクションごとにビューのactiveを切り替える
  def active_if(controller, action)
    "#{controller_path}/#{action}" == "#{controller}/#{action_name}" ? 'active' : ''
  end
end
