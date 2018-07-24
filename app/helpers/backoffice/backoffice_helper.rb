module Backoffice::BackofficeHelper
  #"{:options=>{:title=>"Morgana Ouriquess", :class=>"btn btn-danger btn-circle"}}"
  #{:options=>{:title=>"Vinicius Godinho Jr.", :class=>"btn btn-danger btn-circle"}}
  def confirm_link_to(text, path, options = {})
    options = options[:options]
    link_to path,
      method: :delete,
      class: options.fetch(:class, 'btn'),
      data:{
        'confirm': options.fetch(:confirm, t('confirmations.destroy.body')),
        'confirm-fade': true,
        'confirm-cancel': options.fetch(:confirm_cancel,
                                        t('confirmations.cancel')),
        'confirm-cancel-class': options.fetch(:confirm_cancel_class,
                                              t('btn-default')),
        'confirm-proceed': options.fetch(:confirm_proceed,
                                         t('confirmations.proceed')),
        'confirm-proceed-class': options.fetch(:confirm_proceed_class,
                                               'btn-danger'),
        'confirm-title': t('confirmations'\
                            ".#{options.fetch(:confirm_title, 'destroy')}"\
                            ".#{controller_name.singularize.downcase}_title",
                            item_name: options.fetch(:title, ''))
      } do
        raw text
    end
  end
  def message_notices(noticer)
      noticer.errors.full_messages.each do |message| 
        if flash[:notice].nil?
          flash[:notice] = [message]
        else
          flash[:notice] << message
        end
      end
  end

end