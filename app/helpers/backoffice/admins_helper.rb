module Backoffice::AdminsHelper
  def confirm_submit(field, text, options = {})
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
        'confirm-title': t('confirmations.edit.admin_title', item_name: options[:title])
      }
  end
end
