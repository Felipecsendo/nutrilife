module Backoffice::BlogsHelper
  
  def destroy_blog_link_to(text, path, options)
    options = options[:options]
    link_to t(text), path,
      method: :delete,
      :class => 'btn',
      data:{
        confirm: t('destroy_confirm.body'),
        'confirm-fade' => true,
        'confirm-cancel' => t('destroy_confirm.cancel'),
        'confirm-cancel-class' => t('btn-default'),
        'confirm-proceed' => t('destroy_confirm.proceed'),
        'confirm-proceed-class' => 'btn-danger',
        'confirm-title': t('destroy_confirm.blog_title', blog_post_name: options[:title]),
      }
      
  end
end
