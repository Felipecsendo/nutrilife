module Backoffice::PostsHelper
  
  def destroy_post_link_to(text, path, options)
    options = options[:options]
    link_to t(text), path,
      method: :delete,
      class: 'btn',
      data:{
        confirm: t('confirmations.destroy.body'),
        'confirm-fade': true,
        'confirm-cancel': t('confirmations.cancel'),
        'confirm-cancel-class': t('btn-default'),
        'confirm-proceed': t('confirmations.proceed'),
        'confirm-proceed-class': 'btn-danger',
        'confirm-title': t('confirmations.destroy.post', post_name: options[:title]),
      }
      
  end
end
