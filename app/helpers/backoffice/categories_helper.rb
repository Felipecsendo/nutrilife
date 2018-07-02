module Backoffice::CategoriesHelper
  
  def destroy_category_link_to(text, path, options)
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
        'confirm-title': t('destroy_confirm.category_title', category_description: options[:title])
      }
      
  end
end
