module Backoffice::BlogsHelper

  def destroy_link_to(path, options = {})
    link_to t('Destroy'), path,
      method: :delete,
      :class => 'btn',
      data:{
        confirm: t('Destroy', :item => options[:item]),
        'confirm-fade' => true,
        'confirm-title': t('Destroy', :item => options[:item]),
        'confirm-cancel' => t('.destroy_confirm.cancel', :item => options[:item]),
        'confirm-cancel-class' => t('btn-default'),
        'confirm-proceed' => t('.destroy_confirm.proceed', :item => options[:item]),
        'confirm-proceed-class' => 'btn-danger'
      }
  end

end