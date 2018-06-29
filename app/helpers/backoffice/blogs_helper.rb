module Backoffice::BlogsHelper

  def destroy_link_to(path, options)
    options = options[:options]
    link_to t('Destroy'), path,
      method: :delete,
      :class => 'btn',
      data:{
        confirm: t('destroy_confirm.body'),
        'confirm-fade' => true,
        'confirm-title': t('destroy_confirm.title', blog_post_name: options[:title]),
        'confirm-cancel' => t('destroy_confirm.cancel'),
        'confirm-cancel-class' => t('btn-default'),
        'confirm-proceed' => t('destroy_confirm.proceed'),
        'confirm-proceed-class' => 'btn-danger'
      }
  end

end