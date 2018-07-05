module I18nHelper
  def t(*args)
    I18n.translate!(*args)
  end
end