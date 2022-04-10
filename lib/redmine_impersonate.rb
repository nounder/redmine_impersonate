module RedmineImpersonate
  def self.hook
    require File.expand_path("../#{self.name.underscore}/hook", __FILE__)
  end

  def self.install
    RedmineImpersonate.hook
  end
end
