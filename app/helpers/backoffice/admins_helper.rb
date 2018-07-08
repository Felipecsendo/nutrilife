module Backoffice::AdminsHelper
  def edit_admin_submit(field, text, options)
      options = options[:options]
      field.submit text,
      class: 'btn',
      data:{
        confirm: t('confirmations.edit.body'),
        'confirm-fade': true,
        'confirm-cancel': t('confirmations.cancel'),
        'confirm-cancel-class': t('btn-default'),
        'confirm-proceed': t('confirmations.proceed'),
        'confirm-proceed-class': 'btn-warning',
        'confirm-title': t('confirmations.edit.admin_title', admin_name: options[:title])
      }
  end
  
  def destroy_admin_link_to(text, path, options)
    options = options[:options]
    link_to path,
      method: :delete,
      class: options[:class],
      data:{
        confirm: t('confirmations.destroy.body'),
        'confirm-fade': true,
        'confirm-cancel': t('confirmations.cancel'),
        'confirm-cancel-class': t('btn-default'),
        'confirm-proceed': t('confirmations.proceed'),
        'confirm-proceed-class': 'btn-danger',
        'confirm-title': t('confirmations.destroy.admin_title', admin_name: options[:title]),
      } do
        text
        raw options[:item]
        end
  end
     
end
