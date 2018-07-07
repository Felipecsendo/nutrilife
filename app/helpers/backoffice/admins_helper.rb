module Backoffice::AdminsHelper
  def edit_admin_link_to(text, path, options)
      options = options[:options]
      link_to t(text), path,
        :class => 'btn',
        data:{
          confirm: t('confirmations.edit.body'),
          'confirm-fade' => true,
          'confirm-cancel' => t('confirmations.cancel'),
          'confirm-cancel-class' => t('btn-default'),
          'confirm-proceed' => t('confirmations.proceed'),
          'confirm-proceed-class' => 'btn-warning',
          'confirm-title': t('confirmations.edit.admin_title', admin_name: options[:title])
        }
  end
end